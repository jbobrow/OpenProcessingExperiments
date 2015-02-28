
float gravity = 0.6;
float friction = -0.8;
float y;
  float diameter=30;
   float vy = 0;
  int id;
void setup() 
{
  size(350, 200);
  noStroke();
  smooth();
  }

void draw() 
{
  background(#acd373);
  
    vy += gravity;
     y += vy;
  
    if (y >= height-10) {
      y = height - 10;
      vy *= friction; 
      fill(140);
    ellipse(175, y, 40, 20);
    } 
    else if (y + diameter/2 < height) {
     fill(140);
    ellipse(175, y, abs(y/5), (60-abs(y/5)));
    }
    
  }
