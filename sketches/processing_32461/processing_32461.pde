
int x = 0;
int y = 20;
int circlecolour1 = 250;
int circlecolour2 = 0;


void setup() {
  size(500,500);
  background (255, 255, 255);
  noStroke();
  }
  
  void draw(){
         smooth();

    
    while(y <500) {
      ellipse (x, y, random(50,100), random(50,100));
      fill (0, circlecolour1, circlecolour2, 25);
      x = x+50;
      circlecolour1 = circlecolour1 + 50;
      circlecolour2 = circlecolour2 + 50;
      
      if(x > 500) {
        y = y + 50;
        x = 0;
      }
          if (circlecolour2 > 255) {
      circlecolour2 = 0;
    }
    if (circlecolour1 < 0) {
      circlecolour1 = 255;
     }
      
    }
  }

