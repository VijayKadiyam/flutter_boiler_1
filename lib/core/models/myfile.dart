class MyFile {
  String? file;
  String? fileName;

  MyFile({this.file, this.fileName});

  MyFile.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    fileName = json['file_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file'] = file;
    data['file_name'] = fileName;
    return data;
  }
}
