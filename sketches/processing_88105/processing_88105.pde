
int s = 20;

void setup(){
  background(255);
  size(400, 400);
  smooth();
  ellipseMode(CENTER);
}

void draw(){
  for(int j = 0; j < 20; j++) {
    for(int i = 0; i <20; i++) {
      fill(255, 0, random(150, 200), random(200));
      ellipse(i*s, j*s, random(s), random(s));
    }
  }
}


