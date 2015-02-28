
void setup() {
  size(400, 400, P2D);
}
void draw() {
  //draw a new background with alpha
  // use dist(x1, y1, x2, y2) to get the distance
  //between two points
  background(0); 
  fill(0);
  
  if(dist(width/2, height/2, mouseX, mouseY) < 50){
    fill(255);
  }else{
    fill(0);
  }
  ellipse(width/2, height/2, 100, 100);
  if(dist(width/2, height/2, mouseX, mouseY) > 50){
    fill(255);
  }else{
    fill(0);
  }
  ellipse(width/4, height/4, 10, 10);
    
    
    if(mousePressed){
    fill(0);
  } else {
fill(0);
ellipse(mouseX, mouseY, 10, 10);
}
}
