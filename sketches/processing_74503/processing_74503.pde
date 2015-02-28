
int i =9;
int s = i/9;
int o = i/10;
 

void setup(){
  size (500, 500);
  smooth();
  background (0);
   frameRate(50);
  }
 
void draw(){
  if (mousePressed && (mouseButton == LEFT)) {
  strokeWeight(s);
    stroke(255);
  fill(255,0,0,o);
  ellipse(mouseX, mouseY, i+o, i-o);
  i = i + 2;
  

  } if (mousePressed && (mouseButton == RIGHT)) {
  strokeWeight(s);
  fill(255,20,0,40-o);
  ellipse(mouseX, mouseY, i, i);
  i = i + 1;
}
}
