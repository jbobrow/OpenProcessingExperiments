
// © Laura Tjho Jan 31 2013
// 60-257 Hw Assignment 5

float x, y, wd, ht;
float r=0;
float b=0;
float g=0;

void setup()
{
  size(400, 400);
  smooth();
  strokeWeight(2);
  
  background(58, 250, 187);
  
  x=width*.5;
  y=height*.5;
  wd=width;
  ht=height;
  
  frameRate(10);
  
}

void draw()
{
  stroke(255);
  fill(r, g, b);
  figure(mouseX, mouseY, wd, ht);
}

void figure(float fx, float fy, float fwd, float fht)
{
  //eyes
  ellipse(mouseX+53, mouseY, fwd*.025, fht*.025);
  
  noFill();
  //top curve
  beginShape();
      curveVertex(mouseX+75, mouseY+7); //controlpoint
      curveVertex(mouseX+71.8, mouseY);
      curveVertex(mouseX+64.8, mouseY+8.7);
      curveVertex(mouseX+55.3, mouseY+16.5);
      curveVertex(mouseX+46.2, mouseY+19.7);
      curveVertex(mouseX+37, mouseY+20);
      curveVertex(mouseX+28.3, mouseY+18.3);
      curveVertex(mouseX+19.2, mouseY+14.4);
      curveVertex(mouseX+10.2, mouseY+8.8);
      curveVertex(mouseX, mouseY); //intersection
      curveVertex(mouseX-7.3, mouseY-6.5);
      curveVertex(mouseX-16.25, mouseY-15.4);
      curveVertex(mouseX-18.13, mouseY-18.25);//controlpoint
  endShape();
  
  //bottom curve
  beginShape();
      curveVertex(mouseX+75, mouseY-7); //controlpoint
      curveVertex(mouseX+71.8, mouseY);
      curveVertex(mouseX+64.8, mouseY-8.7);
      curveVertex(mouseX+55.3, mouseY-16.5);
      curveVertex(mouseX+46.2, mouseY-19.7);
      curveVertex(mouseX+37, mouseY-20);
      curveVertex(mouseX+28.3, mouseY-18.3);
      curveVertex(mouseX+19.2, mouseY-14.4);
      curveVertex(mouseX+10.2, mouseY-8.8);
      curveVertex(mouseX, mouseY); //intersection
      curveVertex(mouseX-7.3, mouseY+6.5);
      curveVertex(mouseX-16.25, mouseY+15.4);
      curveVertex(mouseX-18.13, mouseY+18.25);//controlpoint
  endShape();
  
  //tail
  line(mouseX-16.25, mouseY-15.4, mouseX-16.25, mouseY+15.4);
}

void keyPressed()
{
  if (key == 'a')
    {
      r=r+4; }
     else {
      r=r-1; 
    }
  
  if (key == 's')
  {
    b=b+3; }
    else {
      b=b-1; }
  
  if (key == 'd') {
    g=g+2; }
    else {
      g=g-1; }
}



