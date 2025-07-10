// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tectrionix/Core/Common/appbar.dart';
import 'package:tectrionix/Core/Constant/assets.dart';
import 'package:tectrionix/Core/Constant/string_const.dart';
import 'package:tectrionix/Core/Themes/color_const.dart';
import 'package:tectrionix/Core/Themes/font_const.dart';
import 'package:tectrionix/Models/Model.dart';
import 'package:tectrionix/Views/Task_1_todo/addEditTodoListScreen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final taskBox = Hive.box<Task>('tasksBox');
  final categories = [
    'Work',
    'Personal',
    'Shopping',
    'Health',
    'Study',
    'Home',
    'Finance',
    'Travel',
    'Meeting',
    'Other',
  ];
  String? filterCategory;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(Asset.appBg, fit: BoxFit.cover),
        ),
        Scaffold(
          floatingActionButton: GestureDetector(
            onTap: () {
              Get.to(AddEditTodoListScreen(categories: categories));
            },
            child: Container(
              height: 5.h,
              width: 30.w,
              margin: EdgeInsets.only(right: 1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Strings.addTaskTitle,
                    style: TextStyle(
                      color: white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.add, color: white),
                ],
              ),
            ),
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5.h),
                child: getFilterAppBar(Strings.toDoListTitle, () {
                  Get.back();
                }, onFilterTap: showFilterDialog),
              ),
              Flexible(
                child: ValueListenableBuilder(
                  valueListenable: taskBox.listenable(),
                  builder: (context, Box<Task> box, _) {
                    List<Task> tasks = box.values.toList();
                    if (filterCategory != null) {
                      tasks =
                          tasks
                              .where((t) => t.category == filterCategory!)
                              .toList();
                    }
                    if (tasks.isEmpty) {
                      return Center(
                        child: Text(
                          Strings.noTask,
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (ctx, i) {
                        final task = tasks[i];
                        return Dismissible(
                          key: Key(task.id),
                          background: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: red,
                            ),

                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(Icons.delete, color: white),
                          ),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            taskBox.delete(task.key);
                          },
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                AddEditTodoListScreen(
                                  task: task,
                                  categories: categories,
                                ),
                              );
                            },
                            child: FadeInLeft(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 5.w,
                                  right: 5.w,
                                  top: 1.5.h,
                                  bottom: 1.5.h,
                                ),
                                padding: EdgeInsets.only(
                                  left: 3.w,
                                  right: 3.w,
                                  top: 1.h,
                                  bottom: 1.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: black.withOpacity(0.2),
                                      spreadRadius: 0.1,
                                      blurRadius: 5,
                                      offset: const Offset(0.2, 0.2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: task.isCompleted,
                                      activeColor: black,
                                      onChanged: (v) {
                                        task.isCompleted = v!;
                                        task.save();
                                      },
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: Strings.title,
                                              style: TextStyle(
                                                fontFamily: gilroyMedium,
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.w600,
                                                color: black,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      task.title.capitalize
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontFamily: gilroyMedium,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    decoration:
                                                        task.isCompleted
                                                            ? TextDecoration
                                                                .lineThrough
                                                            : null,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 0.5.h),

                                          RichText(
                                            text: TextSpan(
                                              text: Strings.dueDate,
                                              style: TextStyle(
                                                fontFamily: gilroyMedium,
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.w600,
                                                color: black,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      task.dueDate
                                                          .toLocal()
                                                          .toString()
                                                          .split(' ')[0],
                                                  style: TextStyle(
                                                    fontFamily: gilroyMedium,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 0.5.h),
                                          RichText(
                                            text: TextSpan(
                                              text: Strings.category,
                                              style: TextStyle(
                                                fontFamily: gilroyMedium,
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.w600,
                                                color: black,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: task.category,
                                                  style: TextStyle(
                                                    fontFamily: gilroyMedium,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showFilterDialog() {
    String? tempSelected = filterCategory;
    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              backgroundColor: white,
              title: Text(
                Strings.filterByCategory,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(Strings.all),
                        trailing:
                            tempSelected == null
                                ? Icon(Icons.check, color: green)
                                : null,
                        onTap: () {
                          setStateDialog(() {
                            tempSelected = null;
                          });
                          setState(() {
                            filterCategory = null;
                          });

                          Navigator.pop(ctx);
                        },
                      ),
                      ...categories.map(
                        (category) => ListTile(
                          title: Text(
                            category,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing:
                              tempSelected == category
                                  ? Icon(Icons.check, color: green)
                                  : null,
                          onTap: () {
                            setStateDialog(() {
                              tempSelected = category;
                            });
                            setState(() {
                              filterCategory = category;
                            });
                            Navigator.pop(ctx);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
        );
      },
    );
  }
}
