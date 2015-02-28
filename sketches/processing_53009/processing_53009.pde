
//Alex Mutter - Creative Code
//Homework 4 - Dorm Room Explosion

float theta;
float theta2;
float y;
float x;
float z;
float a;
float b;
float c;


void setup() {
  size(550, 550);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(20);
}

void drawBed() {
  fill(0); //draw mattress
  strokeWeight(3);
  rect(0, 0, 125, 300);
  fill(230, 231, 234); //draw pillows
  strokeWeight(2);
  rect(0, -105, 100, 50);
  fill(255); //draw blanket fold
  strokeWeight(2);
  rect(0, -45, 125, 55);
  fill(30, 227, 87); //draw blanket
  strokeWeight(1);
  rect(0, 48, 125, 200);
}

void drawDesk() {
  fill(103, 78, 12); //main body
  strokeWeight(3);
  rect(0, 0, 200, 90);
  rect(-90, 78, 20, 60); //left leg
  rect(90, 78, 20, 60); //right leg
}

void drawAlarmClock() {
  fill(48, 153, 216);
  strokeWeight(3);
  ellipse(0, 0, 60, 60);
  fill(255);
  ellipse(0, 0, 45, 45);
  fill(0);
  ellipse(0, 0, 5, 5);
  strokeWeight(2);
  line(0, 0, 9, 9);
  strokeWeight(2);
  line(0, 0, 5, -16);
  strokeWeight(1);
  fill(0);
  ellipse(23, 28, 20, 10);
  strokeWeight(1);
  fill(0);
  ellipse(-23, 28, 20, 10);
  strokeWeight(2);
  fill(189, 198, 184);
  ellipse(10, -30, 15, 10);
  fill(189, 198, 184);
  ellipse(-10, -30, 15, 10);
}

void drawRug() {
  fill(213, 49, 232, 36);
  strokeWeight(3);
  rect(0, 0, 250, 80);
  line(-110, -40, -110, 40);
  line(110, -40, 110, 40);
  for (int i = - 40; i <=40; i = i + 10) { //draw fibers
    line(125, 0 - i, 145, 0 - i);
    line(-125, 0 - i, -145, 0 - i);
  }
}

void drawBearCatThing() {
  fill(216, 160, 55);
  ellipse(-15, 28, 10, 25); //left leg
  ellipse(25, 28, 10, 25); //right leg
  ellipse(40, -5, 10, 20); //tail
  fill(216, 160, 55);
  strokeWeight(3);
  ellipse(0, 0, 70, 40); //body
  fill(216, 160, 55);
  ellipse(-35, 0, 30, 30); //head
  fill(216, 160, 55);
  ellipse(-50, -15, 10, 15); //left ear
  ellipse(-20, -15, 10, 15); //right ear
  fill(255);
  strokeWeight(1);
  ellipse(-43, -3, 7, 5); //left eye
  ellipse(-30, -3, 7, 5); //right eye
  fill(0);
  strokeWeight(2);
  ellipse(-36, 2, 3, 3); //nose
  line(-45, 7, -27, 7); //mouth
}

void draw() {
  fill(random(255), 36);
  rect(width/2, height/2, width, height);
  
  pushMatrix(); //rotate bed
  translate(445, 200);
  rotate(radians(y));
  drawBed();
  popMatrix();

  pushMatrix(); //move alarm clock
  translate(x, y);
  rotate(radians(theta));
  drawAlarmClock();
  x = x + random(-10, 10);
  y = y + random(-10, 10);
  if ((x > 450) || (x < 0)) {
    x = width/2;
  }
  if ((y > 450) || (y < 0)) {
    y = height/2;
  }
  theta+= 0.3;
  popMatrix();

  pushMatrix(); //rotate desk
  translate(120, 70);
  rotate(radians(x));
  drawDesk();
  popMatrix();

  pushMatrix(); //shift rug
  translate(width - z, a);
  z = z + random(-30, 30);
  if ((z > 500) || (z < 50)) {
    z = 200;
  }
  a = a + random(-10, 10);
  if ((a > 550) || (a < 350)) {
    a = 450;
  }
  drawRug();
  popMatrix();
  
  pushMatrix(); //agonize cat
  translate(b, c);
  rotate(radians(theta2));
  b = b + random(-5, 5);
  if ((b > 300) || (b < 0)) {
    b = 200;
  }
  c = c + random(-10, 10);
  if ((c > 550) || (c < 300)) {
    c = 450;
  }
  drawBearCatThing();
  theta2+= 0.8;
  popMatrix();
  
}


