
Ball[] ball;
int Max_ball=2000;

void setup()
{
  size(1000, 1000);
  smooth();
  noStroke();
  ball = new Ball[Max_ball];

  for (int i=0; i< Max_ball; ++i)
  {
    ball[i] = new Ball();
  }
}

void draw()
{
  translate(500, 500);


  fill(0, 100);
  rect(-500, -500, 1000, 1000);
  for (int i=0; i< Max_ball; ++i) {
    ball[i].display();
    if (mousePressed) {
      ball[i].move();
    
    }
  }
   fill(0);
  noStroke();
  //ellipse(0, 0, 10, 10);
}

class Ball {
  float x, y, r;
  float s;
  color c;
  float direction=1;
  float theta;
  float R;
 


  Ball()
  {
    theta=random(-180, 180);
    R = random(100,700);
    r = random(1,3);
    x= R*cos(radians(theta));
    y= R*sin(radians(theta));
    c = color(random(100,255), random(50,200), random(0,100));
  }

  void move()
  {
    R-=2;
    if(R<100) R+=random(0,80);
    if(r>0) r-=0.005;
    theta -= 1.5;
    x = R*cos(radians(theta));
    y = R*sin(radians(theta));
  }
  void display()
  {    
    fill(c);
    ellipse(x, y, r, r);   
  }
}

