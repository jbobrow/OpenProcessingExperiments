


void setup() {
 size(800, 800); 
 colorMode(HSB);
}

void draw() {
 background(255);
 
 //line(50, 400, mouseX, mouseY);
 if (mouseX != 0.0) {
   float m = (400.0 - mouseY) / -mouseX;
   float b = mouseY - (m * mouseX);
   
    for(int i=0; i<100; i++) {
      float x= random(50, mouseX);
      float y = m * x + b;
      fill(mouseY/3.2, random(50, 255), mouseX);
      ellipse(x, y, 30, 30);
    }
 }
}


