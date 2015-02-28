
float sp; 

void setup(){
  sp = 30;
  size(400, 400);
  background (255);
  smooth();
  fill(0);
  stroke(sp);
}


void draw(){
  background(#FFD500);
    for (float y = sp/2; y <= height; y += sp){
    for (float x = sp/2; x <= width; x += sp){
      float d;
      d= sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));
      rect (x, y, d/sp, d/sp);
      fill(250, 3, 60, 50);
      triangle(x, d, x, y, d, y);
    
        }     
    }
  }
  




