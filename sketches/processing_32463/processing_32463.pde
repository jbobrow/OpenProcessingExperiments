
int x= 10;
int y = 15;
int circlecolour1 = 250;
int circlecolour2 = 0;


void setup() {
  size(500,500);
  background (255, 255, 255);

noStroke();
}

void draw(){
  while(y <500) {
    ellipse (random(500), y, random(50,70), random(50,70));
      fill (0, circlecolour1,circlecolour2,25);
    x = x +15;
    circlecolour1 = circlecolour1 + 5;
    circlecolour2 = circlecolour2 + 5;
    
    if (x > 500) {
      y= y + 50;
      x= 0;
    }
    if (circlecolour2 > 255) {
      circlecolour2 = 0;
    }
  }
}

