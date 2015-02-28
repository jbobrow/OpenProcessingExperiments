
void setup() {
  size(500, 500);
  smooth();
  noStroke();
  fill(255);
  rect(0, 0, width, height);

}

void draw(){
  noFill();

  if(mousePressed){
  stroke(0, mouseX);
  line(250, 250, mouseX, mouseY);
  
}else{
  noStroke();
  fill(200,5);
  ellipse(250, 250, mouseX, mouseY);
}
}

