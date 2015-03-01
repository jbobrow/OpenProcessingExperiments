
float x1 = -15;  float speedx1 = 9;  float y1 = -20;  float speedy1 = 13;
float x2 = -17;  float speedx2 = 3;  float y2 = -30;  float speedy2 = 20;
float x3 = 510;  float speedx3 = 5;  float y3 = 100;  float speedy3 = 11;
float x4 = 250;  float speedx4 = 2;  float y4 = -10;  float speedy4 = 16;
float x5 = 400;  float speedx5 = 20;  float y5 = -10;  float speedy5 = 1;
float x6 = 10;  float speedx6 = 4;  float y6 = -10;  float speedy6 = 18;
float x7 = 510;  float speedx7 = -8;  float y7 = 400;  float speedy7 = -12;
float x8 = -10;  float speedx8 = 8;  float y8 = -10;  float speedy8 = 16;

void setup () {
  noStroke();
  size (500, 500, P2D);
}

void draw() {
 
  fill(250);
  rect(0, 0, width, height);
  fill(0);
  ellipse (10,50,20,20);
  ellipse (470,100,20,20);
  ellipse (380,150,20,20);
  ellipse (200,200,20,20);
  ellipse (350,250,20,20);
  ellipse (120,300,20,20);
  ellipse (50,350,20,20);
  ellipse (100,400,20,20);
  
  
 if (mousePressed == true) {
   
  fill(0);
  rect(0, 0, width, height);
  fill(255);

  ellipse (x1, y1, 20, 20);
  ellipse (x2, y2, 20, 20);
  ellipse (x3, y3, 20, 20);
  ellipse (x4, y4, 20, 20);
  ellipse (x5, y5, 20, 20);
  ellipse (x6, y6, 20, 20);
  ellipse (x7, y7, 20, 20);
  ellipse (x8, y8, 20, 20);

  x1=x1+speedx1;  y1=y1+speedy1;
  
  x2=x2+speedx2;  y2=y2+speedy2;
  
  x3=x3+speedx3;  y3=y3+speedy3;
  
  x4=x4+speedx4;  y4=y4+speedy4;
  
  x5=x5+speedx5;  y5=y5+speedy5;
  
  x6=x6+speedx6;  y6=y6+speedy6;
  
  x7=x7+speedx7;  y7=y7+speedy7;
  
  x8=x8+speedx8;  y8=y8+speedy8;

  
  if (x1 > width-10) {
    speedx1 = -random(15);
  }
  if (x1 < 10) {
    speedx1 = random(15);
  }
  if (y1 > height-10) {
    speedy1 = -random(15);
  }
  if (y1 < 10) {
    speedy1 = random(15);
  }
  
  
  if (x2 > width-10) {
    speedx2 = -random(15);
  }
  if (x2 < 10) {
    speedx2 = random(15);
  }
  if (y2 > height-10) {
    speedy2 = -random(15);
  }
  if (y2 < 10) {
    speedy2 = random(15);
  }
  
  
  if (x3 > width-10) {
    speedx3 = -random(15);
  }
  if (x3 < 10) {
    speedx3 = random(15);
  }
  if (y3 > height-10) {
    speedy3 = -random(15);
  }
  if (y3 < 10) {
    speedy3 = random(15);
  }
  
  
  if (x4 > width-10) {
    speedx4 = -random(15);
  }
  if (x4 < 10) {
    speedx4 = random(15);
  }
  if (y4 > height-10) {
    speedy4 = -random(15);
  }
  if (y4 < 10) {
    speedy4 = random(15);
  }
  
  
  if (x5 > width-10) {
    speedx5 = -random(15);
  }
  if (x5 < 10) {
    speedx5 = random(15);
  }
  if (y5 > height-10) {
    speedy5 = -random(15);
  }
  if (y5 < 10) {
    speedy5 = random(15);
  }
  
  
  if (x6 > width-10) {
    speedx6 = -random(15);
  }
  if (x6 < 10) {
    speedx6 = random(15);
  }
  if (y6 > height-10) {
    speedy6 = -random(15);
  }
  if (y6 < 10) {
    speedy6 = random(15);
  }
  
  
  if (x7 > width-10) {
    speedx7 = -random(15);
  }
  if (x7 < 10) {
    speedx7 = random(15);
  }
  if (y7 > height-10) {
    speedy7 = -random(15);
  }
  if (y7 < 10) {
    speedy7 = random(15);
  }
  
  
  if (x8 > width-10) {
    speedx8 = -random(15);
  }
  if (x8 < 10) {
    speedx8 = random(15);
  }
  if (y8 > height-10) {
    speedy8 = -random(15);
  }
  if (y8 < 10) {
    speedy8 = random(15);
  }
}
  
}
