
int x=0;
int y=0;

void setup() {
  size (400, 400);
  smooth();
  noStroke();
  fill(255);
  rect(0, 0, width, height);
int x=0;
int y=0;
}
 
 
void draw() {
   
    for (int x=0; x < width; x=x+20) {
      for (int y=0; y < height; y=y+20) {
  if (dist(x+20, y+20, mouseX, mouseY) < 20) {
        stroke(255, 83, 77);
        
        noStroke();
        fill(150, 132, 0);
        ellipse (x+20, y+20, 20, 20);
        
      }}}
      
     }
