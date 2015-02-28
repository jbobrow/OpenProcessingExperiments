
int r,g,b,x,y,s,p;
void setup() {
  size(700,700);
  smooth();
  noStroke();
}
void draw() {
  r = (int)random(255);
  g = (int)random(255);
  b = (int)random(255);
  x = (int)random(-50,750);
  y = (int)random(-50,750);
  s = (int)random(20,100);
  p = (int)random(20,100);
  delay(10);
  fill(r,g,b,40);
  rect(x,y,s,p); 
}

