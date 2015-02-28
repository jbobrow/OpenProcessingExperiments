
float angle = 0.0;
void setup () {
  size(640,360);
  background(255);
smooth();
fill(255);
stroke(0,176,255);
for (int y = 20; y <= height-20; y += 10) {
  for (int x =20; x <= width-20; x += 10) {
    ellipse(x,y,4,4);
   //Draw tons of rect
   fill(255);
   rect(x,y,30,30);
  }
}
   
}
   void draw() {
     translate(mouseX,mouseY);
     rotate(angle);
     rect(0,0,60,60);
     angle += 0.1;
   }
