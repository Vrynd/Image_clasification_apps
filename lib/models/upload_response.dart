import 'package:online_image_classification/models/respon_data.dart';

class UploadResponse {
  final String message;
  final ResponseData? data;

  const UploadResponse({required this.message, this.data});

  factory UploadResponse.fromJson(Map<String, dynamic> map) {
    return UploadResponse(
      message: map['message'] as String,
      data: map["data"] == null
          ? null
          : ResponseData.fromJson(map['data'] as Map<String, dynamic>),
    );
  }
}
