
void setup () {
  size (400,400);
  background (40,80,170);
  smooth ();
  noStroke();
}
 
void draw () {
  float x=mouseX/5;
  x=x+(random(12));
  float y=mouseY+(random(25));
  float z=random(200);
  float p=random(255);
  line(pmouseX,pmouseY,mouseX,mouseY);
  if(mousePressed==true) {
    stroke(x,y,z);
    strokeWeight (random(10));
    for (int i=5;i<100;i=i+5) {
      x=x+5;
    }
  }
}


