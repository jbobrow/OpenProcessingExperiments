
float spin = 0;
void setup() {
  size(500, 500);
  background(0, 0, 0);
  smooth();
  frameRate(60);
}

void draw(){
  fill(0,0,0);
  rect(0,0,500,500);
  fill(255,255,255);
  for(int x = 1; x < 12; x++){
    for(int y = 1; y < 12; y++){
      int xspace = 5 + x*40;
      int yspace = 5 + y*40;
      arc(xspace, yspace, 30, 30, 0 + (x+y)/4 + spin, PI + (x+y)/4 + spin); 
    }
  }
  spin += .1;
}


