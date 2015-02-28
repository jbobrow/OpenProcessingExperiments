
void setup() {
  size(400, 400);
}
void draw() {
  float mov =  map(mouseX, 0, width, 0, 400);

  background(255);
  for (int i=1; i<20; i++) {
    for (int y=1; y<20; y+=1) {
      if(mouseX<=150){
        fill(255-mouseX,255,255);
      }
      else{
      fill (random(0,255), random(0,255), random(0,255));
      }
      ellipse (i*20, y*20, mov, mov);
    }
  }
}


