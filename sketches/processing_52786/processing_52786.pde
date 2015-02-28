
void setup() {
   size (500,500);
   background(0);
   smooth();
   stroke (255,30);
   
}

void draw() {
  color azul = color(0, random(126, 255), random(50, 255),240) ;
    stroke(azul);
    for (int i=0;i<10 ;i++) {
      ellipse (mouseX,mouseY,mouseX+random(-10,10),mouseY+random(-10,10));
    }
}

