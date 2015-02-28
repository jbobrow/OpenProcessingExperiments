
//HW7 
//Yingri Guan @  Pittsburgh All Rights Reserved
//Thanks to http://abzhakim.blogspot.com/ for the forest background

//'r' to randomize red riddinghood and wolf's positions
//Control the speed of the red:
//'f' speed up x direction
//'F' speed up y direction
//'s' slow down x direction
//'S' slow down y direction
//Control the speed of the wolf:
//'a' speed up x direction
//'A' speed up y direction
//'d' slow down x direction
//'D' slow down y direction


float x1, y1, sz1, xspeed1, yspeed1, tempx1, tempy1;
float x2, y2, sz2, xspeed2, yspeed2, tempx2, tempy2;
boolean collide = true;

PImage photo;
void setup()
{
 size (1363,527); 
 photo = loadImage("forest.png");
 x1=100;
 y1=height/2;
 sz1=80;
 xspeed1=3;
 yspeed1=5;
 tempx1 = xspeed1;
 tempy1 = xspeed1;
 
 x2=200;
 y2=200;
 sz2=90;
 xspeed2=3;
 yspeed2=0;
 tempx2 = xspeed2;
 tempy2 = yspeed2;
 
}

void draw()
{
  image(photo, 0, 0);
//  x1=mouseX;
//  y1=mouseY;
//  x2=200;
//  y2=200;
if (collide = true)
  {
  drawRed();
  }
  
  drawWolf();
  moveRed();
  moveWolf();
  checkCollision();
}


void moveRed()
{
 x1= x1 - xspeed1;
 y1 = y1 + yspeed1; 
 
 if((x1>width-200) || (x1<0))
 {
   xspeed1 = xspeed1 * -1;
 }

if ((y1>350) || (y1<0))
  {
  yspeed1 = yspeed1 * -1;
  }
}

//red riddinghood
void drawRed(){  
  fill(255,0,0);
  scale(1.5);
  noStroke();
  ellipse(x1, y1, 40, 40);
//  fill(98, 52, 2);
// beginShape();
//  vertex(30, 20);
//  bezierVertex(80, 0, 80, 75, 30, 75);
//  bezierVertex(50, 80, 60, 25, 30, 20);
// endShape();
  fill(255, 216, 216);
  ellipse(x1, y1+5, 30, 30);
  fill(0);
  ellipse(x1-10, y1+10, 2, 6);
  ellipse(x1+10, y1+10, 2, 6);
}

void moveWolf()
  {
   x2+=xspeed2;

   if (x2>width || x2<0)
  {
   
   xspeed2=-xspeed2;
  }
  }

void drawWolf(){
  //wolf
  
  //teeth
  
  fill(255);
  stroke(0);
  triangle(x2+10, y2, x2+12, y2+5, x2+14,y2);
  triangle(x2+10, y2+10, x2+12, y2+5, x2+14, y2+10);
  
  triangle(x2+14, y2, x2+17, y2+5, x2+19,y2);
  triangle(x2+15, y2+10, x2+18, y2+5, x2+20,y2+10);
  
  triangle(x2+18, y2-2, x2+20, y2-4, x2+22,y2-6);
  triangle(x2+18, y2+8, x2+20, y2+10, x2+22,y2+12);
  
  
  //
  noStroke();
  fill(142,135,129);
  
  //triangle(x2, y2-15, x2+3, y2-22, x2+6, y2-12);
  //triangle(x2-12, y2-9, x2-17, y2-20, x2-20, y2-9);
  //triangle(x2-12, y2-9, x2-17, y2-20, x2-20, y2-9);
  beginShape(TRIANGLES);
  vertex(x2, y2-15);
  vertex(x2+3, y2-22);
  vertex(x2+6, y2-12);
  vertex(x2-12, y2-9);
  vertex(x2-17, y2-20);
  vertex(x2-20, y2-9);
  
  endShape();
  
  //ellipse(x2+20, y2+20, 30, 40);
  //triangle(x2*0.9, y2-30, x2-12, y2-28, x2-14, y2-30);
  beginShape();
  curveVertex(x2+5, y2-15);
  curveVertex(x2, y2-15);
  curveVertex(x2-20, y2-10);
  curveVertex(x2-30, y2);
  curveVertex(x2-20, y2+18);
  curveVertex(x2, y2+15);
  
  curveVertex(x2+10, y2+15);
  curveVertex(x2+35, y2+25);
  curveVertex(x2+40, y2+15);
  curveVertex(x2+30, y2+10);
  curveVertex(x2+10, y2+5);
  curveVertex(x2+40, y2-5);
  curveVertex(x2+35, y2-15);
  curveVertex(x2+15, y2-5);
  
  curveVertex(x2+10, y2-8);
  curveVertex(x2+8, y2-10);
  curveVertex(x2+3, y2-15);
  curveVertex(x2, y2-15);
  curveVertex(x2-5, y2-15);
  endShape();
  
  //eyes
  fill(255);
  ellipse(x2-10, y2-5, 3, 8);
  ellipse(x2, y2-7, 3, 8);
  fill(0);
  ellipse(x2-10, y2-5, 1, 1);
  ellipse(x2, y2-7, 1, 1);
  }
  
  //bezier(x2+5, y2-20, x2, y2-20, x2-10, y2-10, x2 -20, y2);
  //translate(width/2, height/2);
//  rotate(PI/3.0);
//  ellipse( x2+40 ,y2+15, 50, 15);


void checkCollision()
{
 float d= dist(x1,y1,x2,y2);
 if(d<(sz1/2+sz2/2))
 {
    xspeed1 = xspeed2;
    xspeed2 = tempx1;
    yspeed1 = yspeed2;
    yspeed2 = tempy1;
 }
}

void keyPressed()
{
  // control the speed of the dog
  if ( key == 'f')
  {
    xspeed1 += 2;
  }
  else if ( key == 's')
  {
    xspeed1 -= 2;
  }
   
  else if ( key == 'F')
  {
    yspeed1 += 1;
  }
  else if ( key == 'S')
  {
    yspeed1 -= 1;
  }
   
  //control the speed of the ball
  else if ( key == 'a')
  {
    xspeed2 += 1;
  }
   
  else if ( key == 'd')
  {
    xspeed2 -= 1;
  }
   
  else if ( key == 'A')
  {
    yspeed2 += 1;
  }
   
  else if ( key == 'D')
  {
    yspeed2 -= 1;
  }
     
   else if ( key == 'r')
  {
    x1 = random(0, width-200);
    y1 = random(0, height-177);
    xspeed1 = random(1, 5);
    yspeed1 = random(1, 5);
     
    x2 = random( 0, width);
    y2 = random (200, 300);
    xspeed2 = random( 1, 5);
    yspeed2 = random( 1, 5);
  }
}







