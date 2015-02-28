
// lesson 3

float x;
float y;
float alfa = 2;

void setup() {
  size(600,600);
}

void draw() {
  background(255);
  
  for(x = random(0,600); x < width; x += 10) {
    for(y = random(0,600); y < height; y += 10) {
      stroke(0,0,0,alfa);
      line(x,y,x,height);
      stroke(0);
      point(x,y);
    }
  }
}


