
void setup() {
  size(700, 700);
  background(0);
  colorMode(HSB);
}
void draw() {
  float aleatorio= random(40, 350);
  float x=random(0, width/2);
  float y=random(0, height/2); 
 
  for (float i=500/2; i>0; i=i-1) {

    stroke((i)+(aleatorio), 250, 250);
    ellipse(i, i, i, i);
    ellipse(700-i, i, i, i);
    ellipse(i, 700-i, i, i);
    ellipse(700-i, 700-i, i, i);
  }
}

