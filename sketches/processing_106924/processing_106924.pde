
void setup() {  //setup function called initially, only once
  size(350,250);
  }

void draw() {  
   ellipse(20+mouseX,20+mouseY,100,100);
rect(0+mouseX,10+mouseY,20,20);
rect(40+mouseX,10+mouseY,20,20);
  if (mousePressed) {
      fill(246,210,2);
}
      else {
      fill(293,34,13);
}
      }
