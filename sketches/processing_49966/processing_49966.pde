
class Food {
  
  // instance variables
  String dateConsumed;
  String foodType;
  String location;
  String company;
  String taste;
  String smell;
  
  // "outbound" relations
  
  // constructor
  Food(String dateConsumed_, String foodType_, String location_, String company_, String taste_, String smell_) {
    dateConsumed = dateConsumed_;
    foodType = foodType_;
    location = location_;
    company = company_;
    taste = taste_;
    smell = smell_;
  }
}

