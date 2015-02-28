
int i;

void setup(){
  size(500,500);
  background(0);
  frameRate(4);
  strokeWeight(4);
}

void draw(){
  if (random(0,1) < 0.5) {
    stroke(7,0,255);
  } else{
    stroke(255, 0, 0);
  }
  for (i=0; i<2; i++) {
    fill(random(1,255), random(1,255), random(1,255));
    ellipse(random(1,499), random(1, 499), random(1,200), random(1,200));
  }
}

