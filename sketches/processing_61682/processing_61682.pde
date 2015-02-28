
float ellipseX = 400;
float ellipseY = 300;
float ellipse2X = 681;
float ellipse2Y = 419;
float ellipse3X = 234;
float ellipse3Y = 149;
float ellipse4X = 0;
float ellipse4Y = 0;
float ellipse5X = 742;
float ellipse5Y = 59;
float targetX = 0;
float targetY = 0;
int fillColor = 0;

void setup(){
  background(255,239,213);
  size(800,600);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
}

void mousePressed(){
  ellipseX = random(600);
  ellipseY = random(600);
  ellipse2X = random(600);
  ellipse2Y = random(600);
  ellipse3X = random(600);
  ellipse3Y = random(600);
  ellipse4X = random(600);
  ellipse4Y = random(600);
  ellipse5X = random(600);
  ellipse5Y = random(600);
  
  fillColor = (int)random(256);
}
  
void draw(){
  
  fill(0,20);
  noStroke();
  fill(fillColor,100,100,100);
  
  targetX = mouseX;
  targetY = mouseY;
 
 ellipseX += (targetX-ellipseX) *.07;
 ellipseY += (targetY-ellipseY) *.07;
 ellipse2X += (targetX-ellipse2X) *.01;
 ellipse2Y += (targetY-ellipse2Y) *.01;
 ellipse3X += (targetX-ellipse3X) *.02;
 ellipse3Y += (targetY-ellipse3Y) *.02;
 ellipse4X += (targetX-ellipse4X) *.025;
 ellipse4Y += (targetY-ellipse4Y) *.025;
 ellipse5X += (targetX-ellipse5X) *.03;
 ellipse5Y += (targetY-ellipse5Y) *.03;
  
  ellipse(ellipseX, ellipseY, 50, 50);
  ellipse(ellipse2X, ellipse2Y, 15, 15);
  ellipse(ellipse3X, ellipse3Y, 35, 35);
  ellipse(ellipse4X, ellipse4Y, 22, 22);
  ellipse(ellipse5X, ellipse5Y, 10, 10);
  
  strokeWeight(2);
  stroke(100);
  line(ellipseX, ellipseY, ellipse2X, ellipse2Y);
  line(ellipse2X, ellipse2Y, ellipse3X, ellipse3Y);
  line(ellipse3X, ellipse3Y, ellipse4X, ellipse4Y);
  line(ellipse4X, ellipse4Y, ellipse5X, ellipse5Y);
  line(ellipse5X, ellipse5Y, ellipseX, ellipseY);
  }
  

