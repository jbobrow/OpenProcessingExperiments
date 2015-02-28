
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
  


void draw() {
  prepWindow();
  moveBall();
  drawBall(bx, by, bd);
  drawImage(px, py, pSize);
  moveImage();
  
}
  
void moveImage() {

  px = px + pxSpeed;
  py = py + pySpeed;
   
  if (px > width - 50 || px < 50){    //russell andrews copyright
    pxSpeed *= -1;
  }
  if (py > height - 50 || py < 50) {
    pySpeed *= -1;
  }
}


void drawImage(float px, float py, float pSize)
{
 // fill (0, 0, 255);
 // ellipse(px, py, pSize*1.5, pSize*2);
  image(p, px, py, pSize, pSize);
}
  
  void prepWindow(){
    PImage img;
    img = loadImage("sky.png");
    background(img);
   // fill (#0E1019, 70); 
    //noStroke();
    rect(0, 0, width, height);
  }
  
  
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
  
  void drawBall (float x, float y, float d)
  {
    noFill();
    ellipse (x, y, d, d);
    strokeWeight(2);
    stroke(100);
  
  }
  
 void keyPressed(){
   if (key==' ')
   bd = random(5);
   pSize = random(5);
   }


void mousePressed(){
bd = 100;
pSize = 100;
}

