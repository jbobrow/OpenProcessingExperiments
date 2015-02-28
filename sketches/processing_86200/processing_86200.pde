
//program an atom in code
//use trig or transform matrixes

//global variables

PVector e1 = new PVector();
PVector e2 = new PVector();
PVector e3 = new PVector();

boolean drage1 = false;
boolean drage2 = false;
boolean drage3 = false;

boolean faster = false;
boolean reverse = false;
float time = 0;
float pathDelta = 1;

void setup()
{
   size(400,400);
   //size(400,400, P3D);
}

void draw()
{
 background(0); 
  drawAtomBG();
  drawText();
  //                  --->> HOMEWORK CODE Start <<---

  time = (float)millis()/1000;
  //time += (float)millis()/1000/time;
  //pathDelta = 1;
  
  if(faster) pathDelta += 0.1;
  if(reverse) pathDelta -= 0.1;

  time += pathDelta;
  
  e1.x = 150 * cos(time) + 200;    //radius times cos of time plus center
  e1.y = 50 * sin(time) + 200;
  
  float rad;
  float angle;
  
  //e2.x *= (float)(cos(PI/1.5));
  e2.x = 150 * cos(time);
  e2.y = 50 * sin(time);
  rad = sqrt((e2.x * e2.x) + (e2.y * e2.y));
  angle = atan2(e2.y, e2.x);
  angle += (PI/1.5);
  e2.x = rad * cos(angle);
  e2.y = rad * sin(angle);
  e2.x += 200;
  e2.y += 200;
  
  //e3.x = 150 * cos(time);
  //e3.y = 50 * sin(time);
  //e3.rotate(2*PI/1.5);
  //e3.x += 200;
  //e3.y += 200;
  
  e3.x = 150 * cos(time);
  e3.y = 50 * sin(time);
  rad = sqrt((e3.x * e3.x) + (e3.y * e3.y));
  angle = atan2(e3.y, e3.x);
  angle += (2*PI/1.5);
  e3.x = rad * cos(angle);
  e3.y = rad * sin(angle);
  e3.x += 200;
  e3.y += 200;
  
  noStroke();
  if(drage1)fill(255,225,225,100);
  else fill(255,100,100);
  ellipse(e1.x, e1.y, 20, 20);
  
  noStroke();
  if(drage2)fill(255,225,225,100);
  else fill(100,255,100);
  ellipse(e2.x, e2.y, 20, 20);
  
  noStroke();
  if(drage3)fill(255,225,225,100);
  else fill(100,100,255);
  ellipse(e3.x, e3.y, 20, 20);

  drawDragCircles();
  //                  --->> HOMEWORK CODE End <<---
}

void drawText()
{
  if(mouseX < 100 && mouseY < 50)
  {
    textSize(24);
    fill(0, 102, 153, 204);
    text("faster", 16, 30);
    faster = true;
  }
  else
  {
    textSize(24);
    fill(0, 102, 153, 128);
    text("faster", 16, 30);
    faster = false;
  }
  
  if(mouseX > width - 100 && mouseY < 50)
  {
    textSize(24);
    fill(0, 102, 153, 204);
    text("reverse", width - 96, 30);
    reverse = true;
  }
   else
  {
    textSize(24);
    fill(0, 102, 153, 128);
    text("reverse", width - 96, 30);
    reverse = false;
  }
  
  textSize(16);
  fill(0, 102, 153, 204);
  text("Click and drag the Electrons!", 96, height - 24);
}

void mousePressed()
{
 //get difference between atom and mouse position, if less than radius, can drag 
 PVector mousePos = new PVector(mouseX, mouseY);
  if(PVector.dist(e1, mousePos) < 15)
  {
    drage1 = true;
  }
  if(PVector.dist(e2, mousePos) < 15)
  {
    drage2 = true;
  }
  if(PVector.dist(e3, mousePos) < 15)
  {
    drage3 = true;
  }
  if(PVector.dist(new PVector(width / 2, height / 2), mousePos) < 30)
  {
    drage1 = true;
    drage2 = true;
    drage3 = true;
  }
}

void mouseReleased()
{
    drage1 = false;
    drage2 = false;
    drage3 = false;
}

void drawDragCircles()
{
  if(drage1)
  {
    stroke(255, 255, 255, 100);
    strokeWeight(1);
    line(mouseX, mouseY, e1.x, e1.y);
    noStroke();
    fill(255,100,100);
    ellipse(mouseX, mouseY, 20, 20);
  }
  if(drage2)
  {
    stroke(255, 255, 255, 100);
    strokeWeight(1);
    line(mouseX, mouseY, e2.x, e2.y);
    noStroke();
    fill(100,255,100);
    ellipse(mouseX, mouseY, 20, 20);
  }
  if(drage3)
  {
    stroke(255, 255, 255, 100);
    strokeWeight(1);
    line(mouseX, mouseY, e3.x, e3.y);
    noStroke();
    fill(100,100,255);
    ellipse(mouseX, mouseY, 20, 20);
  }
}

void drawAtomBG()
{
  noStroke();
  fill(255);
  ellipse(200,200, 50, 50);
  noFill();
  strokeWeight(5);
  
  pushMatrix();
  translate(200,200);
  stroke(255,100,100);
  ellipse(0,0, 300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(PI/1.5);
  stroke(100,255,100);
  ellipse(0,0, 300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(2*PI/1.5);
  stroke(100,100,255);
  ellipse(0,0, 300,100);
  popMatrix();
}


