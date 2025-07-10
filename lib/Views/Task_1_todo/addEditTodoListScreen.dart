// ignore_for_file: library_private_types_in_public_api

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';
import 'package:tectrionix/Core/Common/appbar.dart';
import 'package:tectrionix/Core/Constant/assets.dart';
import 'package:tectrionix/Core/Constant/string_const.dart';
import 'package:tectrionix/Core/Themes/color_const.dart';
import 'package:tectrionix/Models/Model.dart';

class AddEditTodoListScreen extends StatefulWidget {
  final Task? task;
  final List<String> categories;
  const AddEditTodoListScreen({super.key, this.task, required this.categories});

  @override
  _AddEditTodoListScreenState createState() => _AddEditTodoListScreenState();
}

class _AddEditTodoListScreenState extends State<AddEditTodoListScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController titleCtrl;
  DateTime? dueDate;
  String? category;

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.task?.title);
    dueDate = widget.task?.dueDate;
    category = widget.task?.category;
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.task != null;
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(Asset.appBg, fit: BoxFit.cover),
        ),
        Scaffold(
          body: Container(
            margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
            child: Column(
              children: [
                Container(
                  child: getCommonAppBar(
                    isEditing ? Strings.edittask : Strings.addTaskTitle,
                    () {
                      Get.back();
                    },
                  ),
                ),
                SizedBox(height: 2.h),
                FadeInLeft(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: titleCtrl,
                          decoration: InputDecoration(
                            labelText: Strings.titleLable,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator:
                              (v) => v!.isEmpty ? Strings.titleValidate : null,
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final d = await showDatePicker(
                                    context: context,
                                    initialDate: dueDate ?? DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100),
                                  );
                                  if (d != null) setState(() => dueDate = d);
                                },
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          Asset.calender,
                                          height: 0.5.h,
                                        ),
                                      ),
                                      labelText: Strings.dueDateLable,
                                    ),
                                    controller: TextEditingController(
                                      text:
                                          dueDate == null
                                              ? ''
                                              : dueDate!
                                                  .toLocal()
                                                  .toString()
                                                  .split(' ')[0],
                                    ),
                                    validator:
                                        (v) =>
                                            dueDate == null
                                                ? Strings.dateValidate
                                                : null,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        DropdownButtonFormField<String>(
                          dropdownColor: white,
                          value: category,
                          icon: const SizedBox.shrink(),
                          decoration: InputDecoration(
                            labelText: Strings.catLabel,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(Asset.dropdown),
                            ),
                          ),
                          items:
                              widget.categories
                                  .map(
                                    (c) => DropdownMenuItem(
                                      value: c,
                                      child: Text(c),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (v) => setState(() => category = v),
                          validator:
                              (v) => v == null ? Strings.catValidate : null,
                        ),
                        SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate() &&
                                dueDate != null) {
                              final box = Hive.box<Task>('tasksBox');
                              if (isEditing) {
                                final task = widget.task!;
                                task.title = titleCtrl.text;
                                task.dueDate = dueDate!;
                                task.category = category!;
                                task.save();
                              } else {
                                final id =
                                    DateTime.now().millisecondsSinceEpoch
                                        .toString();
                                box.add(
                                  Task(
                                    id: id,
                                    title: titleCtrl.text,
                                    dueDate: dueDate!,
                                    category: category!,
                                  ),
                                );
                              }
                              Get.back();
                            }
                          },
                          child: Container(
                            height: 6.h,
                            width: double.infinity / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: black,
                            ),
                            child: Center(
                              child: Text(
                                isEditing
                                    ? Strings.saveChanges
                                    : Strings.addTaskTitle,
                                style: TextStyle(
                                  color: white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
