
Ball b1, b2;

float gravity = 0.01;

void setup() {
  size(100,100);
  background(102);
  ellipseMode(CENTER);
  noStroke();

  int r1 = 10;         
  int r2 = 15; 
  float bnc1 = 0.9;   
  float bnc2 = 0.85;



  b1 = new Ball(width/4, r1, 0.5, 0, bnc1, r1, 255);
  b2 = new Ball(width/2, r2, -0.5, 0, bnc2, r2, 0);
}


void draw() {
  background(102);
  

  b1.update();
  b2.update();
}


class Ball
{

  float posx, posy;         
  float speedx, speedy;      
  float bounciness;        
  int radius, colour;    
  
  Ball (float x, float y, float sx, float sy, float b, int r, int c) {
    posx = x; posy = y;
    speedx = sx; speedy = sy;
    bounciness = b;
    radius = r;
    colour = c;
    fill(colour);
    ellipse(posx, posy, radius*2, radius*2);
  }

  void update () {
    speedy += gravity;


    posx = constrain(posx + speedx, radius, width-radius);
    posy = constrain(posy + speedy, radius, height-radius);


    if (posx <= radius || posx >= width-radius) speedx *= -bounciness;
    if (posy <= radius || posy >= height-radius) speedy *= -bounciness;

    fill(colour);
    ellipse(posx, posy, radius*2, radius*2);
  }
}



