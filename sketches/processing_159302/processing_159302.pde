
void setup () {
  size (600,600);
  smooth();
}
void draw () {background (255);
for (float b=0; b<mouseY; b = b+20){
for (float a = 0; a<mouseX; a= a + 20 ){
  fill (b,a,220);
  ellipse (a, b,20,20);
}
}
}
