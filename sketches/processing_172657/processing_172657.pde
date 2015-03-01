
void setup(){
  size(600, 400);
}

void draw() {
  background(255);
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  
  if(mouseX<width/2 &&mouseY<height/2){
    fill(255,0,0);
    rect(0,0,width/2,height/2);
    
  }else if (mouseX>width/2 &&mouseY <height/2){
  fill(0,255,0);
  rect(width/2,0,width/2,height/2);
    
  }else if (mouseX<width/2 &&mouseY>height/2){
  fill(0,0,255);
  rect(0,height/2,width/2,height/2);
    
  }else{
    fill(127);
  }
}
