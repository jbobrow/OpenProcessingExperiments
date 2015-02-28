
//declare int
color change;

void setup() {
  size (500, 500);
  colorMode(HSB, 255);
  background(0);
  change = 150;
}

void sq() {  
  for (int y=0; y<height; y+=0) {
    for (int x=0; x<width; x+=0) {
      fill (change, random(0, 255), 255, 50);
      noStroke();
      for (int r=0; r<5; r++) {
        rect(x, y, r*5, r*5);
        x+=25;
      }
      y+=25;
    }
  }
}
void draw() {
  sq();

}

void mouseMoved(){
 change=change+3;
if (change>=255){
 change=-3;
}
}


