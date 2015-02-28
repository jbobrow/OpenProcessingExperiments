
void setup(){
  size(700,700);
  
  background(#99DDED);
  
  
  
}

void draw(){

  stroke(1022);
  fill(mouseX+#35208B);
  ellipse(mouseX,mouseY,120,110);
  rect(mouseY,mouseX,120,110);
  
  if(mousePressed){
    stroke(120);
    fill(200);
    rect(mouseX+20,mouseY+20,10,20);
  }
  else{
    ellipse(mouseX+20,mouseY+20,10,20);
  }
}


