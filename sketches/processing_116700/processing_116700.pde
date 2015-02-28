
//HomeWork 8 CMU computing arts with processing
// All right reserved to Chia-Fang Lue

//Instruction: 
//The goal of this game is to use UP DOWN LEFT RIGHT key to control the direction
//of the orange circle and try to match the red circle (target area).
//You need to complete this task before 6 collisions. 
//You can drag the mouse up, down, left, right to conrol the speed of the triangle.
//And you can use key 's' to slow down the rectangle, and 'f' to speed up.
//Please to use the mouse and keyboard input to avoid the collision.
//Press the space bar to replay again.

float x1, y1, sz1, dx1, dy1; //triangle
float x2, y2, sz2, dx2, dy2; //rect
float x3, y3, sz3, dx3, dy3; // circle
float x4, y4, sz4; // target
color col1, col2, col3;

int hits;


PFont f1;
PImage pic;

void setup()
{
  size(700, 700);
  
  x1 = random(0, width-200); //triangle wrapping
  y1 = random(30, height-200);
  sz1 = random( width*.1, width*.16);
  dx1 = random( 1, 4);
  dy1 = random( 1, 4);
  col1 = color( 12, 108, 144, 90);
  
  x2 = random(250, width); //rect bouncing
  y2 = random(30, height-200);
  sz2 = random(width*.07, width*.15);
  dx2 = random (1, 4);
  dy2 = random (1, 4);
  col2 = color( 19, 157, 101, 90);
  
  x3 = 250; //the move circle
  y3 = 0;
  sz3 = 80;
  dx3 = random(-1, 1);
  dy3 = 1;
  col3 = color(227, 141, 11, 90);
  
  x4 = width*.5; //target circle
  y4 = height*.88;
  sz4 = 90;
  
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  f1 = loadFont( "f1.vlw");
  textFont (f1, 24);
  
  hits = 0;

  
  pic = loadImage("img3.jpg");
}

void draw()
{
  prepWindow();
  fig4();
  
  fig1();
  moveFig1();
  fig2();
  moveFig2();
  fig3();
  moveFig3();
  
  checkCollision();
  gameOver();
  checkMatch();
  
  showStats();
  showTime();
  
  
}

void prepWindow()
{
  image( pic, 0, 0, width, height);
  fill(255, 255, 255, 50);
  rect( width/2, height/2, width, height);

  
 
}

void fig1()
{
  fill(col1);
  noStroke();
  triangle( x1, y1, x1-sz1, y1+sz1*2, x1+sz1, y1+sz1*2);
}

void moveFig1()
{
  x1 += dx1;
  if ( x1 > width+ 5)
 {
   x1 = 0;
 } 
 else if ( x1 < - 5)
 {
   x1 = width;
 }
 
 y1 += dy1;
 if ( y1 > height+ 5)
 {
   y1 = 0;
 }
 else if (y1 < - 5)
 {
   y1 = height;
 }
}

void fig2()
{
  fill(col2);
  noStroke();
  rect( x2, y2, sz2, sz2);
}

void moveFig2()
{
  x2 += dx2;
  if (x2 > width || x2 < 0)
  {
    dx2 = -dx2;
  }
  
  y2 += dy2;
  if ( y2 > height || y2 < 0)
  {
    dy2 = -dy2;
  }
}

void fig3()
{
  fill(col3);
  noStroke();
  ellipse( x3, y3, sz3, sz3);
}

void moveFig3()
{
  x3 += dx3;
  if ( x3 > width || x3 < 0)
  {
    dx3 = -dx3;
  }
  
  y3 += dy3;
  if ( y3 > height+40 || y3 < 0)
  {
     y3 = 0;
  }
}

void fig4()
{
  fill(240, 85, 85, 90);
  stroke(240, 85, 85);
  strokeWeight(2);
  ellipse( x4, y4, sz4, sz4);
  fill(240, 85, 85);
  textSize(20);
  text( "target area", x4-50, y4+70);
}

