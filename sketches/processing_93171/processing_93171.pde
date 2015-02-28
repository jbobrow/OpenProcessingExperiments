
float r = 100;
float g = 150;
float b = 200;
float a = 200;

float x1 = 100;
float y1 = 100;
float x2 = 100;
float y2 = 100;
float x3 = 100;
float y3 = 100;

void setup() {
  size(300, 300);
  smooth();
  frameRate(12);
}

void draw() {
  stroke(0);
  background(255);
  fill(r, g, b, a);
  
  ellipseMode(CENTER);
  rectMode(CENTER);

// Zoog's body  
   stroke(0);  
   fill(175);  
   rect(mouseX, mouseY, 20, 100);  
        
// Zoog's head
   fill(255);  
   ellipse(mouseX, mouseY-30, 60, 60); 
        
// Zoog's eyes
   fill(0);
   ellipse(mouseX-19, mouseY-30, 16, 32);
   ellipse(mouseX+19, mouseY-30, 16, 32);
 
// Zoog's legs 
   stroke(0); 
   line(mouseX-10, mouseY+50, mouseX-20, mouseY+60); 
   line(mouseX+10, mouseY+50, mouseX+20, mouseY+60); 
  
//Triangles
  x1 = random(0, 200);
  y1 = random(0, 150);
  x2 = random(0, 200);
  y2 = random(0, 150);
  x3 = random(0, 200);
  y3 = random(0, 150);
  
  fill(r, g, b, a);
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
  a = random(0, 255);
  
  if(mousePressed) {
  triangle(mouseX-20, mouseY-25, x2, y2, x3, y3);
  triangle(mouseX+20, mouseY-25, x2, y2, x3, y3);
  }
}


