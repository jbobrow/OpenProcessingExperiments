
//hw4
//Sun Kyung Park
//Copyright: Sun Kyung Park Sept 2012


float diam;
int col;

void setup ()
{

  size(400, 400);
  background(80, 80, 80);
  smooth();
  diam=200;
  col=color (235, 251, 252);
  frameRate (30);
}


void draw ()
{
  background(154, 157, 157, 80);
  drawInitials (mouseX, mouseY, diam, diam);
}

void drawInitials (float x, float y, float wd, float ht)
{


  //center circle
  noStroke();
  fill(232, 152, 66);
  ellipseMode(CENTER);
  ellipse(x, y, diam, diam);

  //s
  stroke(195, 84, 17);
  strokeWeight(5);
  beginShape();
  curveVertex(1.1*x, y);
  curveVertex(x, 0.75*y);
  curveVertex(0.75*x, 0.6*y);
  curveVertex(0.5*x, 0.85*y);
  curveVertex(0.75*x, y);
  curveVertex(x, 1.25*y);
  curveVertex(0.75*x, 1.45*y);
  curveVertex(0.5*x, 1.25*y);
  curveVertex(0.45*x, 1.25*y);
  endShape();

  //p
  stroke(216, 84, 17);
  strokeWeight(5);

  //p curve
  beginShape();
  curveVertex(x, 0.5*y);
  curveVertex(1.1*x, 0.75*y);
  curveVertex(1.25*x, 0.6*y);
  curveVertex(1.5*x, 0.75*y);
  curveVertex(1.25*x, 1.1*y);
  curveVertex(1.1*x, y);
  curveVertex(x, 0.85*y);
  endShape();

  //p straight 
  stroke(216, 84, 17);
  strokeWeight(5);
  beginShape();
  curveVertex(1.2*x, 0.6*y);
  curveVertex(1.1*x, 0.75*y);
  curveVertex(1.09*x, y);
  curveVertex(1.1*x, 1.45*y);
  curveVertex(1.2*x, 1.5*y);
  endShape();



  //movements
}

void mousePressed()
{
  col=color(random(255), random(255), random(255));
}



void keyPressed() //russellandrews copyright
{
  if (keyCode == ' ') {
    diam=diam+5;
  }
  if (keyCode == 'c') {
    diam=diam - 5;
  }
}



