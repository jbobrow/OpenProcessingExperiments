
void setup() {
  size(400, 400);
  background (2);
}
 
void draw() {
  rect(mouseX, mouseY, 2, 2);
  rect(width-mouseX, mouseY, 0, 0);
  rect(mouseX,height-mouseY, 1,1);
  rect(width-mouseX,height-mouseY, 4,4);
  
  stroke(80,20,20);
  
  fill(250,200/10,100/10);


}

