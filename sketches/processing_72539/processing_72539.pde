
int counter;
void setup() {
  size(400, 400);
}
  
void draw() {
  fill(255, 0, 0);
  rectMode(CENTER);
 
  if(mouseX >150 && mouseX < 250 && mouseY > 150 && mouseY < 250) {
   fill(180, 0, 120);
  }
  
   
  rect(width/2, height/2, 100, 100);
}
