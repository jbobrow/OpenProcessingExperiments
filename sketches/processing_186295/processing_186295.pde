
int color = 0;
int a = 100;
void draw() {
size(256,256);
noStroke();
background(255);
fill(140,color,color,80);
ellipse(90, 90, mouseX, mouseX);

ellipse(80, a+68, mouseY, mouseY);
ellipse(130, a, mouseY-15, mouseY-15);
ellipse(150,a+80,mouseX-20,mouseX-20);

}

void mouseMoved() {
  color = color+ 5;
  if (value > 255) {
    value = 0;
}
}
void mouseDragged(){
a=mouseX;
 }
