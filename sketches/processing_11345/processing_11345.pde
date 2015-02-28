
void setup(){
  size(500, 500);
  colorMode(HSB, 100);
  background(55, 50, 80);
  smooth();
}

void draw(){
  strokeWeight(350);
  stroke(random(45, 55), 100, 100);
  point(random(400, 500), random(500));
  filter(BLUR, 10);
  filter(POSTERIZE, 6);
  stroke(100, 10);
  //line
  for(int x = 0 ; x < 50 ; x++){
    for(int y = 0 ; y < 50 ; y++){
      stroke(100, 50);
      strokeWeight(0.7);
      line(x*20-50, y*20-50, x*100, y*20);
    }
  }
}

