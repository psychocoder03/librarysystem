
class UserDetails{
  String? displayName ;
  String? email;
  String? photoURL;

  //constructor
  UserDetails({
    this.displayName,this.email, this.photoURL
  }
  );
  //map
  UserDetails.fromJSON(Map<String , dynamic > json ){
    displayName= json["displayName"];
    photoURL = json["photoURL"];
    email = json["email"];
  }
  Map<String,dynamic> toJson()
  {
    //object - data
    final Map<String,dynamic> data = <String, dynamic>{};
    data["displayName"] = displayName;
    data["email"] = email;
    data["photoURL"] = photoURL;

    return data;

  }
}