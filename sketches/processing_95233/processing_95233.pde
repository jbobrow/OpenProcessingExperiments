
PImage img1;
PImage img2;
PImage img3;
float angle = 0.0;
int startX = 20; 
int stopX = 120;
int startY = 30; 
int stopY = 200; 
float x = startX; 
float y = startY; 
float step = 0.005; 
float pct = 0.0; 
float offset = 60;
float scalar = 10;
float speed = 0.01;

void setup() {
   size(500, 350);
  img1 = loadImage("background.jpg");
  img2 = loadImage("star.png");
  img3 = loadImage("star1.png");
  }
void draw() {
   
  image(img1, 0,0);
  
  fill(127,127,127);
  stroke(25);
  for (int x = 20; x < width; x += 20) {
 float mx = mouseX / 10;
 float offsetA = random(-mx, mx);
 float offsetB = random(-mx, mx);
 line(x + offsetA, 0, x - offsetB, 400);
 }
  
  stroke(127,127,127);
 float y1 = offset + sin(angle) * scalar;
 float y2 = offset + sin(angle + 0.4) * scalar;
 float y3 = offset + sin(angle + 0.8) * scalar;
  
 ellipse( 80, y1, 60, 60);
 ellipse(110, y2, 60, 60);
 ellipse(140, y3, 60, 60);
 ellipse(240, y1, 60, 60);
 ellipse(270, y2, 60, 60);
 ellipse(300, y3, 60, 60);
 ellipse(380, y1, 60, 60);
 ellipse(410, y2, 60, 60);
 ellipse(450, y3, 60, 60);
 angle += speed;
  
   translate(30, 75);
 image(img3, x, y);
  if (pct < 1.0) {
 x = startX + ((stopX-startX) * pct);
 y = startY + ((stopY-startX) * pct);
 pct += step;
 }
    
  translate(350, 200);
  rotate(angle);
  image(img2, 0, 0);
  angle += 0.1;

}


