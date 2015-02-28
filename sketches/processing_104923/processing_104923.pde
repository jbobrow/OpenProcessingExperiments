
void setup() {
  size(640,360);
  background(5);
  stroke(255, 255, 0, 1);
  strokeWeight(10);
  frameRate(20);
  smooth();
}
float len = 1;
float lastX,lastY;
float startX = random(width);
float startY = random(height);
int t = 0;
float ang = random(360);


void draw() {
  t = 0;
  float blue = startX/5+round(random(startX/width)*75);
  float red =200-(startX/width)*80-round(random(startX/width)*100);
  float green = random(200);
  int kosa = 100;
  while (t <= 30) {
    if (startX < 0 || startX>width || startY <0 || startY>height) {
      kosa=0;
    }
    if (startX >=0 && startX<=width && startY >=0 && startY<=height) {
      ang+=random(-1,1)*5;
      stroke(red, green, blue, kosa);
      lastX = startX + cos(radians(ang))*len*(width/height);
      lastY = startY + sin(radians(ang))*len;
      line(startX, startY,lastX*2 ,lastY*2) ; 
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
    t++;
  }
  float t2 = 0;
  float x = 0;
  float y = 0;
  while (t2<=width/10) {
    fill(15, 60);
    stroke(255, 0);
    rect(random(width), y, 1, height);
    t2++;
  }
  t2 = 0;
  while (t2<=height/10) {
    fill(15, 60);
    stroke(255, 0);
    rect(x, random(height), width, 1);
    t2++;
  }
}
