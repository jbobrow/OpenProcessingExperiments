
// light blue and yellow
float angle = 0.0;

void setup() {
  size(1024, 400);
  smooth();
  background(0);
//  frameRate(4);
}

void draw(){
 for (int x = 0; x <=width - 20; x += 25){
  for (int y = 0; y <=height - 20; y += 25){
    stroke(150+x/2, 160+x/2, 60+ x/2, 255 - x/2);
    line(x + x/2, y, 275, 150);
    fill(2, 0+x/2, 0+ x/2, 255 - x/2);
    ellipse (x + x/2, y, 5 + x/5, 5 + x/5);
     rect (x+x/2, y+y/2, 20, 20);
     rotate(angle);
     angle += 0.5;
  }
 } 
//if (mousePressed = true) {
//  saveFrame ("explode3-##.tif");
}



