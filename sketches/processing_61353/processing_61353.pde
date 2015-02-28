
 
void setup() {
  size(500,500);
}
 
void draw() {
  background(200,0,100);
  stroke(255);
  fill(100,0,50);
  rect(200,200,150,200);
   
  if (mouseX > 200 && mouseX < 350 && mouseY > 200 && mouseY < 400) {
    fill(200,0,250);
    rect(200,200,150,200);
    }

} 

