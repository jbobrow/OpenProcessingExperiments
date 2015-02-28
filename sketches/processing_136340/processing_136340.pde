
int r= random(0.1,0.6);
int dia= random(20,100);

void setup() {
  background(0);
  size(800,800);
    smooth();
}
 
void draw() {
    if (mousePressed) {
      noFill();
      stroke(255,255,255,40);
  float x= random(2,30);
  float y= random(2,30);
ellipse (mouseX, mouseY, dia, dia);
ellipse (mouseY, mouseX, dia, dia);
    }
}

   








