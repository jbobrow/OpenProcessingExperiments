
PImage logotext;
float x, y, radius;
float rAngle = 0.0;
int centX, centY;
int circleSize1 = 60;
int circleSize2 = 45;
int circleSize3 = 30;
int circleSize4 = 15;
color circleColor0 = color(0, 220, 175);
color circleColor1 = color(145, 40, 145);



void setup () {
  size(960, 540);
  smooth();
  noStroke();
  logotext = loadImage("logotext.png");
  imageMode(CENTER);
}



void draw () {
 background(255);

  float circleAlpha = map(mouseX, 0, width, 0, 255);
  float circleMultiply = map(mouseX, 0, width, 0, 300);
  float textAlpha = map(mouseX, 480, width, 0, 255);

  for (float i = 0; i < 20; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i*circleMultiply));
    fill(circleColor0, 100);
    logoMark(mouseX, 0);
    popMatrix();
  }
  
  fill(circleColor0, circleAlpha);
  logoMark(width/2, height/2);

  if ((mouseX <=width/2)) { 
  }
  else {
    tint(255, textAlpha);
    image(logotext, width/2, height/2);
  }
  
}



void logoMark (float x, float y) {
  pushMatrix();
  translate(x, y);
  rotate(rAngle);
  rAngle += -.001;

  for (float ang = 0; ang <= 360; ang += 90) {
    float radius = dist(width/2, height/2, 400, 400);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    ellipse(x, y, circleSize1, circleSize1);
  }
  rotate(PI/7);
  for (float ang = 0; ang <= 360; ang += 90) {
    float radius = dist(width/2, height/2, 400, 400);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    ellipse(x, y, circleSize2, circleSize2);
  }
  rotate(PI/8);
  for (float ang = 0; ang <= 360; ang += 90) {
    float radius = dist(width/2, height/2, 400, 400);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    ellipse(x, y, circleSize3, circleSize3);
  }
  rotate(PI/9);
  for (float ang = 0; ang <= 360; ang += 90) {
    float radius = dist(width/2, height/2, 400, 400);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    ellipse(x, y, circleSize4, circleSize4);
  }

  popMatrix();
}


