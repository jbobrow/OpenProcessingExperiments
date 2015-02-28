
//Homework 10
//copyright Christina Lee October 2011 Pittsburgh, PA 15289
color black = color(0);
color pink = color(255, 0, 255);

void setup()
{ 
  size(400, 400, P3D);
  smooth();
}

void draw() {
  setting();
  initials();
}

void setting() {
  noStroke();
  background(black);
  pointLight(255, 255, 255, width/2, 0, width*.3);
}

void initials() 
{
  translate(width/2, height/2);
  fill(pink);

  pushMatrix();
  translate(width*0.35, -height*0.20);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(width*0.35, -height*0.2, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(width*0.25, -height*0.30);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(width*0.25, -height*0.30, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(width*0.12, -height*0.35);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(width*0.12, -height*0.35, height*0.1);
  sphere(20);
  popMatrix();


  pushMatrix();
  translate(-width*0.01, -height*0.4);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.01, -height*0.4, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.13, -height*0.35);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.13, -height*0.35, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.25, -height*0.3);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.25, -height*0.3, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.35, -height*0.2);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.35, -height*0.2, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.4, -height*0.07);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.4, -height*0.07, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.4, height*0.07);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.4, height*0.07, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.35, height*0.2);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.35, height*0.2, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.25, height*0.3);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.25, height*0.3, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.12, height*0.35);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.12, height*0.35, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.01, height*0.4);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(-width*0.01, height*0.4, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(width*0.12, height*0.35);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(width*0.12, height*0.35, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(width*0.25, height*0.30);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(width*0.25, height*0.30, height*0.1);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(width*0.35, height*0.20);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(width*0.35, height*0.20, height*0.1);
  sphere(20);
  popMatrix();
}

