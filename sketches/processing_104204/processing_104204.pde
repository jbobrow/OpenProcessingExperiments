
void setup() {
  size(1000,1000);
  background(0,255,0);
}

void draw() {
  if(mouseX<500) {
    background(219,255,248);
  }
  else if(mouseX<200){
    background(0,0,205);
  }
  else {
    background(255,255,255);
  }
}
