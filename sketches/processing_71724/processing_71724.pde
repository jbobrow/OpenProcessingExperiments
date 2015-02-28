
void setup(){
  size(480,120);
}

void draw(){
  if(mousePressed){
    fill(255);
  }else{
    fill(0);
  }
  ellipse(mouseX,mouseY,80,80);
}

