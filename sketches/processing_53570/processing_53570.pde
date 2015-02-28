

//KESHIA.KINGSLEY_QUESTION 6. PS2
//--------------------------------------------------------------
pandaBody p;
pandaBody p2;

void setup () {
  size(600, 300);
  smooth();
  
  p= new pandaBody ();
  p2= new pandaBody();
}

void draw() {
  background(233, 95, 67);
  p.displayEar();
  p.displayFace();
  p.displayEye();
  p.displayNose();
  p2.displayEar2();
  p2.displayFace2();
  p2.displayEye2();
  p2.displayNose2();
  p2.displayBlush2();
  p.move();
  p2.move();
}

class pandaBody {
  float x= width/2;
  float y= height/2;
  
  void move() {
    x=mouseX;
    y= mouseY;
  }
  

  void displayEar() {
  //ears
fill(0);
ellipse(x+141, y-61, 45, 53);
ellipse(x+252, y-63, 45, 53);
}
  
  void displayFace() {
    fill(0);
  fill(255);
ellipse(x+200, y, 160, 160);
fill(255);
ellipse(x+200, y+45, 55, 25);
  }
  
  void displayEye() {
    fill(0);
ellipse(x+165, y-35, 13, 40);
fill(255);
ellipse(x+165, y-50, 6, 9);
fill(0);
ellipse(x+231, y-35, 13, 40);
fill(255);
ellipse(x+231, y-50, 6, 9);
  }

void displayNose() {
fill(0);
ellipse(x+200, y+10, 12, 9);
}



void displayEar2() {
  //ears
fill(0);
ellipse(x-60, y-60, 45, 53);
ellipse(x+65, y-60, 45, 53);
}
  
  void displayFace2() {
    fill(0);
  fill(255);
ellipse(x, y, 160, 160);
fill(255);
ellipse(x, y+45, 55, 25);
  }
  
  void displayEye2() {
    fill(0);
ellipse(x-35, y-35, 13, 40);
fill(255);
ellipse(x-36, y-50, 6, 9);
fill(0);
ellipse(x+35, y-35, 13, 40);
fill(255);
ellipse(x+35, y-50, 6, 9);
  }

void displayNose2() {
fill(0);
ellipse(x+0, y+10, 12, 9);
}
void displayBlush2() {
  fill(275, 0, 0, 45);
ellipse(x+155, y+5, 20, 10);
ellipse(x+238, y+5, 20, 10);
}
}

