class UserBean {
  int? code;
  UserBeanData? data;
  String? msg;
  bool? success;
  String? traceId;

  UserBean({
    this.code,
    this.data,
    this.msg,
    this.success,
    this.traceId,
  });

  UserBean.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    data = json["data"] == null ? null : UserBeanData.fromJson(json[data]);
    msg = json["msg"];
    success = json["success"];
    traceId = json["traceId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["msg"] = msg;
    _data["success"] = success;
    _data["traceId"] = traceId;
    return _data;
  }
}
class UserBeanData {
  dynamic commodityFalls;
  dynamic commoditySlide;
  dynamic imageAndTxtSlideToMh;
  dynamic lineTitle;
  dynamic slideshowToMh;

  UserBeanData({
    this.commodityFalls,
    this.commoditySlide,
    this.imageAndTxtSlideToMh,
    this.lineTitle,
    this.slideshowToMh,
  });

  UserBeanData.fromJson(Map<String, dynamic> json) {
    commodityFalls = json["commodityFalls"];
    commoditySlide = json["commoditySlide"];
    imageAndTxtSlideToMh = json["imageAndTxtSlideToMh"];
    lineTitle = json["lineTitle"];
    slideshowToMh = json["slideshowToMh"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["commodityFalls"] = commodityFalls;
    _data["commoditySlide"] = commoditySlide;
    _data["imageAndTxtSlideToMh"] = imageAndTxtSlideToMh;
    _data["lineTitle"] = lineTitle;
    _data["slideshowToMh"] = slideshowToMh;
    return _data;
  }
}
