
void setup(){
  size(400, 400);
  background(255);
  smooth();
}

void draw(){
  background(255, 255, 255);

  if (mousePressed){
    fill(0, 250, 0);
    line(pmouseX, pmouseY, mouseX, mouseY);
  
}else{
  
    fill(0, 0, 0);
  rect(pmouseX, pmouseY, mouseX, mouseY);
  noFill();
  
}
}
                
                
