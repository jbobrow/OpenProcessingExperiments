
void setup(){
  size(400,400);
}

void draw(){
  if((mouseY<100) || (mouseY>300)){
    fill(0,255,255);
    ellipse(mouseX,mouseY,20,20);
  }
  else if(dist(mouseX,mouseY,200,200) < 100){
    fill(255,255,0);
    ellipse(mouseX,mouseY,20,20);
  }
  else{
    fill(255);
    rect(mouseX,mouseY,20,20);
  }
}

void mousePressed(){
  if(dist(mouseX,mouseY,200,200) < 100){
    background(255);
  }
}



