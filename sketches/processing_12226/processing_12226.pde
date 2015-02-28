
// Assignment #2 Teacup - giorgio morandi
// Name: Allaina K. Propst
// E-mail:apropst@brynmawr.edu   
// Date: Sept 15th 2010


float x, y, z, a, b, c, d; 

void setup() {
  size(500, 300);

  smooth();

  x = 310;

  y = 215;

  z = 255;

  a = 260;

  b = 260;

  c = 260;

  d = 260;
}

void draw() {

  background(190);
  strokeWeight(1);
  stroke(131,139,139);//draw tabletop
  line(0,269,100,200);
  stroke(131,139,139);
  line(100,200,200,200);
  line(275,200,399,200);
  stroke(131,139,139);
  line(499,269,399,200);

  fill(124, 74, 54);
  stroke(7);//royal blue tea cup

  fill(25, 125, 112);
  ellipse(235,240,50,12);
  stroke(9);
  fill(25,25,112);
  curve(235,140,195,178,210,240,275,290);
  curve(235,140,275,178,260,240,210,290);


  fill(155);
  strokeWeight(6);
  stroke(50);
  smooth();
  line(x,y,c,d); //handle
  strokeWeight(13);
  line(b,a,z,a); //spoon
  strokeWeight(6);
  stroke(180);
  line(b,a,z,a); //inside spoon

  fill(190); //area inside tea cup (for 3-D appearence)
  noStroke();
  beginShape();
  vertex(195,178);
  vertex(210,240);
  curveVertex(220,290);
  vertex(260,240);
  vertex(275,178);
  curveVertex(220,140);
  endShape(CLOSE);        

  fill(26,88,169, 180); //area inside tea cup (for 3-D appearence)
  noStroke();
  beginShape();
  vertex(195,178);
  vertex(220,240);
  curveVertex(220,290);
  vertex(260,240);
  vertex(275,178);
  curveVertex(220,140);
  endShape(CLOSE);


  fill(25,25,112);

  ellipse(235, 178, 80, 12);  //top of cup

  noFill(); // smoke
  stroke(70);
  strokeWeight(1);
  beginShape();
  curveVertex(pmouseX-45, pmouseY-20); 
  curveVertex(220, 110);
  curveVertex(225, 155);
  curveVertex(225, 175); 
  curveVertex(mouseX, mouseY); 
  endShape();

  noFill(); // smoke
  stroke(70);
  strokeWeight(1);
  beginShape();
  curveVertex(pmouseX-10, pmouseY-20); 
  curveVertex(265, 120);
  curveVertex(235, 150);
  curveVertex(250, 175); 
  curveVertex(mouseX, mouseY); 
  endShape();
}


void mousePressed() {

  x = 155;

  z = 210;

  b = 215;

  c = 209;
}


