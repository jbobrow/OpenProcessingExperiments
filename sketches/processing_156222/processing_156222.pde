
int i = 1;
int lastln = -20;

void setup(){
  size (400, 400);
  colorMode(HSB, width, width, width);
  noStroke();
  background(0);
}

void draw(){
  int stln = mouseX / i;
  if (stln != lastln){
    int lnY = stln * i;
    fill(mouseX, width, width);
    rect(lnY, 0, i, width);
    lastln = stln;
}else{
background(0);
}
}

