
class Audience {
  
  // instance variables
    String bookClub;
    String school;
    String male;
    String female;
    String race;
    String age;
    String culture;
     
  // "outbound" relations
  Oprah [] oprah;
  Decisions [] decisions;

  // constructor
  Audience(String bookClub_, String school_, String male_, String female_, String race_, String age_, String culture_, Oprah [] oprah_, Decisions [] decisions_) {
    bookClub = bookClub_;
    school = school_;
    male = male_;
    female = female_;
    race = race_;
    age = age_;
    culture = culture_;
    oprah = oprah_;
    decisions = decisions_;
  }
}

