
void setup() {
  size(600, 600);
}
void draw() {
  for (int i=0; i<400 ; i=i+5)
  { 
    smooth();
    stroke(mouseX*mouseY*0.001);
    fill(random(250), random(250), random(250), 10);
    ellipse(i+100, 120, 250, 250);
    ellipse(i+100, 250, 250, 250);
    ellipse(i+100, 370, 250, 250);
    ellipse(i+100, 500, 250, 250);
  }
}

