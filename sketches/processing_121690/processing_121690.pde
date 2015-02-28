
PVector ball;
PVector speed;
float h = 50;
int i=0;

void setup() {
 ball=new PVector(100,0);
 speed=new PVector(2,2);
 size(400,400);
/* if (frame != null) {
    frame.setResizable(true);
  }*/

 smooth();
 noStroke();
  ellipseMode(CORNER);
}


void draw()
{
background(245);


fill(255);
strokeWeight(12);
stroke(77,215,227);
ellipse(ball.x,ball.y,h,h);

stroke(255);
strokeWeight(1);
stroke(0);
line(ball.x+4,ball.y+2,0,0);
line(ball.x+-6,ball.y+30,0,height);
strokeWeight(2);
line(ball.x+30,ball.y+-7,width,0);
strokeWeight(4);
line(ball.x+50,ball.y+48,width,height);
if(i==0)
{
speed.y = speed.y + 0.5; 
ball.y = ball.y + speed.y;
 
speed.x=speed.x+0.5;
ball.x=ball.x+speed.x;
 
  if (ball.y > height - h) {
   
    ball.y = height - h;
   
    speed.y = speed.y * -0.9;
   
  }
  else if (ball.y <= 0) {
    
    speed.y = -speed.y;
  }
  if(ball.x>width-h)
  {
  ball.x=width-h;
  speed.x=speed.x*-0.9;
  }
  
  
}
}
   void mouseDragged()
  {
  ball.x=mouseX;
  ball.y=mouseY;
i=1;  
}
  void mouseReleased()
  {
  i=0;
  }


