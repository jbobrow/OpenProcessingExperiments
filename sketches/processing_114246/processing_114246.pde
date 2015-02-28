
// The image is from Marta Michalowska, The Noun Project
// HomeWork 7
// All right reserved to Chia-Fang Lue
//
//Mouse Click to stop
//Space bar to reset everything
//Control the speed of the dog:
//'f' speed up x direction
//'F' speed up y direction
//'s' slow down x direction
//'S' slow down y direction
//Control the speed of the ball:
//'j' speed up x direction
//'J' speed up y direction
//'l' slow down x direction
//'L' slow down y direction

float x1, y1, dx1, dy1, sz1, tempdx1, tempdy1;
float x2, y2, dx2, dy2, sz2, tempdx2, tempdy2;
color col1, col2, col3, col4, col5;

PImage pic;

void setup()
{
  size(400, 400);
  background(255);
  x1 = 100;
  y1 = 300;
  sz1 = 120;
  dx1 = 2;
  dy1 = 2;
  tempdx1 = dx1;
  tempdy1 = dy1;
  
  col1 = color( 255);
  
  x2 = 0;
  y2 = 0;
  sz2 = 50;
  dx2 = 3;
  dy2 = 1;
  tempdx2 = dx2;
  tempdy2 = dy2;
  
  col2 = color(240, 127, 51);
  col3 = color( 250, 223, 18);
  col4 = color( 48, 175, 57);
  col5 = color( 109, 48, 175);
  
  rectMode(CENTER);
  imageMode( CENTER);
  pic = loadImage( "dog.png");
  
}

void draw()
{
  prepScreen();
  
  moveFig1();
  fig1();
  
  moveFig2();
  fig2();
  checkCollision();
 
}

void checkCollision() //why the float doesn't need to declare in the very beginning?
{
  float d = dist (x1, y1, x2, y2);

  if ( d < (sz1/2 + sz2/2))
  { 
    dx1 = dx2;
    dx2 = tempdx1;
    dy1 =dy2;
    dy2 = tempdy1;
    
    
    fill(11, 142, 108);
    rect( width/2, height/2, width, height);
//    
//    x1 = random(0, width);
//    y1 = random( 300, height);
//    dx1 = random( 1, 3);
//    dy1 = random( 1, 3);
//    
//    x2 = random(0, width);
//    y2 = random( 0, height-100);
//    dx2 = random( 1, 3);
//    dy2 = random( 1, 3);
    
  }
}

void prepScreen()
{
  fill(255, 10);
  noStroke();
  rect(width/2, height/2, width, height);
}

void fig1() //dog
{
  fill(col1);
  noStroke();
  rect(x1, y1, sz1, sz1);
  image( pic, x1, y1, sz1, sz1);  
}

void moveFig1()
{
  x1 += dx1;
  if ( x1 > width + 150)
  {
    //dx1 = -dx1;
    x1 = -150;
  }
  
  if ( x1 < -150)
  {
    x1 = width+150;
  }
  
  y1 += dy1;
  if ( y1 > height+150)
  {
    //dy1 = -dy1;
    y1 = 0;
  }
  
  if (y1 < -150)
  {
    y1 = height;
  }
}

void fig2() //the ball
{
  fill(col2);
  ellipse(x2, y2, sz2, sz2);
 
  pushMatrix();
    translate( x2, y2);
    rotate( radians( frameCount));
    fill(col3);
    ellipse( 10, 7, sz2-35, sz2-35);
    fill(col4);
    ellipse( 0, -14, sz2-40, sz2-40);
    fill(col5);
    ellipse( -10, 0, sz2-30, sz2-30);
  popMatrix();
  
}

void moveFig2()
{
  x2 += dx2;
  if ( x2 > width || x2 < 0)
  {
    dx2 = -dx2;
  }
  
  y2 += dy2;
  if ( y2 > height || y2 < 0)
  {
    dy2 = -dy2;
  }
}

void keyPressed()
{
  // control the speed of the dog 
  if ( key == 'f') 
  {
    dx1 += 1;
  }
  else if ( key == 's')
  {
    dx1 -= 1;
  }
  
  else if ( key == 'F')
  {
    dy1 += 1;
  }
  else if ( key == 'S')
  {
    dy1 -= 1;
  }
  
  //control the speed of the ball
  else if ( key == 'j') 
  {
    dx2 += 1;
  }
  
  else if ( key == 'l')
  {
    dx2 -= 1;
  }
  
  else if ( key == 'J')
  {
    dy2 += 1;
  }
  
  else if ( key == 'L')
  {
    dy2 -= 1;
  }
    
  else if ( key == ' ')
  {
    x1 = random(0, width);
    y1 = random(300, 400);
    dx1 = random(1, 5);
    dy1 = random(1, 5);
    
    x2 = random( 0, width);
    y2 = random (0, height);
    dx2 = random( 1, 5);
    dy2 = random( 1, 5);
  }
}

void mouseClicked()
{
  dx1 = 0;
  dy1 = 0;
  dx2 = 0;
  dy2 = 0;
}


