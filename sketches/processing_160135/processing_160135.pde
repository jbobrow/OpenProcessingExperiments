
void setup(){
  size(1000, 1000);
  colorMode(HSB);
  background(0);
}

void draw(){
  noStroke();
  fill(0, 11);
  rect(0, 0, 1000, 1000);
  strokeWeight(10);
  stroke((250-pmouseX/4), mouseY/(500/255), sq(sq(pmouseX/(100/51)-sq(pmouseY/(100/51)))));
  line(pmouseX, pmouseY, mouseX, mouseY);
}


