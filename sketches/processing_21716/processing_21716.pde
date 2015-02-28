
void setup(){
  size(400,400);
  smooth();
}

void draw(){
  background(255);
  if(mouseX < width/2 || mousePressed == true){
  background(0);

  }
}

