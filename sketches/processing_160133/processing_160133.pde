
void setup(){
  size(1000, 1000);
  colorMode(HSB);
  background(0);
}

void draw(){
  noStroke();
  fill(250-pmouseX/4, mouseY/(500/255), sq(sq(pmouseX/(100/51)-sq(pmouseY/(100/51)))), 100);
  ellipse(mouseX, mouseY, (sqrt(sq(pmouseX-mouseX)) + sqrt(sq(pmouseY-mouseY)))/2, (sqrt(sq(pmouseX-mouseX)) + sqrt(sq(pmouseY-mouseY)))/2);
}


