
int i;
void setup(){
  size(700, 500);
  background(205);
  frameRate(5);
  strokeWeight(2);
}
void draw(){
  if(random(4,6)<1) {
    stroke(255,5,255);
  } else {
    stroke(255,0,0);
  }
  for(i=0; i< 10; i++) {
    line(random(1, 499),random(1, 499), random(1, 499),random(1,499));
    ellipse(random(1,499), random(1,499), random(1,499),random(1,499));
  }
}


