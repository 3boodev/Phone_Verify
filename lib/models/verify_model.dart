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

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['valid'] = valid;
    data['number'] = number;
    data['local_format'] =localFormat;
    data['international_format'] = internationalFormat;
    data['country_prefix'] =countryPrefix;
    data['country_code'] = countryCode;
    data['country_name'] = countryName;
    data['location'] = location;
    data['carrier'] = carrier;
    data['line_type'] =lineType;
    return data;
  }*/
}
/*
class DataModel{
  final int id;
  final int userId;
  final String title;

  DataModel({required this.id, required this.userId, required this.title});

  factory DataModel.fromJson(Map<String,dynamic> json){
    return DataModel(id: json['id'], userId: json['userId'], title: json['title']);
  }
}*/
