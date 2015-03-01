
    float circle_x = 0;
    float circle_y = 0;
    
void setup () { 
  size (400,400);
  noStroke();
  fill(255);
  frameRate(1000);
}

void draw () {
     background (200,0,40);
  
  float slow_circle_size=100;
  
if(random(10) > 8) {
       slow_circle_size = 400;
     }
ellipse(circle_x,200,slow_circle_size,slow_circle_size);

circle_x = circle_x + 1;

if(circle_x>400) {
  circle_x = 0;
}
}

