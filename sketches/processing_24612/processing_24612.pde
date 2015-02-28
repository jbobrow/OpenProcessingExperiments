
ArrayList balls;
 
//float X;
//float Y;
 
void setup() {
  size(1000,700);
  smooth();
  noStroke();
   
  balls = new ArrayList();
   
//  balls.add(new Ball(width/2, 0, 48));
}
 
void draw()
{
  background(255);
  
  for (int i = balls.size() - 1; i >= 0; i--)
  {
    Ball ball = (Ball) balls.get(i);
    ball.move();
    ball.display();  
     
 
  }
   
}
  
void mousePressed() {
//    balls.add(new Ball(mouseX, mouseY, ballWidth) );
  balls.add(new Ball(mouseX, mouseY ) );
   
}
 
 
class Ball {
  float X;
  float Y;
  float s = random(100);
   
  float gspeed = 0; // gravity speed
  float yspeed = 0; // height speed
   
  float r = random(255);
  float g = random(255);
  float b = random(255);
 
  Ball(float xmouse, float ymouse) {
    X = xmouse;
    Y = ymouse;
    gspeed = 0.2;
    yspeed = 0;
  }
   
  void move() {
    yspeed = yspeed + gspeed;
    Y = Y + yspeed;
    
     
    if ( Y>height )
    {
      yspeed = yspeed * -0.7;     
      Y = height;     
    }
  }
   
  void display() {
    fill(r,g,b);
//    stroke(0);
    ellipse(X, Y, s, s);
  }
}


