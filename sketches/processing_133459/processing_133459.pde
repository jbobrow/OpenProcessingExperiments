
void setup(){
 size(800,400, P2D);
 background(255/2);
}
 
void draw(){
  stroke(255);
  line(width/2-1,0,width/2-1,height);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  flipHalf();
}

void keyPressed(){
 background(255/2); 
}
 
void flipHalf() {
  beginShape();
  texture(get());
  vertex(width/2, 0, width/2, 0);
  vertex(width, 0, 0, 0);
  vertex(width, height, 0, height);
  vertex(width/2, height, width/2, height);
  endShape();
}
