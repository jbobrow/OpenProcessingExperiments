
void setup(){
  size(500, 500);
  background(150);
  smooth();
}
 
void draw(){
  background(50);
    for (float y = 50; y <= height-10; y= y+10) {
      for (float x = 50; x <= width-10; x = x +10) {
        strokeWeight(random(2,100));
        stroke(random(0,100),random(100,255),50,200);
        rect(x, y,10,10);
      }
    }
}

