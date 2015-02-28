
void setup(){
  size(800,200);
  background(0,14,255);
}

void draw() {
  fill(255,100,0);
  stroke(255,100,0);
  triangle(mouseX,mouseY,mouseX,mouseY,mouseX,mouseY);
 
 float pointillize = map(mouseX,0,width,50,50);
  int x = int(random(width));
  int y = int(random(height));
  color pix = get(x, y);
  noStroke();
  fill(255,100,0,random(255));
  ellipse(x,y, pointillize, pointillize);
}

//Some code borrowed (and modified) from "Pointillism" by Daniel Shiffman

