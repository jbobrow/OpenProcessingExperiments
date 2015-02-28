
float angle = 0;
float counter = 0;
float s = 1;
float scaleSpeed = .05;
float radius = 50;
float midX = 50;
float midY = 50;
float angle2 = 0;
float x = 0;
float y = 0;
float sadX = -999;
float sadY = -999;

 
void draw()
{
 
  rectMode(CENTER);
   
  counter = counter + 0.0167;
   
  if(s > 2|| s <0)
  {
    scaleSpeed = -scaleSpeed;
  }
   
    s += scaleSpeed;
    angle += .05;
    pushMatrix();
    ellipseMode(CORNER);
    translate(width/2,height/2);
    rotate(angle);
    scale(s);
    noStroke();
    fill(#98DDFF,4);
    ellipse(0,0, 200,200);
    popMatrix();
  
 if (counter > 4)
  {
  angle -= .1;
  //pushMatrix();
  translate(250,295);
  rotate(angle);
  noStroke();
  fill(#2B29FC,1);
  rect(50,40,50,50);
  //popMatrix();
  } 
 
else
  {
  smooth();
  noStroke();
  noFill();
  ellipse(midX, midY, radius * 4, radius * 4);
   
 
  //radius = 20;
  stroke(#D1FFB7,100);
  strokeWeight(10);
 
  if (angle2 > 1440)
 {
   angle2 = 0;
        line(x,y,sadX,sadY);
      }
   sadX = x;
  sadY = y;
 
  }
}

PImage pic;

/* @pjs preload="photo-5.JPG"; */
void setup()
{
size (420,513);
pic = loadImage("photo-5.JPG");
image(pic,0,0);
}

