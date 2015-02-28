

float r;
float g;
float b;
float a;

float diam;
float x;
float y;
 void setup() {
   size(400, 400);
   background(0); 
   smooth(); 
 }
  
  void mousePressed() {
     background(r, g, b, a);
   }
 
 void draw() {
   r = random(255);
   g = random(255);
   b = random(255);
   a = random(255);
   diam = random(40);
   x = random(width);
   y = random(height);
   
   noStroke();
   fill(r, g, b, a);
   ellipse(mouseX, mouseY, diam, diam);
 }
   


     


