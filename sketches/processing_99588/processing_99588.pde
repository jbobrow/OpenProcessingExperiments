
boolean clicking;
int strWid, mode, highScore;
String shape;

void setup() {
  size(500, 500);
  highScore = 0;
  clicking = false;
  background(0xFFAE6838);
  strWid = 20;
  shape = setMode();
  textAlign(LEFT, TOP);
  textSize(20);
  fill(0xCC008800);
  text("Draw a " + shape, 0, 0);
  textAlign(LEFT, BOTTOM);
  text("Best: " + highScore, 0, height);
}

void draw() {
}

void mousePressed() {
  if(mouseButton!=LEFT) return;
  clicking = true;
  background(0xFFAE6838);
  stroke(0);
  strokeWeight(strWid);
  point(mouseX, mouseY);
}

void mouseDragged() {
  if(mouseButton!=LEFT) return;
  stroke(0);
  strokeWeight(strWid);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void mouseReleased() {
  if(mouseButton!=LEFT) return;
  clicking = false;
  PVector c = getCenter();
  int avgRad=0;
  if (mode==0) avgRad = getRadius(c);
  else if (mode == 1) avgRad = getWidth(c);
  else if (mode == 2) avgRad = getBase(c);
  int score = generateScore(c, avgRad, mode);
  strokeWeight(1);
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  text("" + score, c.x, c.y);
  stroke(255);
  noFill();
  if (mode == 0)
    ellipse(c.x, c.y, avgRad*2, avgRad*2);
  else if (mode == 1) {
    rectMode(CENTER);
    rect(c.x, c.y, avgRad, avgRad);
  } 
  else if (mode == 2) {
    triangle(c.x, c.y-avgRad/sqrt(3), 
    c.x+avgRad/2, c.y+avgRad/(2*sqrt(3)), 
    c.x-avgRad/2, c.y+avgRad/(2*sqrt(3)));
  }
  if (score >= 35) strWid-=2;
  if (strWid<1) strWid=1;
  if(score>highScore) highScore=score;
  shape = setMode();
  textAlign(LEFT, TOP);
  textSize(20);
  fill(0xCC008800);
  text("Draw a " + shape, 0, 0);
  textAlign(LEFT, BOTTOM);
  text("Best: " + highScore, 0, height);
}

String setMode() {
  mode = (int)(random(1)*3);
  String shape = "";
  if (mode == 0) shape = "circle (\u25CB)";
  else if (mode == 1) shape = "square (\u25A1)";
  else if (mode == 2) shape = "triangle (\u0394)";
  return shape;
}

PVector getCenter() {
  loadPixels();
  int xSum=0, ySum=0, pixSum=0;
  for (int i = 0; i < pixels.length; i++)
    if ((pixels[i] & 0x00FFFFFF)==0) {
      xSum += i % width;
      ySum += i / width;
      pixSum ++;
    }
  if(pixSum == 0) return new PVector(0,0);
  return new PVector(xSum/pixSum, ySum/pixSum);
}

int getRadius(PVector center) {//for circle
  int radSum=0, pixSum=0;
  for (int i = 0; i < pixels.length; i++)
    if ((pixels[i] & 0x00FFFFFF)==0) {
      radSum += dist(center.x, center.y, i % width, i / width);
      pixSum ++;
    }
  if(pixSum == 0) return 0;
  return radSum/pixSum;
}

int getWidth(PVector center) {//for square
  int radSum=0, pixSum=0;
  for (int i = 0; i < pixels.length; i++)
    if ((pixels[i] & 0x00FFFFFF)==0) {
      radSum += dist(center.x, center.y, i % width, i / width);
      pixSum ++;
    }
  return (int)(4.0*(radSum/pixSum)/(sqrt(2)+1));
}

int getBase(PVector center) {//for triangle
  int radSum=0, pixSum=0;
  for (int i = 0; i < pixels.length; i++)
    if ((pixels[i] & 0x00FFFFFF)==0) {
      radSum += dist(center.x, center.y, i % width, i / width);
      pixSum ++;
    }
  return 8*radSum/(3*pixSum);
}

int generateScore(PVector center, int radius, int mode) {
  int pixSum=0, circSum=0;
  float circ = (int)(2*radius*PI);
  if (mode == 1) {
    circ = 4*radius;
  } 
  else if (mode == 2)
    circ = 3*radius;
  for (int i = 0; i < pixels.length; i++)
    if ((pixels[i] & 0x00FFFFFF)==0) {
      pixSum++;
      if (mode == 0 && (int)dist(center.x, center.y, i%width, i/width)==(int)radius) {
        circSum++;
      } 
      else if (mode == 1 && 
        ((int)abs(center.x-i%width)==(int)(radius/2) && abs(center.y-i/width)<=radius/2.0 
        || (int)abs(center.y-i/width)==(int)(radius/2) && abs(center.x-i%width)<=radius/2.0)) {//radius is actually width
        circSum++;
      } 
      else if (mode == 2) {
        float ang = atan2((i/width)-center.y, (i%width)-center.x);//y is inverted so pi/2 would be downwards
        int d = (int)dist(center.x, center.y, i%width, i/width);
        if ((ang >= -PI/2 && ang <= PI/6 && d==(int)((-radius/sqrt(3))/(sin(ang)-sqrt(3)*cos(ang)))) ||//right
        (ang >= PI/6 && ang <= 5*PI/6 && d==(int)((radius/(2*sqrt(3)))/sin(ang))) ||//bottom
        d==(int)((-radius/sqrt(3))/(sin(ang)+sqrt(3)*cos(ang))))//left
          circSum++;
      }
    }
  return (int)(circ*circSum/pixSum);
}



