
void setup () {
  size (715, 515); 
  background(#FFFFFF);
  noStroke();
}
void draw () {
  frameRate (5);
  for (int x=1; x<35; x=x+1) {
    for (int y=1; y<25; y=y+1) { 

      //random color
      float rRainbowR = random(50, 200); 
      float rRainbowB = random(90, 200);
      float rRainbowY = random(40, 190);

      fill (rRainbowR, rRainbowY, rRainbowB);
      rect (x*20, y*20, 19, 14);
      fill ( 255);
      ellipse (random(0, 715), random(0, 515), 15, 15);
     ellipse (random(0, 315), random(0, 515), 15, 15);
    }
  }
}


                
                
