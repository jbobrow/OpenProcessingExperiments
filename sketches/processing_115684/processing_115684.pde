
void setup() {
  size(800, 800);
  smooth();
  background(0);
  ellipseMode(CENTER);
  colorMode(HSB);
}
void draw() {
pushMatrix();
  translate(width/2, height/2);
  int s= 70;
  smooth();
  for (int i=s;i>0;i--)
  {
    rotate(2*PI/9);
    stroke(i*2, 50, 255);  
    fill(i*5,i*30, 115, 25);
    ellipse(2, 6, i*30, i*10);
  }
  popMatrix();
  ellipse(mouseX,mouseY,150,150);
}



