


class CommonEntity{

  dynamic? data;

  int? errorCode;

  String? errorMsg;

  CommonEntity({this.data, this.errorCode, this.errorMsg});


  CommonEntity.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['errorCode'] = errorCode;
    data['errorMsg'] = errorMsg;
    return data;
  }
}