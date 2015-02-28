
int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;

float deg, degTwo, degThree;

void setup() {
  size(1200,400);
  background (255);
  
  xOne = -100;
  yOne = -100;
  
  xTwo = -100;
  yTwo = 100;
  
  xThree = 100;
  yThree = -100;
  
  xFour = 100;
  yFour = 100;
  
  deg = 0.0;
  degTwo = 0.0;
  degThree = 0.0;
  
}
  void draw() {
//  background (255);
    
  pushMatrix();
  translate (250, height/2) ;  
  deg+=10.0;
  float rad = radians(deg);
  rotate (rad);
  smooth();
  stroke(253,167,255);
  line(xOne+75, yOne, xFour+75, yFour);
  line(xTwo+50, yTwo-75, xThree+50, yThree-75);
  popMatrix();
  
  
  pushMatrix();
  translate (600, height/2) ;  
  degTwo+=2.5;
  float radTwo = radians(degTwo);
  rotate (radTwo);
  smooth();
  stroke(167,245,255);
  line(xOne, yOne+75, xFour, yFour+75);
  line(xTwo-100, yTwo, xThree-100, yThree);
  popMatrix();
  
  pushMatrix();
  translate (950, height/2) ;  
  degThree+=1.0;
  float radThree = radians(degThree);
  rotate (radThree);
  smooth();
  stroke(187,255,167);
  line(xOne-75, yOne+100, xFour-75, yFour+100);
  line(xTwo+75, yTwo-50, xThree+75, yThree-50);
  popMatrix();

  
  }




