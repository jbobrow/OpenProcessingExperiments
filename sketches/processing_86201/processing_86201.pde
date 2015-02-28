
/*****
*
*This is an application demonstrating the use of Matrix and Trig.
*
*****/


// GLOBAL VARIABLES

PVector e1 = new PVector();
PVector e2 = new PVector();
PVector e3 = new PVector();

float angle;
float magnitude;

void setup()
{
  size(400,400);
}

void draw()
{
  background(0);
  drawAtomBG();
  ////////////////// START HOMEWORK CODE HERE:
  
  //Red
  float time = (float)millis() / 1000;
  e1.x = 150 * cos(time) + 200;
  e1.y = 50 * sin(time) + 200;
  noStroke();
  fill(255,100,100);
  ellipse(e1.x,e1.y,20,20);
  
  //Green
  e2.x = 150 * cos(time);
  e2.y = 50 * sin(time);
  magnitude = sqrt((e2.x * e2.x) + (e2.y * e2.y));
  angle = atan2(e2.y,e2.x);
  angle += PI/1.5;
  e2.x = magnitude * cos(angle) + 200;
  e2.y = magnitude * sin(angle) + 200;
  noStroke();
  fill(100,255,100);
  ellipse(e2.x,e2.y,20,20);
  
  //Blue
  e3.x = 150 * cos(time);
  e3.y = 50 * sin(time);
  magnitude = sqrt((e3.x * e3.x) + (e3.y * e3.y));
  angle = atan2(e3.y,e3.x);
  angle += 2 * PI/1.5;
  e3.x = magnitude * cos(angle) + 200;
  e3.y = magnitude * sin(angle) + 200;
  noStroke();
  fill(100,100,255);
  ellipse(e3.x,e3.y,20,20);
  
  ////////////////// END HOMEWORK CODE HERE
}

void drawAtomBG()
{
  float time = (float)millis() / 1000;
  
  noStroke();
  fill(255);
  ellipse(200,200,50,50);
  
  noFill();
  strokeWeight(5);
  
  pushMatrix();
  translate(200,200);
  stroke(255,100,100);
  ellipse(0,0,300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(PI/1.5);
  stroke(100,255,100);
  ellipse(0,0,300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(2 * PI/1.5);
  stroke(100,100,255);
  ellipse(0,0,300,100);
  popMatrix();
}


