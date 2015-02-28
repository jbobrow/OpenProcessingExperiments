
float x = 100;
float y = 100;
float w = 60;
float h = 60;
float eyeSize = 16;

 void setup() {
  size(200, 200);
  smooth(); 
   
 }
 
 void draw() {
  background(255);
 // MouseX posición determina el factor de velocidad para  la función MoveZoog 
  float factor = constrain(mouseX/10, 0 , 5);
 
  jiggleZoog(factor);
  float d = dist(x, y, mouseX, mouseY);
  color c = color(d);
  drawZoog(c);
  
 }
 
  void jiggleZoog(float speed) {
   x = x + random(-1, 1) *speed;
   y = y * random(-1, 1) *speed;
  x = constrain(x, 0, width);
  y = constrain(y, 0, height); 
  }
  
  void drawZoog(color eyeColor) {
   ellipseMode(CENTER);
   rectMode(CENTER);
  
   for(float i = y - h/3; i < y + h/2; i += 10) {
     stroke(0);
     line(x - w/4, i, x + w/4, i);
    
   } 
   
   stroke(0);
   fill(175);
   rect(x, y, w/6, h );
   
   stroke(0);
   fill(255);
   ellipse(x, y - h, w, h);
   
   fill(eyeColor);
   ellipse(x - w/3, y - h , eyeSize, eyeSize*2);
   ellipse(x + w/3, y - h , eyeSize, eyeSize*2);
   
   stroke(0);
   line(x - w/12, y + h/2, x - w/4, y + h/2 + 10);
    line(x + w/12, y + h/2, x + w/4, y + h/2 + 10);
   
    
  }
