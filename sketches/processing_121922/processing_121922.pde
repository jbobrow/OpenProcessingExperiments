
particle system[] = new particle[100];
float genx ;
float geny ;
float genspeed =1;

void setup()
{
  size(1000, 500);
  genx = width/2;
  geny = 20;

  for (int i=0 ; 
  i<system.length ; 
  i++)
  {
    float angle = random(0, TWO_PI);
    system[i] = new particle(genx, geny, genspeed*cos(angle), genspeed*sin(angle));
  }
}
void draw()
{
  background(204);
  for (int i=0 ; i<system.length ; i++)
  {
    system[i].move();
    system[i].draw();
  }
}

class particle
{
  float x, y;
  float vel_x, vel_y;

  void draw()
  {
    ellipse(x, y, 10, 10);
  }
  void move()
  {
    x += vel_x;
    y += vel_y;

    vel_y += 0.1;
    if ( y>height) { 
      y=height; 
      vel_y *= -0.7;
    }
    if (y<0      ) {
      y=0;       
      vel_y *= -0.7;
    }
    if ( x>width ) { 
      x=width;   
      vel_x *= -0.7;
    }
    if ( x<0     ) { 
      x=0;      
      vel_x *= -0.7;
    }
  }

  particle(float initx, float inity, float initvelx, float initvely)
  {
    x = initx; 
    y = inity;
    vel_x = initvelx ; 
    vel_y = initvely;
  }
}


