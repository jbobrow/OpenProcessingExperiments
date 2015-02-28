
//homework 5, suzanne choi, suzanne1
//copy rights 2013 suzanne choi. all rights reserved.

float x, y, d;
color col;

void setup()
{
  size(400,400);
  col=color (200, random(255), random(255));
}

void draw()
{
  x=200;
  y=200;
  d=30;

  background(78,77,80);
  smooth();

  figure(mouseX, mouseY, (mouseX+mouseX)*.6);
  fill(col);

}

void figure(float x, float y, float d)
{
 //face
  fill(247,190,205);
  noStroke();
  ellipse(x, y, d, d);
  
  //ear(outside)
  ellipse(x+x*.25,y-y*.7,d*.3,d*.7);
  ellipse(x-x*.25,y-y*.7,d*.3,d*.7);
  
  //ear(inside)
  fill(255,80);
  ellipse(x+x*.25,y-y*.7,d*.1,d*.6);
  ellipse(x-x*.25,y-y*.7,d*.1,d*.6);
  
  //eyes
  fill(0);
  ellipse(x+x*.2,y-y*.1,d*.05,d*.05);
  ellipse(x-x*.2,y-y*.1,d*.05,d*.05);
  
  //nose
  fill(255,80);
  triangle(x,y,x+x*.05,y-y*.05,x-x*.05,y-y*.05);
  
  //mouth
  stroke(232,148,169);
  strokeWeight(2);
  noFill();
  beginShape();
  curveVertex(x,y-y*.15);  //control point
  curveVertex(x,y);
  curveVertex(x+x*.05,y+y*.2);
  curveVertex(x+x*.1,y+y*.25);
  curveVertex(x+x*.2,y+y*.2);
  curveVertex(x+x*.25,y+y*.15);  //control point
  endShape();
  beginShape();
  curveVertex(x,y-y*.15);  //control point
  curveVertex(x,y);
  curveVertex(x-x*.05,y+y*.2);
  curveVertex(x-x*.1,y+y*.25);
  curveVertex(x-x*.2,y+y*.2);
  curveVertex(x-x*.25,y+y*.15);  //control point
  endShape();
  
  //bow
  fill(col);
  noStroke();
  triangle(x+x*.25,y-y*.4,x+x*.05, y-y*.35,x+x*.05,y-y*.45);
  triangle(x+x*.25,y-y*.4,x+x*.45, y-y*.35,x+x*.45,y-y*.45);

}

void keyPressed()
{
  if (key == ' '){
  col=color(200,random(255),random(255));}}
  
 // if (key == 'a') { saveFrame("hw5.jpg");}}
  


