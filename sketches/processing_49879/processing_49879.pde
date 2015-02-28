
class CookMethod {
  
  // instance variables
  String type;
  String process;
  String tools;
  
  // "outbound" relations
  CountryOrig[] countryOrig;
  
  // constructor
  CookMethod(String type_, String process_, String tools_, CountryOrig[] countryOrig_) {
    type = type_;
    process = process_;
    tools = tools_;
    countryOrig = countryOrig_;
  }
}

