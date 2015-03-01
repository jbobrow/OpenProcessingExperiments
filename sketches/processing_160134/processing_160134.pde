
void setup(){
  size(1000, 1000);
  colorMode(HSB);
}

void draw(){
  background(0);
  noStroke();
  fill(250-pmouseX/4, mouseY/(500/255), sq(sq(pmouseX/(100/51)-sq(pmouseY/(100/51)))));
  ellipse(mouseX, mouseY, (sqrt(sq(pmouseX-mouseX)) + sqrt(sq(pmouseY-mouseY))), (sqrt(sq(pmouseX-mouseX)) + sqrt(sq(pmouseY-mouseY))));
}


