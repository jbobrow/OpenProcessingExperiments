
// lesson 3

float x;
float y;
float alfa = 20;
float d;
float cor2;

void setup() {
  size(600,600);
  smooth();
}

void draw() {
  background(255);
  
  d = random(2,10);
  cor2 = random(100,150);
  
  for(x = random(0,600); x < width; x += 5) {
    for(y = random(0,600); y < height; y += 50) {
      stroke(0,0,0,alfa);
      line(x,y,x,height/2);
      fill(0,0,cor2);
      ellipse(x,y,d,d);
    }
  }
}


