
//Lillie Ferris
//September 19th 2012
//liferris@andrew.cmu.edu

float bx, by, bd;
float bxSpeed, bySpeed;

float px, py, pSize;
float pxSpeed, pySpeed;

PImage p;
void setup() {
  size(400, 400);
  smooth();
  bx = 0;
  by = random(height);
  bd = 80;
  bxSpeed = 5;
  
  //loads moon
  p = loadImage( "moon.png");
  imageMode( CENTER );
  
  px = 100;
  py = random(height);
  pSize = 120;
  pxSpeed = 3;
  
   //controls wrap
  bx = random(0,400);
  by = random(0,400);
  bd = 100;
  //bht = 100;
  bxSpeed = random(3, 5);
  bySpeed = random(3, 5);
   
  //controls bounce
  px = random(0,400);
  py = random(0,400);
  pSize = 130;
//  pht = 100;
  pxSpeed = random(3, 3.2);
  pySpeed = random(3, 3.2);
}
  

//prep
void draw() {
  prepWindow();
  moveBall();
  drawBall(bx, by, bd);
  drawImage(px, py, pSize);
  moveImage();
  
}
  //moves moon
void moveImage() {

  px = px + pxSpeed;
  py = py + pySpeed;
   
  if (px > width - 55 || px < 50){    //russell andrews copyright
   pxSpeed *= -1.01;
  }
  if (py > height - 50 || py < 50) {
   pySpeed *= -1;
  }
}

//draws moon
void drawImage(float px, float py, float pSize)
{
 // fill (0, 0, 255);
 // ellipse(px, py, pSize*1.5, pSize*2);
  image(p, px, py, pSize, pSize);
}

//draws galaxy  
  void prepWindow(){
    PImage img;
    img = loadImage("sky.png", 70);
    background(img);
   // fill (#0E1019, 70); 
    //noStroke();
    rect(0, 0, width, height);
  }
  
  //moves ball
  void moveBall (){
  bx = bx + bxSpeed;
  by = by + bySpeed;
  
  if (bx > width + 50 || bx < -50){    //russell andrews copyright
    bx = -50;
  }
  if (by > height + 50 || by < -50){
    by = -50;
  }
}
  //draws ball
  void drawBall (float x, float y, float d)
  {
//pushStyle();
    noFill();
    stroke(100);
    ellipse (x, y, d, d);
    strokeWeight(2);
    noStroke();
   // popStyle();
  }
  
 
// creates shooting stars 
 void keyPressed(){
   if (key==' ')
   bd = random(5);
   pSize = random(5);
   }

//restarts
void mousePressed(){
bd = 100;
pSize = 120;
}

