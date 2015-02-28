
void setup(){
  size(500, 500);
  colorMode(HSB, 100);
  background(55, 50, 80);
  smooth();
  noLoop();
}

void draw(){
  for(int x = 0 ; x < 30 ; x++){
    for(int y = 0 ; y < 20 ; y++){
      stroke(100, 80);
      strokeWeight(0.7);
      line(x*20+50, y*20-50, x*10, y*30);
    }
  }
  for(int x = 0 ; x < 30 ; x++){
    for(int y = 0 ; y < 20 ; y++){
      stroke(60, 100, 100, 20);
      strokeWeight(0.7);
      line(x*10, y*10-20, x*15, y*30);
    }
  }
}

