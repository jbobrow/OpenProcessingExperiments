
void setup() {
  size(400,400);
  smooth();
  strokeWeight(4);
}

void draw() {
  background(204);
  
  if (keyPressed){
    fill(0);
  
  if (key=='h'||key=='H'){
    fill(0,0,255);
 }
  
  rect(25,25,pmouseX,pmouseY);

}
  }



