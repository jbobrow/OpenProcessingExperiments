
void setup(){
  size(480,120);
  smooth();
}
void draw(){
  if (mousePressed){
    fill(0);
  }else{
    fill(255);
  }
  rect(mouseX,mouseY,mouseX,mouseY);
}

