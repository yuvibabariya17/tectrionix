import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectrionix/Models/companyModel.dart';
import 'package:tectrionix/Utils/utils.dart';

class CompanyScreenController extends GetxController {
  RxList<CompanyModel> companyList = <CompanyModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    logcat("Controller onInit called", "");
    super.onInit();
    testMethod();
  }

  Future<List<CompanyModel>> testMethod() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse("https://fake-json-api.mock.beeceptor.com/companies"),
      );

      logcat("Response Status: ${response.statusCode}", "");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        companyList.clear();

        for (var item in data) {
          companyList.add(CompanyModel.fromJson(item));
        }

        logcat("Data loaded: ${companyList.length}", "");
        return companyList;
      } else {
        logcat("Error status code: ${response.statusCode}", "");
        return [];
      }
    } catch (e) {
      logcat("Exception occurred: $e", "");
      return [];
    } finally {
      isLoading(false);
    }
  }
}
