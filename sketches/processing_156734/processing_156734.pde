
void setup(){
  size(600,600);
  background(0);
}

void draw(){
  background(0);
  fill(255,0,0);
  for(int i = 0; i<6; i++){
    ellipse(25+(i*(mouseX/6)), 25+(i*(mouseY/6)),50,50);
  }
  for(int i = 0; i<6; i++){
    ellipse((width-25)-i*((width-mouseX)/6), 25+(i*(mouseY/6)),50,50);
  }
  for(int i = 0; i<6; i++){
    ellipse(25+(i*(mouseX/6)), (height-25)-i*((height-mouseY)/6), 50,50);
  }
  for(int i = 0; i<6; i++){
    ellipse((width-25)-i*((width-mouseX)/6), (height-25)-i*((height-mouseY)/6), 50,50);
  }
  
}
