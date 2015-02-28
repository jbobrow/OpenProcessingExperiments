
void setup(){
  size(500, 500);
  smooth();
  noStroke();
  fill(255);
  rect(0, 0, width, height);
}

void draw(){
  noStroke();
  fill(255, 0);
  
  
  if(mousePressed){
  stroke(0, mouseX);
  line(width/2, height-0, mouseX, mouseY);
  line(width/2, 0, mouseX, mouseY);
  
}else{
  stroke(0, mouseX);
  ellipse(width/2, height-0, mouseX, mouseY);
  ellipse(width/2, 0, mouseX, mouseY);
}

}


