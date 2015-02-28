
void setup() {
 
  size(400, 400, P2D);
  smooth(4);
}

void draw() {
  //draw a new background with alpha
  fill(200, 20);
  if(mousePressed){
    
    fill(255);
  } else {
    fill(0);
  background(200);}
  stroke(200);
  ellipse(mouseX, mouseY, 300, 300);
  
  stroke(0);
  ellipse(mouseX + 50, mouseY, 10, 10);
}
