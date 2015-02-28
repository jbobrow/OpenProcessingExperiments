
void setup(){
size(400,400);
background (0);
smooth();
}
void draw () {
    float x = random (300);
    int i = 0;
    stroke (x*2,191,255,80);
    strokeWeight (1);
  if (mousePressed==true){
    if (mouseButton==LEFT){
  line (i+mouseX,i+mouseY,200,200);
  }
    }
  else {
  stroke (mouseX,mouseY,124,70);
  noFill ();
  ellipse (mouseX,mouseY,10,10);
}
  if (mouseButton == RIGHT) {
        stroke (x+180,23,31,80);
    strokeWeight (2);
  line (i+mouseX,i+mouseY,200,200);
  }
  }
