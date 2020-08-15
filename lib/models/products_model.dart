class ProductsModel {
  String lNO;
  String lID;
  String lName;
  String lNote;
  String lStatus;
  String lDate;
  String lUser;

  ProductsModel(
      {this.lNO,
      this.lID,
      this.lName,
      this.lNote,
      this.lStatus,
      this.lDate,
      this.lUser});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    lNO = json['l_NO'];
    lID = json['l_ID'];
    lName = json['l_name'];
    lNote = json['l_note'];
    lStatus = json['l_status'];
    lDate = json['l_date'];
    lUser = json['l_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['l_NO'] = this.lNO;
    data['l_ID'] = this.lID;
    data['l_name'] = this.lName;
    data['l_note'] = this.lNote;
    data['l_status'] = this.lStatus;
    data['l_date'] = this.lDate;
    data['l_user'] = this.lUser;
    return data;
  }
}