
// define vars
int RbackGround;
int GbackGround;
int BbackGround;

// initialize objects
MyTriangle t1= new MyTriangle(300, 320, 360); 
MyTriangle t2= new MyTriangle(270, 320, 360); 
MyTriangle t3= new MyTriangle(240, 320, 360); 
MyTriangle t4= new MyTriangle(210, 320, 360); 
MyTriangle t5= new MyTriangle(180, 320, 360); 
MyTriangle t6= new MyTriangle(150, 320, 360); 
MyTriangle t7= new MyTriangle(120, 320, 360); 
MyTriangle t8= new MyTriangle(90, 320, 360); 
MyTriangle t9= new MyTriangle(60, 320, 360); 
MyTriangle t10= new MyTriangle(30, 320, 360); 


void setup(){ 
  size(640,640); 
  RbackGround = int(random(150)+100); //Red value for background 
  GbackGround = int(random(150)+100); //Green value for background 
  BbackGround = int(random(150)+100); //Blue value for background 
  background(RbackGround, GbackGround, BbackGround);
  //frameRate(30); 
} 
 
void draw(){ 
  smooth();
  fill(RbackGround,GbackGround,BbackGround,20);
  rect(0,0,width,height);
  fill(255);
  t1.update(1.9); 
  t2.update(1.8); 
  t3.update(1.7); 
  t4.update(1.6); 
  t5.update(1.5); 
  t6.update(1.4); 
  t7.update(1.3); 
  t8.update(1.2); 
  t9.update(1.1); 
  t10.update(1); 
} 
 
class MyTriangle { 
  float tp1X, tp1Y, tp2X, tp2Y, tp3X, tp3Y, radius, centerX, centerY; 
  MyTriangle (float pRadius, float pCenterX, float pCenterY){ 
    radius = pRadius; 
    centerX = pCenterX; 
    centerY = pCenterY; 
  } 
  void update(float x){ 
    tp1X = (cos(radians(30+(mouseX*x))) * radius) + width/2; 
    tp1Y = (sin(radians(30+(mouseX*x))) * radius) + height/2; 
    tp2X = (cos(radians(150+(mouseX*x))) * radius) + width/2; 
    tp2Y = (sin(radians(150+(mouseX*x))) * radius) + height/2; 
    tp3X = (cos(radians(270+(mouseX*x))) * radius) + width/2; 
    tp3Y = (sin(radians(270+(mouseX*x))) * radius) + height/2;
    stroke(RbackGround,GbackGround,BbackGround);
    triangle(tp1X, tp1Y, tp2X, tp2Y, tp3X, tp3Y); 
  } 
} 

