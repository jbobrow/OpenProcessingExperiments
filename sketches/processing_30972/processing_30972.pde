
/****************************************************
 PVectorTest
 Kyle Kuepker
 July 28, 2010
 
 A test sketch to understand the PVector class
 ****************************************************/

PImage reticle;
int array_max = 80;
int firework_count = 0;
int spew_length_max = 200;
int spew_length_min = 50;
Firework Fireworks[] = new Firework[array_max];
//Wall Walls[] = new Wall[array_max];
Wall WallOne = new Wall(50, 50);

void setup()
{
  size(800, 800);
  rectMode(CORNER);
  background(25);
  reticle = createImage(15, 15, ALPHA);
  formReticleSquare();  
  noCursor();
  smooth();
  noStroke();
  noFill();

  for(int i = 0; i < array_max; i++)
  {
    Fireworks[i] = new Firework(0,0,0,0,0,0,0);
  }

  fill(255, 150);
}

void draw()
{
  background(25);
  image(reticle, mouseX-8, mouseY-8);

  if(mousePressed)
  {
    int x_vel = int(random(-7, 7));
    if(x_vel == 0)
      x_vel++;
    int y_vel = int(random(-7, 7));
    if(y_vel == 0)
      y_vel++;    
    int x_accel = int(random(-1, 1));
    int y_accel = int(random(-1, 1));
    Fireworks[firework_count] = new Firework(mouseX, mouseY, x_vel, y_vel, x_accel, y_accel, 200);
    Fireworks[firework_count].sketch();
    firework_count++;
    if(firework_count > array_max-1)
    {
      firework_count = 0;
      //println("RESET");
    }
  }

  for(int i = 0; i < Fireworks.length; i++)
  {
    Fireworks[i].move();
    Fireworks[i].sketch();
  }

  //WallOne.sketchWall();
}


