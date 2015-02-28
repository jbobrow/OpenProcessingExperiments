
class Artist {
  
  // instance variables
  String name;
  int age;
  int yearDrawn;
  
  // "outbound" relations
  Drawing[] drawings;
  
  // constructor
  Artist(String name_, int age_, int yearDrawn_) {
    name = name_;
    age = age_;
    yearDrawn = yearDrawn_;
  }
}

