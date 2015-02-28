
class Artist {
  
  // instance variables
  String name;
  String home;
  int age;
  
  // "outbound" relations
  Drawing[] drawings;
  
  // constructor
  Artist(String name_, String home_, int age_) {
    name = name_;
    home = home_;
    age = age_;
  }
}

