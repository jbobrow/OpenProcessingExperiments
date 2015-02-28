
void setup(){
  size(800, 400);
}

void draw() {
  
  if(mouseX <200) {
    background(60, 0,0);
  } else if(mouseX <400){
    background(0, 60, 0);
  } else if(mouseX <600){
    background(0,0,60);  
  } else {
    background(0,0,10);  
  }
}


