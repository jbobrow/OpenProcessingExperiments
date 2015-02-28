
int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;

float deg, degTwo, degThree;

void setup() {
  
  size(800,800);
  
  xOne = -50;
  yOne = -50;
  
  xTwo = -50;
  yTwo = 50;
  
  xThree = 50;
  yThree = -50;
  
  xFour = 50;
  yFour = 50;
 
  deg = 0.0;
  degTwo = 0.0;
  degThree = 0.0; 
  

}

void draw() {
  
  background(255);
  
  rectMode(CENTER);
  
  pushMatrix();
  translate(width/2, height/2);
  
  if(mousePressed==true) {
    deg+=2;
  }
  
  float rad = radians(deg);
  rotate(rad);
  
  fill(255,0,0);
  rect(xOne, yOne, 50, 50);
  rect(xTwo, yTwo, 50, 50);
  rect(xThree, yThree, 50, 50);
  rect(xFour, yFour, 50, 50);
  popMatrix();
  
  
  //green circles
  pushMatrix();
  translate(width/2, height/2);
  
  if(mousePressed==true) {
    degTwo-=4;
  }
  
  float radTwo = radians(degTwo);
  rotate(radTwo);
  
  fill(0,255,0);
  ellipse(xOne*2, yOne*2, 50, 50);
  ellipse(xTwo*2, yTwo*2, 50, 50);
  ellipse(xThree*2, yThree*2, 50, 50);
  ellipse(xFour*2, yFour*2, 50, 50);
  popMatrix();
  

  //blue cirlces
  pushMatrix();
  translate(width/2, height/2);
  
  if(mousePressed==true) {
    degThree+=2;
  }
    
  float radThree = radians(degThree);
  rotate(radThree);
  
  fill(0,0, 255);
  ellipse(xOne*3, yOne*3, 50, 50);
  ellipse(xTwo*3, yTwo*3, 50, 50);
  ellipse(xThree*3, yThree*3, 50, 50);
  ellipse(xFour*3, yFour*3, 50, 50);
  popMatrix();
  
  
  
}


