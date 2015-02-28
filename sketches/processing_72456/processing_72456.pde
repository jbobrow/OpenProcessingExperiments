
class Clown {

  Eyes myEyes;
  Nose myNose;
  Head myHead;
  Mouth myMouth;
  Hair myHair;

  float PosX, PosY;


  Clown(float x, float y) {
    PosX = x;
    PosY = y;
    myHead = new Head (PosX, PosY+30, random(90, 180), random(70, 140), color(255, random(207,220), random(50,116)));
    myEyes = new Eyes (PosX, PosY, 60, 60, color(random(255), random(255), random(255)), 80, 50); 
    myNose = new Nose (PosX, PosY+30, 50, color(random(100,255), 0, 0), 10, 25);
    myMouth = new Mouth (PosX, PosY+80, random(70, 100), random(10, 100), color(255, 0, 0));
    myHair = new Hair (PosX, PosY+20, 100, 100, color(random(255), random(255), random(255)));
  }

  void display() {
    myHair.display();
    myHead.display();
    myEyes.display();
    myNose.display();
    myMouth.display();
  }
}


