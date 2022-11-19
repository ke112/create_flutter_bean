class Example {
  int? code;
  dynamic commodityFalls;
  dynamic commoditySlide;
  dynamic imageAndTxtSlideToMh;
  dynamic lineTitle;
  dynamic slideshowToMh;

  Example({
    this.commodityFalls,
    this.commoditySlide,
    this.imageAndTxtSlideToMh,
    this.lineTitle,
    this.slideshowToMh,
  });

  Example.fromJson(Map<String, dynamic> json) {
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
  dynamic msg;
  dynamic success;
  dynamic traceId;

  Example({
    this.commodityFalls,
    this.commoditySlide,
    this.imageAndTxtSlideToMh,
    this.lineTitle,
    this.slideshowToMh,
  });

  Example.fromJson(Map<String, dynamic> json) {
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
