
int i =9;
int s = i/9;
int o = i/20;
 

void setup(){
  size (500, 500);
  smooth();
  background (0);
   frameRate(100);
  }
 
void draw(){
  if (mousePressed && (mouseButton == LEFT)) {
  strokeWeight(s);
    stroke(255);
  fill(255,0,0,o);
  ellipse(mouseX, mouseY, i, i);
  i = i + 2;
 
  

} if (mousePressed && (mouseButton == RIGHT)) {
  strokeWeight(s);
  fill(0,0,255,40-s);
  ellipse(mouseX, mouseY, i, i);
  i = i + 1;

  } if (mousePressed && (mouseX>250 && mouseX< 500 && mouseY>250 && mouseY< 500) && (mouseButton == RIGHT)) {
  strokeWeight(s);
  stroke(255);
  fill(255,255,0,10);
  ellipse(mouseX, mouseY, i, i);
  i = i + 3;
  }
}
