
void setup(){
  size(400,600);
  smooth();
}

void draw(){
  if (mousePressed){
    fill(random (0,255),random (0,255),random (0,255));
  }
  else{ 
    ellipse(mouseX,mouseY, 30,30);
    }
}
