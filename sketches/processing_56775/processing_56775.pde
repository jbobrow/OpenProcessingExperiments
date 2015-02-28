
class Grass {

  PVector loc; //location vector
  float c;

  Grass(PVector _loc) {
    loc = _loc.get();  
  }

  void display1() {

  stroke(#93B748);
  for (int i=0;i<30 ;i++) {
  line(loc.x,loc.y,loc.x+random(-20,20),loc.y+random(-60,60));
  }

  PVector targetLoc = new PVector(width/2, height/2);

  }

  void display2() {

  stroke(#7A8E50);
  for (int i=0;i<10 ;i++) {
  line(loc.x,loc.y,loc.x+random(-10,10),loc.y+random(-40,40));
  }

  PVector targetLoc = new PVector(width/2, height/2);

  }


}

