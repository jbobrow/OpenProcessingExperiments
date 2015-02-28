
void setup() {
  size(900,400); 
  smooth();
}

void draw() {
  background(255);
  strokeWeight(3);
  stroke(0);
  updateMe();
}

void updateMe() {
  for(int x=0; x<width; x+=10)
  for(int y=0; y<height; y+=10) {
    //noFill();
    ellipse(x+random(40,-30),y+random(-80,30),3,3);
    ellipse(x+random(-40,30),y+random(-60,30),1,1);
    ellipse(x+random(40,-90),y+random(-200,30),6,9);
  }
 
}

