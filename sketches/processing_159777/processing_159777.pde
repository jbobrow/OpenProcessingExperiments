
Quartz a = new Quartz();
Quartz b = new Quartz();
Quartz c = new Quartz();
Quartz d = new Quartz();
Quartz e = new Quartz();
Quartz f = new Quartz();
PImage quartz1;
PImage quartz2;
PImage quartz3;
PImage quartz4;
PImage quartz5;
PImage quartz6;

void setup() {
  size(900, 450);
  smooth();
  cursor(CROSS);
  
  quartz1 = loadImage("quartz_img1.png");
  quartz2 = loadImage("quartz_img2.png");
  quartz3 = loadImage("quartz_img3.png");
  quartz4 = loadImage("quartz_img4.png");
  quartz5 = loadImage("quartz_img5.png");
  quartz6 = loadImage("quartz_img6.png");
}

void draw() {
   background(255); 
   a.moveQuartz();
   a.drawQuartz1();
   b.moveQuartz();
   b.drawQuartz2();
   c.moveQuartz();
   c.drawQuartz3();
   d.moveQuartz();
   d.drawQuartz4();
   e.moveQuartz();
   e.drawQuartz5();
   f.moveQuartz();
   f.drawQuartz6();
}
void mouseMoved(){
  //normal movement would be (1,1)
  a.moveDestination(-.2, -.5);
  b.moveDestination(.5, .8);
  c.moveDestination(.5,.2);
  d.moveDestination(.3,-.8);
  e.moveDestination(-.3,.1);
  f.moveDestination(.2,.5);
}

class Quartz{
  int xPos;
  int yPos;
  //int xC;
  //int yC;
  int nX, nY;
  int X, Y;
  float xDist;
  float yDist;
  int delay;
  float easing;
  
  Quartz(){
    delay = 80;
    easing = .008;
    xPos = width/2;
    yPos = height/2;
    nX = X;
    nY = Y;
  }
  
  void moveDestination(float xP, float yP) {
    nX = int((mouseX*2) *xP);
    nY = int((mouseY*2) *yP);
  }
  
  void moveQuartz() {
    xPos+=(nX-xPos)*easing;
    yPos+=(nY-yPos)*easing;
  }
  
  void drawQuartz1() {
    image(quartz1, xPos+250, yPos+200);
  }
  
  void drawQuartz2() {
    image(quartz2, xPos+450, yPos+200);
  }
  
  void drawQuartz3() {
    image(quartz3, xPos+300 , yPos+175);
  }
  
  void drawQuartz4() {
    image(quartz4, xPos+400, yPos+100);
  }
  
  void drawQuartz5() {
    image(quartz5, xPos+400, yPos+100);
  }
  
  void drawQuartz6() {
    image(quartz6, xPos+400, yPos+100);
  }
}



