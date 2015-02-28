
void setup(){
  size(800,800);
  smooth();
}

void draw(){
  if (mouseX>100){
    background(0);
  } else {
    if (mouseX<100 && mouseX<200){
      background(255,0,100);
    }
  }
}

