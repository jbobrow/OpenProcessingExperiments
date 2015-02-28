
void setup(){
  size(600, 400);
  background(0);
  stroke(0);
  fill(255);
  smooth(1);
  frameRate(4);
}

void draw(){
  for(int x = 50; x < 600; x += 100){
    for(int y = 50; y < 400; y += 100){
      if(random(100) < 10){
        int r = (int)random(256);
        int g = (int)random(256);
        int b = (int)random(256);
        fill(r,g,b);
        ellipse(x, y, 100, 100);
      }
    }
  }
}
