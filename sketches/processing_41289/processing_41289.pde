
float x, y;
float lastx = -999;
float lasty = -999;
float radius;
int centX = 400; 
int centY = 400;

void setup() {
  size(800, 800);
  background(0);
  smooth();
}

void draw() {
  background(0);
  noFill();
  for (float ang = 0; ang <= 360; ang += 5) {
    float radius = dist(width/2, height/2, mouseX, mouseY);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    
    strokeWeight(14);
    stroke(255, 66, 120); 
    point(x, y);
    
    strokeWeight(12);
    stroke(255, 113, 154); 
    point(x, y);
    
    strokeWeight(10);
    stroke(255, 161, 188); 
    point(x, y);
    
    strokeWeight(8);
    stroke(255, 208, 221); 
    point(x, y);
    
    strokeWeight(5);
    stroke(255); 
    point(x, y);
    
    strokeWeight(5);
    stroke(255, 54, 53);
    point(x-20, y-20);
    point(x+20, y+20);
    
    strokeWeight(3);
    stroke(232,211,164);
    point(x-25, y-25);
    point(x+25, y+25);
    
    strokeWeight(1);
    stroke(255);
    point(x-30, y-30);
    point(x+30, y+30);
  }
}

