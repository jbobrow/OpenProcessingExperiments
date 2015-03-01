
void setup(){
  size(600,600);
}

void draw(){
  if(mouseY>300) {
    background(0);
    fill(255);
  }
  
  else {
  
  background (255);
  fill(0);
  }
  
  ellipse( 50, 50, 50 ,50);
}
