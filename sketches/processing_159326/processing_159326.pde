
void setup() {
  size(600, 600);
  
} 
void draw() {
  background (255);
  for (float i= 500; i>0; i=i-50) {
   fill(random(255), random(0), random(0));
    ellipse(mouseX, height/2, i, i);
    fill(255,255,255);
    ellipse (width/2,mouseY,i-25,i-25);
    }
  
}
