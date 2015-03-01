
void setup() {
size(600, 600);
colorMode(HSB);}

void draw(){
    float d = dist (width/2,height/2,mouseX, mouseY);
    background(d,255,255);
  for (int x = 0;x<50;x++) {
  for (int y = 0;y<50;y++) {
    fill(0); 
    ellipse(x*50, y*50, 60, 60);
  }
 
}
}