void checkCollision()
{
  float d1 = dist (x1, y1, x2, y2);
  
  if ( d1 < (sz1+sz2)/2)
  {
    hits ++;
    fill(255);
    rect( width/2, height/2, width, height);
    dx1 = -dx1;
    dy1 = -dy1;
    dx2 = -dx2;
    dy2 = -dy2;
    
  }
  
  float d2 = dist ( x2, y2, x3, y3);
  if ( d2 < (sz2+sz3) /2)
  {
    hits ++;
    fill(255);
    rect( width/2, height/2, width, height);
    reStart();
  }
  
  float d3 = dist ( x1, y1, x3, y3);
  if (d3 < (sz1+sz3)/2)
  {
    hits ++;
    fill(255);
    rect( width/2, height/2, width, height);
    reStart();
  }
  
  
}

void checkMatch()
{
  float d4 = dist (x3, y3, x4, y4);
  
  if ( d4 < sz4/2 - sz3/2 + 5)
  {
    noLoop();
    textSize(24);
    fill( 100);
    text( "Good job! You complete the task!!", 170, 350);
    text( "Press the space bar to replay!", 170, 390);
    
  }
}

void gameOver()
{
  if ( hits > 5)
  {
    noLoop();
    textSize(24);
    fill(100);
    text( "Game Over!", 170, 350);
    text( "Press the space bar to replay!", 170, 390);
  }
  
  else if (hits == 5)
  {
    textSize(20);
    fill( 100);
    text( "The last chance.", width*.1, height*.22);
  }
}

void showStats()
{
//  fill(100);
//  rectMode( CORNER );
//  rect( width*.08, height*.05, width*.35, height*.12);
  fill(100);
  textSize( 20);
  text( "Amounts of collision: " + hits, width*.1, height*.15);
}

void showTime()
{
  fill(100);
  textSize(20);
  text( "Time: " + millis()/1000, width*.1, height*.1);
  //int remainTime = (20 - millis()/1000);
  //text( "Time left: " + remainTime, width*.1, height*.1);
  
}

void reStart()
{
//  fill(100, 10);
//  rect( width/2, height/2, width, height);
//  
  x1 = random(0, width-200); //triangle wrapping
  y1 = random(30, height-200);
  sz1 = random( width*.1, width*.16);
  dx1 = random( 1, 4);
  dy1 = random( 1, 4);
  col1 = color( 12, 108, 144, 70);
  
  x2 = random(250, width); //rect bouncing
  y2 = random(30, height-200);
  sz2 = random(width*.07, width*.15);
  dx2 = random (1, 4);
  dy2 = random (1, 4);
  col2 = color( 19, 157, 101, 70);
  
  x3 = 250; //the move circle
  y3 = 0;
  sz3 = 80;
  dx3 = random(-1, 1);
  dy3 = 1;
  col3 = color(227, 141, 11, 70);
  
  x4 = random( 80, width-80); //target circle
  y4 = random(550, height-80);
  sz4 = 90;
  
  


}

void keyPressed()
{
  if (key == 's')
    {
      dx2 -= 1;
      dy2 -= 1;
    }
    
  else if ( key == 'f')
  {
    dx2 += 1;
    dy2 += 1;
  }
    
  else if ( key == ' ')
  {
    loop();
    reStart();
    hits = 0;
  }
  
  else if (key == CODED)
  {
    if (keyCode == UP)
    {
      dy3 -= .5;
    }
    else if (keyCode == DOWN)
    {
      dy3 += .5;
    }
    else if (keyCode == RIGHT)
    {
      dx3 += .5;
    }
    else if (keyCode == LEFT)
    {
      dx3 -= .5;
    }   
    
  }

}

void mouseDragged()
{
  if ( pmouseX < mouseX )
  {
    dx1 += 1;
  }
  
  else if ( pmouseX > mouseX )
  {
    dx1 -= 1;
  }
  
  else if ( pmouseY < mouseY )
  {
    dy1 += 1;
  }
  
  else if ( pmouseY > mouseY )
  {
    dy1 -= 1;
  }
}




