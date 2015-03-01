
void setup() {
size(600, 600);
colorMode(HSB);}

void draw(){
  background(27);
  
for (int x = 0;x<50;x++) {
  for (int y = 0;y<50;y++) {
  
    float d = dist (mouseX, mouseY, x*5, y*5);
    fill(d,255,255);
    ellipse(x*50, y*50, 20, 20);
  }
 
}
}

