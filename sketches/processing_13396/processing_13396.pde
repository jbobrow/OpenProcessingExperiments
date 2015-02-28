
int r,g,b,x,y,s,p;
void setup() {
  size(700,700);
  smooth();
  noStroke();
}
void draw() {
  r = (int)random(150);
  g = (int)random(150);
  b = (int)random(100,225);
  x = (int)random(-50,750);
  y = (int)random(100,750);
  s = (int)random(70,100);
  p = (int)random(70,100);
  fill(r,y/3,b,60);
  ellipse(x,y,s,p); 
  delay(30);
  if(mousePressed == true) {
    fill(r+30,mouseY/3+50,b-15,random(30,100));
    ellipse(mouseX,mouseY,s,p);
    fill(r-50,mouseY/3-50,b-50,random(90,100));
    ellipse(mouseX,mouseY,s-60,p-60);
  }
}


