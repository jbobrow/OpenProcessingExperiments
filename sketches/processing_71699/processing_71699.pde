
int counter;

vovoid setup(){
  size(480,120);
}

void draw(){
  if(mousePressed){
    fill(200);
  }else{
    fill(255);
  }
  ellipse(mouseX,mouseY,80,80);
}
