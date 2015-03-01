
//animated cloud drawn using Bezier curves

float a = 0;
Cloud cloud;

void setup() {
  size(500, 500);
  colorMode(RGB, 100, 100, 100);
  smooth();
}

void draw() {
  background(100); 
  int t = second(); 
  int dx = int(map(noise(1.00+a), 0, 1, -3, 3));
  int dy = int(map(noise(2.00+a), 0, 1, -3, 3));
  cloud = new Cloud(190+dx, 60+dy);
  if (t % 2 == 0) {
    cloud.drawCloud1();
    cloud.writeText1();
  } else {
    cloud.drawCloud2();
    cloud.writeText2();
  }
  a = a + 0.05;
}

class Cloud {
 float x, y;
 Cloud(int _x, int _y) {
   x = _x;
   y = _y;
 }
 
 public void drawCloud1() {
   stroke(50);
   strokeWeight(0.5);
   beginShape();
   fill(30);
   vertex(x, y); bezierVertex(x, y, x+30, y-40, x+60, y);
   vertex(x+60, y); bezierVertex(x+60, y, x+100, y-30, x+120, y+10);
   vertex(x+120, y+10); bezierVertex(x+120, y+10, x+160, y+10, x+160, y+45);
   vertex(x+160, y+45); bezierVertex(x+160, y+45, x+200, y+80, x+155, y+100);
   vertex(x+155, y+100); bezierVertex(x+155, y+100, x+155, y+140, x+120, y+140);
   vertex(x+120, y+140); bezierVertex(x+120, y+140, x+100, y+170, x+70, y+150);
   vertex(x+70, y+150); bezierVertex(x+70, y+150, x+35, y+170, x+10, y+140);
   vertex(x+10, y+140); bezierVertex(x+10, y+140, x-15, y+145, x-25, y+115);
   vertex(x-25, y+115); bezierVertex(x-25, y+115, x-60, y+95, x-45, y+70);
   vertex(x-45, y+70); bezierVertex(x-45, y+70, x-65, y+50, x-30, y+35);
   vertex(x-30, y+35); bezierVertex(x-30, y+35, x-40, y+10, x, y);
   endShape();
 }
 public void drawCloud2() {
   stroke(30);   
   strokeWeight(0.5);
   beginShape();
   fill(50);
   x = x + 2;
   y = y + 2;
   vertex(x, y); bezierVertex(x, y, x+40, y-30, x+80, y);
   vertex(x+80, y); bezierVertex(x+80, y, x+110, y-15, x+140, y+10);
   vertex(x+140, y+10); bezierVertex(x+140, y+10, x+180, y+10, x+190, y+50);
   vertex(x+190, y+50); bezierVertex(x+190, y+50, x+220, y+80, x+190, y+100);
   vertex(x+190, y+100); bezierVertex(x+190, y+100, x+180, y+140, x+150, y+140);
   vertex(x+150, y+140); bezierVertex(x+150, y+140, x+120, y+160, x+90, y+150);
   vertex(x+90, y+150); bezierVertex(x+90, y+150, x+60, y+170, x+25, y+160);
   vertex(x+25, y+160); bezierVertex(x+25, y+160, x-10, y+180, x-40, y+140);
   vertex(x-40, y+140); bezierVertex(x-40, y+140, x-90, y+110, x-60, y+80);
   vertex(x-60, y+80); bezierVertex(x-60, y+80, x-90, y+50, x-55, y+25);
   vertex(x-55, y+25); bezierVertex(x-55, y+25, x-40, y-5, x, y);
   endShape();
 }
 public void writeText1() {
   fill(0);
   textSize(40);
   text("CLOUD", x, y + 80);
 }
 public void writeText2() {
  fill(0);
  textSize(60);
  text("CLOUD", x-40, y + 90); 
 }
}
