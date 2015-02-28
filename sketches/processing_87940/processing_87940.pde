
// Homework 6, 02-02-13
// Xinran Lu, xinranl@andrew.cmu.edu
// Copyright Xinran Lu Febuary 2013 Pittsburgh PA 15232

float x, y, r; //sparks
float a, b, c, d, e, f; //sparks
float v, vel; //velocity
float bx, by, br; //clown
float bcr, bcg, bcb; //clown nose color

void setup()
{
  size(400, 400);
  smooth();
  x = width/2;
  y = height/2;
  a = c = e = width/2;
  b = d = f = height/2;
  bx = 0;
  by = height/2;
  br = 200;
  r = 15;
  v = 2;
  vel = 1;
  bcr = 255;
  bcg = bcb = 0;
}

void draw()
{
  background(0);
  mm(x, y, r, 220, 252, 88);
  movementOne();
  mm(a, b, r, 46, 33, 64);
  movementTwo();
  mm(c, d, r, 144, 166, 123);
  movementThree();
  mm(e, f, r, 48, 45, 64);
  movementFour();
  nose(bx, by, br, bcr, bcg, bcb);
  movementNose();
}

//sparks
void mm(float mx, float my, float mr, float mcr, float mcg, float mcb)
{
  noStroke();
  fill(mcr, mcg, mcb, 230);
  ellipse(mx, my, mr, mr);
  stroke(mcr, mcg, mcb, 230);
  strokeWeight(3);
  line(mx-40, my, mx+40, my);
  line(mx, my-40, mx, my+40);
}

//clown
void nose(float bx, float by, float br, float bcr, float bcg, float bcb)
{
  //nose
  noStroke();
  fill(bcr, bcg, bcb, 160);
  ellipse(bx, by+10, br, br);
  
  //eyes
  fill(200);
  stroke(200);
  strokeWeight(15);
  ellipse(bx-100, by-120, br-80, br-130);
  ellipse(bx+100, by-120, br-80, br-130);
  line(bx-180, by-120, bx-20, by-120);
  line(bx+20, by-120, bx+180, by-120);
  line(bx-100, by-180, bx-100, by-60);
  line(bx+100, by-180, bx+100, by-60);
  
  fill(255);
  ellipse(bx-100, by-120, br-60, br-130);
  ellipse(bx+100, by-120, br-60, br-130);
  
  fill(50);
  noStroke();
  ellipse(bx-100, by-120, br-150, br-150);
  ellipse(bx+100, by-120, br-150, br-150);
  
  //mouth
  noFill();
  stroke(255, 0, 0, 100);
  strokeWeight(60);
  beginShape();
  curveVertex(bx-220, by-50);
  curveVertex(bx-150, by+100);
  curveVertex(bx, by+150);
  curveVertex(bx+150, by+100);
  curveVertex(bx+220, by-50);
  endShape();
  
  stroke(0, 100);
  strokeWeight(5);
  beginShape();
  curveVertex(bx-220, by-50);
  curveVertex(bx-150, by+100);
  curveVertex(bx, by+150);
  curveVertex(bx+150, by+100);
  curveVertex(bx+220, by-50);
  endShape();
}

void movementOne() {
  y += v;
  if(frameCount%300>100)
  {
   v=random(-10, 10);
   frameCount=0;
  }
  
  if(x > width-10 || y > height-10 || x < 10 || y < 10)
  {
      v = -v;
  }
}

void movementTwo() {
  a += v;
}

void movementThree() {
  c -= v;
}

void movementFour() {
  f -= v;
}

void movementNose() {
  bx += vel;
  by += vel*.3;
  if(bx > width + 200)
  {
    bx = -200;
  }
  if(by > height + 200)
  {
    by = -200;
  }
  
  //blink
  if(frameCount%300>90)
  {
    noStroke();
    fill(200);
    ellipse(bx-100, by-120, br-60, br-130);
    ellipse(bx+100, by-120, br-60, br-130);
  }
}

//change nose color
void mousePressed()
{
  bcr = random(150, 255);
  bcg = random(150, 255);
  bcb = random(150, 255);
}

void keyPressed()
{
  v = 2;
  x = width/2;
  y = height/2;
  a = c = e = width/2;
  b = d = f = height/2;
  bx = 0;
  by = height/2;
}
  

