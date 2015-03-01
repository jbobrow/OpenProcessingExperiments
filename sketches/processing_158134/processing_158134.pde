
float px=0;
void setup(){
  size(600,400);
  background(255)
}
void draw(){

  px++;
  if (px<width*2) {
    fill(255, 0, 0);
  }
  else 
    px--;
  {
    if (px>width/2) {
      fill(0, 255, 0);
    }
    ellipse(px, 200, 20, 20);
    }
 }
