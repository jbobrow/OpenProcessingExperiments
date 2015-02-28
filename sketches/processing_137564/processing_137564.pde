
float lineX = 450;
float lineY = 450;
float x;
float y;
float cx; 
float cy;
float theta;
float radius;
float diameter;
float i = 0;
float s = 0;
float a = 100;

void setup(){
  background(0);
  size (800, 800);
    cx = width/2; 
  cy = height/2;
  diameter = (width/3)*2;
  radius = diameter/2;
  frameRate(30);
  fill(25);
  ellipse(cx, cy, 700, 700);
}

void draw(){
//getting the lines to draw in random lengths and angles away from the mouse
 if (mousePressed){
   i = random(-100, 100);
   s = random(-100, 100);
   a = random(50, 100);
   strokeWeight(random(.5, 2));
   stroke(255, a);
 line(mouseX, mouseY, mouseX+i+x, mouseY+s+y);
 }
}

void mouseReleased(){
  theta = atan2(mouseY - cy, mouseX - cx);
   x = cos(theta)* radius;
   y = sin(theta) * radius;
}

