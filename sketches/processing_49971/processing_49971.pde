
class Atmosphere {
  
  // instance variables
  String generalVibe;
    /*
    Sample desciptors of generalVibe:
    "Laid Back"
    "Dingy"
    "Hipster"
    "Bear Bar"
    */
  String customerType;
    /*
    Sample desciptors customerType:
    "Young"
    "Old"
    "Hipster"
    "Hicks"
    */
  String specialAttractions;
    /*
    Sample desciptors specialAttractions:
    "Karaoke"
    "Billiards"
    "Shuffle Board"
    "Darts"
    */
    
  // "outbound" relations
  Customer[] customers;
  
  // constructor
  Atmosphere(String generalVibe_, String customerType_, String specialAttractions_, Customer[] customers_) {
    generalVibe = generalVibe_;
    customerType = customerType_;
    specialAttractions = specialAttractions_;
    customers = customers_;
  }
}

