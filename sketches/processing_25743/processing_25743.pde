
Bug bug1;
Bug bug2;

void setup() {
  size(400,400);
  smooth();
  /*color tempCHead, color tempCBody, color tempCEyes, color tempMouth, 
  int tempX, int tempY, int tempW, int tempH, tempHeadR, int tempEyeR */
  
  bug1 = new Bug(color(255,114,180), color(150,200,0), color(50), color(0),
  width/2, height/2, 90, 40, 50); 
  
  bug2 = new Bug(color(207,114,255), color(255,192,0), color(50), color(0),
  width/4, height/4, 40, 20, 25);
}

void draw() {
  background(255);

  
  bug1.move();
  bug1.display();
  bug2.move();
  bug2.display();
}


