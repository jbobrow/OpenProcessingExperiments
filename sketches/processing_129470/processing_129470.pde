
Bounce b1 = new Bounce(5, 3.9); 
PImage ghost;
 
void setup() 
{
  size(600, 600);
  frameRate(60);
  ghost = loadImage("ghost.png");
}

void draw() { 
  float r=15, g=120, b=200;
  background(r+g,g-r,b+r);
  b1.move();
  image(ghost, width/3, height/3);
} 
 
class Bounce { 
  float ypos1, speed1; 
  Bounce (float a, float b) {  
    ypos1 = a; 
    speed1 = b;
    //ypos2 = c;
    //speed2 = d; 
  } 
  void move() { 
    ypos1 += speed1; 
    if (ypos1 > height) { 
      speed1*= -1; 
    }
    if (ypos1 < height) {
      speed1 *= +1;
    }
    //if (ypos1 <
    ellipse(width/2, height/2, ypos1, ypos1); 
    stroke(255,165,0,50);
    fill(ypos1+speed1, speed1+ypos1, ypos1+speed1, ypos1);
    } 
    
  } 
