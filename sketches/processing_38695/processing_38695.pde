
void setup(){
  size(480,120);
  smooth();
}
void draw(){
  if (mousePressed){
    fill(55);
  }else{
    fill(200);
  }
  rect(mouseX,mouseY,30,80);
}

