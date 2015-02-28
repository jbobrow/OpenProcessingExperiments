
void setup() {
  size(640,360);
  background(230);
  stroke(255, 255, 0, 1);
  strokeWeight(1);
  frameRate(24);
  smooth();
}
float len = 4;
float lastX,lastY;
float startX = random(width);
float startY = random(height);
int t = 0;

void draw() {
  t = 0;
  int red = 140+round(random(startX/width)*90);
  int green =80+round(random(startY/height)*100);
  int blue = 80;
  int kosa = 55;
  while (t <= 30) {
    if (startX < 0 || startX>width || startY <0 || startY>height) {
      kosa=0;
    }
    if (startX >=0 && startX<=width && startY >=0 && startY<=height) {
      stroke(red, green, blue, kosa);
      float rad = radians(random(363));
      lastX = startX + cos(rad)*len*(width/height);
      lastY = startY + sin(rad)*len;
      line(startX, startY, lastX, lastY);
      line(startX, startY, startX+cos(rad)*50, startY+sin(rad)*50);
      startX = lastX;
      startY = lastY;
    }
    else if (startX <0) {
      startX = width - random(len);
    }
    else if (startX > width) {
      startX = 0 + random(len);
    }
    else if (startY <0) { 
      startY = height - random(len);
    }
    else if (startY >height) {
      startY = 0 + random(len);
    }
    strokeWeight(1);
    stroke(255, 20);
    line(startX, startY, startX+random(40)-20, startY+random(40)-20);
    t++;
  }
  float t2 = 0;
  float x = 0;
  float y = 0;
  while (t2<=width/50) {
    fill(240, 15);
    stroke(255, 0);
    rect(random(width), y, 1, height);
    t2++;
  }
  t2 = 0;
  while (t2<=height/50) {
    fill(240, 15);
    stroke(255, 0);
    rect(x, random(height), width, 1);
    t2++;
  }
}
