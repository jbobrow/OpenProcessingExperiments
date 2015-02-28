
//KESHIA.KINGSLEY_QUESTION 5_ CLASS
//-------------------------------------------------------------
pandaBody p;

void setup() {
  smooth();
  size(500, 500);
  
  p= new pandaBody ();
  
}

void draw () {
  background(191, 83, 222);
  p.displayArm();
  p.displayLeg();
  p.displayBody();
  p.displayEar();
  p.displayFace();
  p.displayEye();
  p.displayNose();
   p.move();
  
}

class pandaBody {
  float x= pmouseX;
  float y= pmouseY;
  
  void move() {
    x= mouseX;
    y= mouseY;
  }
  
  void displayLeg() {
    fill(0);
ellipse(x-40, y+295, 52, 134);
fill(255);
ellipse(x-40,y+330, 26, 12);
fill(0);
ellipse(x+38, y+292, 52, 134);
fill(255);
ellipse(x+40, y+330, 26, 12);
  }
  
  void displayArm() {
    fill(0);
ellipse(x-55, y+105, 83, 38);
fill(0);
ellipse(x-75, y+105, 80, 38);
fill(0);
ellipse(x+66,y+105, 82, 38);
ellipse(x+78, y+105, 80, 38);
  }
  
 void displayBody() {
fill(255);
ellipse(x,y+177, 120, 200);
fill(255);
ellipse(x, y+177, 66, 166);
} 
void displayEar() {
  //ears
fill(0);
ellipse(x-60, y-60, 45, 53);
ellipse(x+65, y-60, 45, 53);
}
  
  void displayFace() {
    fill(0);
  fill(255);
ellipse(x, y, 160, 160);
fill(255);
ellipse(x, y+45, 55, 25);
  }
  
  void displayEye() {
    fill(0);
ellipse(x-35, y-35, 13, 40);
fill(255);
ellipse(x-36, y-50, 6, 9);
fill(0);
ellipse(x+35, y-35, 13, 40);
fill(255);
ellipse(x+35, y-50, 6, 9);
  }

void displayNose() {
fill(0);
ellipse(x+0, y+10, 12, 9);
}


  
  }


