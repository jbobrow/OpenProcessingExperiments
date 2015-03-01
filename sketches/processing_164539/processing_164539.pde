
float x, y;

float x2, y2;

float x3, y3;

float x4, y4;

float x5, y5;

float x6, y6;

float x7, y7;

float x8, y8;

float x9, y9;

float x10, y10;

float easing = 0.06;

float easing2 = 0.05;

float easing3 = 0.07;

float easing4= 0.1;

float easing5 = 0.03;

float easing6 = 0.063;

float easing7 = 0.065;

float easing8 = 0.07;


void setup() {

  size(600, 600);

  background(30);
}

void draw() {



  fill(#00502F);
  rect(0, 0, width, height);  




  int aX = -300;

  int aY = -300;


  float targetX = mouseX;

  x = x + (targetX - x) * easing;

  float targetY = mouseY;

  y = y + (targetY - y) * easing;


  float targetX2 = mouseX;

  x2 = x2 + (targetX2 - x2) * easing2;

  float targetY2 = mouseY;

  y2 = y2 + (targetY2 - y2) * easing2;

  float targetX3 = mouseX;

  x3 = x3 + (targetX3 - x3) * easing3;

  float targetY3 = mouseY;

  y3 = y3 + (targetY3 - y3) * easing3;

  float targetX4 = mouseX;

  x4 = x4 + (targetX4 - x4) * easing4;

  float targetY4 = mouseY;

  y4 = y4 + (targetY4 - y4) * easing5;

  float targetX5 = mouseX;
  x5 = map(mouseX, 0, 600, x4-80, x4+80);
  x5 = x5 + (targetX5 - x5) * easing5;


  float targetY5 = mouseY;
  y5 = map(mouseY, 0, 600, y4-60, y4+60);
  y5 = y5 + (targetY5 - y5) * easing4;


  float targetX6 = mouseX;

  x6 = x6 + (targetX6 - x6) * easing6;

  float targetY6 = mouseY;

  y6 = y6 + (targetY6 - y6) * easing6;

  float targetX7 = mouseX;

  x7 = x7 + (targetX7 - x7) * easing7;

  float targetY7 = mouseY;

  y7 = y7 + (targetY7 - y7) * easing7;

  float targetX8 = mouseX;

  x8 = x8 + (targetX8 - x8) * easing8;

  float targetY8 = mouseY;

  y8 = y8 + (targetY8 - y8) * easing8;

  float targetX9 = mouseX;
  x9 = map(mouseX, 0, 600, x2-220, x2+40);
  x9 = x9 + (targetX9 - x9) * easing2;

  float targetY9 = mouseY;
  y9 = map(mouseX, 0, 600, y2-320, y2+320);
  y9 = y9 + (targetY9 - y9) * easing2;

  float targetX10 = mouseX;
  x10 = map(mouseX, 0, 600, x3-80, x3+220);
  x10 = x10 + (targetX10 - x10) * easing3;

  float targetY10 = mouseY;
  
  y10 = map(mouseY, 0, 600, y3-120, y4+220);
  y10 = y10 + (targetY10 - y10) * easing3;

  float a = random(20, 600);
  float b = random(50, 600);
  float c = random(0, 100);
  float d = random(0, 255);
  float e = random(0, 255); 
  float f = random(0, 255);
  color cl;

  color cl2;

  int blue = (int)random(0, 150);
  int yellow = (int)random(0, 150);
  int pink = (int)random(0, 1000);

  cl = color(pink, yellow, blue, 100);

  cl2 = color(pink, yellow, blue, 90);

  println(mouseX, mouseY);
  translate(-300, -300);

  if (mousePressed) {


    fill(d, e, f, 80);
    ellipse (a+300, b+300, c+40, c+40);

    fill(d, e, f, 85);
    ellipse (a+300, b+300, c+30, c+30);

    fill(d, e, f, 90);
    ellipse (a+300, b+300, c+20, c+20);

    fill(d, e, f, 95);
    ellipse (a+300, b+300, c+10, c+10);

    fill(255);
    ellipse (a+300, b+300, c, c);
  }


  //body
  fill(255);
  noStroke();
  ellipse(x+300, y+370, 250, 250);

  fill(215);
  noStroke();
  ellipse(x+310, y+380, 210, 210);


  //headgear
  fill(#F75A32);
  quad(x4+250, y4+50, x4+220, y4+150, x4+380, y4+150, x4+350, y4+50);
  fill(#F75A32);
  ellipse(x4+300, y4+50, 100, 40);
  fill(#9B2E13);
  quad(x4+270, y4+50, x4+250, y4+130, x4+375, y4+130, x4+350, y4+50);
  fill(#9B2E13);
  ellipse(x4+310, y4+50, 82, 30);

  //buttons
  fill(#034B31);
  noStroke();
  ellipse(x6+352, y6+398, 18, 18);
  fill(#076745);
  noStroke();
  ellipse(x6+353, y6+399, 15, 15);

  fill(#034B31);
  noStroke();
  ellipse(x7+340, y7+340, 18, 18);
  fill(#076745);
  noStroke();
  ellipse(x7+341, y7+341, 15, 15);

  fill(#034B31);
  noStroke();
  ellipse(x8+342, y8+455, 18, 18);
  fill(#076745);
  noStroke();
  ellipse(x8+343, y8+456, 15, 15);
  
  


  if (mousePressed) {
    //buttons
    fill(cl2);
    noStroke();
    ellipse(x6+352, y6+398, 18, 18);
    fill(cl);
    noStroke();
    ellipse(x6+353, y6+399, 15, 15);

    fill(cl2);
    noStroke();
    ellipse(x7+340, y7+340, 18, 18);
    fill(cl);
    noStroke();
    ellipse(x7+341, y7+341, 15, 15);

    fill(cl2);
    noStroke();
    ellipse(x8+342, y8+455, 18, 18);
    fill(cl);
    noStroke();
    ellipse(x8+343, y8+456, 15, 15);
  }

  //head
  fill(255);
  noStroke();
  ellipse(x4+300, y4+200, 200, 200);

  fill(215);
  noStroke();
  ellipse(x4+305, y4+220, 160, 160);


  //eyes
  fill(30);
  noStroke();
  ellipse(x5+265, y5+210, 13, 13);

  fill(30);
  noStroke();
  ellipse(x5+335, y5+210, 13, 13);
  
   //right arm
  strokeWeight(7);
  stroke(#C1815C); 
  strokeCap(ROUND);
  line(x9+500, y9+220, x2+400, y2+320);

  strokeWeight(3);
  stroke(#9B4B1C); 
  strokeCap(ROUND);
  line(x9+501, y9+221, x2+401, y2+321);


  //left arm
  strokeWeight(7);
  stroke(#C1815C); 
  strokeCap(ROUND);
  line(x10+120, y10+220, x3+220, y3+320);

  strokeWeight(4);
  stroke(#9B4B1C); 
  strokeCap(ROUND);
  line(x10+121, y10+221, x3+221, y3+321);
  noStroke();
}

