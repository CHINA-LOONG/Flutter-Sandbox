
class BannerEntity{

  List<BannerData>? data;
  int? errorCode;
  String? errorMsg;

// 2. Dart 3 简化的fromJson构造方法（命名构造函数）
  BannerEntity.fromJson(Map<String, dynamic> json) {
    // 处理data列表：简化初始化+遍历，省略new关键字
    if (json['data'] != null) {
      data = (json['data'] as List<dynamic>) // 显式指定List泛型为dynamic（更严谨）
          .map((v) => BannerData.fromJson(v as Map<String, dynamic>)) // 映射为BannerData
          .toList(); // 转换为List<BannerData>
    }

    // 处理基础类型：建议加类型断言（避免JSON类型不匹配导致的隐性错误）
    errorCode = json['errorCode'] as int?;
    errorMsg = json['errorMsg'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] =  this.data?.map((v) => v.toJson()).toList();
    }
    data['errorCode'] = errorCode;
    data['errorMsg'] = errorMsg;
    return data;
  }
}


class BannerData {
  String? imagePath;
  int? id;
  int? isVisible;
  String? title;
  int? type;
  String? url;
  String? desc;
  int? order;

  BannerData({this.imagePath, this.id, this.isVisible, this.title, this.type, this.url, this.desc, this.order});

  BannerData.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    id = json['id'];
    isVisible = json['isVisible'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
    desc = json['desc'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['id'] = this.id;
    data['isVisible'] = this.isVisible;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    data['desc'] = this.desc;
    data['order'] = this.order;
    return data;
  }
}