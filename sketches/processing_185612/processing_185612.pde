
void setup () {
size (600,600);
colorMode(HSB);
}
void draw(){
for(int i= 500; i >0; i=i -2) {
  stroke((i/2) + (mouseX/3), 255,255);
ellipse (i,300,i,i);
}
}
