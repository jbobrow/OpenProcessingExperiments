
void setup () {
  size (200,200);
}

void draw() {
  background(255);
  
  stroke(0);
  strokeWeight(5);
  line(100,0,100,200);
  line(0,100,200,100);
  
 if (mouseX < width/2 && mouseY < height/2) {
   fill(0);
   rect(0,0,width/2, height/2);
 } else if (mouseX > width/2 && mouseY < height/2) {
   rect(100,0,width/2,height/2);
 } else if (mouseX < height/2 && mouseY > height/2) {
   rect(0,100,width/2,height/2);
 } else {
  rect(100,100,width/2,height/2);
 } 
 
}

