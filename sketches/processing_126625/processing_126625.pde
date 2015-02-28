
void setup (){
  size (800,600);
  background (#FFFFFF);
  fill (#C1C1C1);
  rect (0,0,width,50);
  
  fill (#00FF00);
  rect (0,0,width/4,50);
  
  fill (#FF0000);
  rect (width/4,0,width/4,50);
  
  fill (#0000FF);
  rect (width/4*2,0,width/4,50);
  
  fill (#FFFFFF);
  rect (width/4*3,0,width/4,50);
}

void draw (){
  
  if (mousePressed && mouseX>0 && mouseX<width/4 && mouseY<50){
    strokeWeight (5);
    stroke (#00FF00);
  }
  
  if (mousePressed && mouseX>width/4 && mouseX<width/4*2 && mouseY<50){
    strokeWeight (5);
    stroke (#FF0000);
  }
  
  if (mousePressed && mouseX>width/4*2 && mouseX<width/4*3 && mouseY<50){
    strokeWeight (5);
    stroke (#0000FF);
  }
  
  if (mousePressed && mouseX>width/4*3 && mouseX<width && mouseY<50){
    strokeWeight(20);
    stroke (#FFFFFF);
    
  }
  
  if (mousePressed && mouseY>60){
  line (mouseX,mouseY,pmouseX,pmouseY);
}
}


