
int followX = 0;
int followY = 0;
int reps =0;

void setup() {
  size(700, 400);
  smooth();
}



void draw() {


  for (reps = 0; reps<width;reps++) {
    stroke(12, 255, reps/2);  
    line(reps, 0, reps, height);
  }
  
  followX=followX+(mouseX-followX)/10;
  followY=followY+(mouseY-followY)/10;
  
  fill(40, 80, 200, 50);
  noStroke();
  ellipse(followX, followY, 100, 100);
  stroke(0, 100);
  strokeWeight(5);
  line(mouseX, mouseY, followX, followY);
}


