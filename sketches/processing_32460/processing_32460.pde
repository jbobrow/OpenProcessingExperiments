

int x = 0;
int y = 20;
int circlecolour1 = 250;
int circlecolour2 = 0;
float rand = random(150,250);

void setup() {
  size(500,500);
  background (255, 255, 255);
  noStroke();

  
  }
  
  void draw(){
     smooth();
      ellipse (random(500), rand, 50, 50);
      fill (0, circlecolour1, circlecolour2, 50);
      rand=rand+5;
      circlecolour1 = circlecolour1 + 50;
      circlecolour2 = circlecolour2 + 50;
      
                if (circlecolour2 > 255) {
      circlecolour2 = 50;
    }
    if (circlecolour1 < 0) {
      circlecolour1 = 255;
     }
     if(rand > 300){
       noLoop();
     }

  }
  


