class VerifyModel {
  bool? valid;
  String? number;
  String? localFormat;
  String? internationalFormat;
  String? countryPrefix;
  String? countryCode;
  String? countryName;
  String? location;
  String? carrier;
  String? lineType;

  VerifyModel(
      {this.valid,
        this.number,
        this.localFormat,
        this.internationalFormat,
        this.countryPrefix,
        this.countryCode,
        this.countryName,
        this.location,
        this.carrier,
        this.lineType});

  VerifyModel.fromJson(Map<String, dynamic> json) {
    valid = json['valid'];
    number = json['number'];
    localFormat = json['local_format'];
    internationalFormat = json['international_format'];
    countryPrefix = json['country_prefix'];
    countryCode = json['country_code'];
    countryName = json['country_name'];
    location = json['location'];
    carrier = json['carrier'];
    lineType = json['line_type'];
  }
}