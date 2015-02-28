
void setup() {
   size (500,500);
   background(0);
   smooth();
   stroke (255,30); 
}

void draw() {
  for (int i=0;i<10 ;i++) {
    line (mouseX,mouseY,mouseX+random(-20,20),mouseY+random(-20,20));
  }
}
