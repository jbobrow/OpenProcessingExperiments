
//Kevin Hyun khyun
//copyright 2012

// try to get the veritcal column to change color separately from
// the other ones
// possibly ripple
//mouse array to array index
//mouseX/Y divided by array.length

import java.util.*;
float r, g, b; //rectangle fill color
float rb, gb, bb; //background color
float wd, ht;
float dw, dh;
int fr = 60;
float [ ] x = { 
  0, 24, 48, 72, 96, 120, 144, 168, 192, 216, 240, 264, 288, 312, 336, 360, 384
}; 
float [ ] y = { 
  0, 24, 48, 72, 96, 120, 144, 168, 192, 216, 240, 264, 288, 312, 336, 360, 384
};
Random ran = new Random();
int gx=-1, gy=-1;


void setup()
{
  size(400, 400);
  background(255);
  smooth();
  //  noCursor();
  r = random(255); //rect fill color R-value set
  g = random(255); //rect fill color G-value set
  b = random(255); //rect fill color B-value set  

  noStroke();
  for (float x=0; x < width; x=x+24) {
    for (float y=0; y < height; y=y+24) {    
      fill(r, g, b);
      rect(x, y, 20, 20);
    }
  }
}

void draw()
{
  genWhiteSq();
  genBSq();
  genCSq();
  mouseSq();
}

void mouseSq()
{
  //x[0], y[0]
  if ( mouseX < x[0] + 20 && mouseX > x[0] - 5 )
  if ( mouseY < y[0] + 20 && mouseY > y[0] - 5 )
  {
    fill(255, 0, 0);
    rect(x[0], y[0], 20, 20 );
  }
  //x[1], y[1]
  if ( mouseX < x[1] + 20 && mouseX > x[1] - 5 )
  if ( mouseY < y[1] + 20 && mouseY > y[1] - 5 )
  {
    fill(255, 0, 0);
    rect(x[1], y[1], 20, 20 );
  }
  //x[2], y[2]
  if ( mouseX < x[2] + 20 && mouseX > x[2] - 5 )
  if ( mouseY < y[2] + 20 && mouseY > y[2] - 5 )
  {
    fill(255, 0, 0);
    rect(x[2], y[2], 20, 20 );
  }

  
}


void genWhiteSq()
{
  for ( int i = 0; i < x.length; i += 1)
  { 
    int a = ran.nextInt( x.length );
    int a1 = ran.nextInt(  x.length );
    fill(255);
    if (gx == a)
    {
      rect (x[a], y[a1], 40, 40);
    }
    else {

      rect (x[a], y[a1], 20, 20);
    }
    rect (x[a], y[a1], 20, 20);
  }
}


void genBSq()
{
  for ( int i = 0; i < x.length; i += 1)
  { 
    int a = ran.nextInt( x.length );
    int a1 = ran.nextInt(  x.length );
    fill(rb, gb, bb);
    if (gx == a)
    {
      rect (x[a], y[a1], 40, 40);
    }
    else {

      rect (x[a], y[a1], 20, 20);
    }
    rect (x[a], y[a1], 20, 20);
  }
}


void genCSq()
{
  for ( int i = 0; i < x.length; i += 1)
  { 
    int a = ran.nextInt( x.length );
    int a1 = ran.nextInt(  x.length );
    fill(r, g, b);
    if (gx == a)
    {
      rect (x[a], y[a1], 40, 40);
    }
    else {

      rect (x[a], y[a1], 20, 20);
    }
    rect (x[a], y[a1], 20, 20);
  }
}


void keyPressed() {
  if (key == 'c') {
    r = (random(255));
    g = (random(255));
    b = (random(255));
  }
  if (key == 'b') {
    rb = (random(255));
    gb = (random(255));
    bb = (random(255));
  }
  if (keyCode == UP) {
    fr++;
    frameRate(fr);
  }
  if (keyCode == DOWN) {
    fr--;
    frameRate(fr);
//    if ( frameRate < 30 ) {
//      frameRate=60;
    }
    println (frameRate);
  }
//}

//void mousePressed()
//{
//  gx = (mouseX / x.length);
//  gx = (mouseY / y.length);
//  noLoop();
//}
//void mouseReleased()
//{ 
//  loop();
//}


