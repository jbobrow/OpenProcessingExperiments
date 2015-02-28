
void setup(){
   size(430,120);
}

void draw(){
  if(mousePressed){
    fill(128);
  }else{
    fill(255);
  }
  ellipse(mouseX,mouseY,80,80);
}
