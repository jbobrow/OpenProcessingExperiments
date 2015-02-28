
import processing.opengl.*;

float x, y, vx, vy, rad, drag;
Particle p;
Particle[] ps;
//array



void setup()
{
  size(displayWidth, displayHeight, OPENGL);
  x = random(width);
  y = random(height);
  vx = random(-1, 1);
  vy = random(-1, 1);
  rad = random(5, 25);
  drag = .97;
  ellipseMode(CENTER);


  //instantiate or construct the class
  p = new Particle();
  //construct array as well
  ps = new Particle[300];

  //fill the array with particle objects...
  for (int i = 0; i < ps.length; i++)
  {
    ps[i] = new Particle();
  }
}




void draw()
{
  background(0);

  fill(255);
  //x+=vx;
  // y+=vy;
  //vx+=noise(x*.01,y*.01,frameCount*.01)-.5;    //change frequency by changing decimals
  //vy+=noise(frameCount*.01,x*.01,y*.01)-.5;
  //vx*=drag;
  //vy*=drag;

  //keeps object in bounds
  //left bound
  if (x < -rad)
  {
    x = width + rad;
  }

  //right
  if (x > width+rad)
  {
    x = -rad;
  }

  //top
  if (y < -rad)
  {
    y = height+rad;
  }

  //bottom
  if (y > height+rad)
  {
    y = -rad;
  }
  fill(0);
  pushMatrix();
  translate(x, y);
  ellipse(0, 0, rad, rad);
  popMatrix();
  noStroke();
  p.update(); //calls particle 'p' to update
  p.display();

  for (int i = 0; i<ps.length; i++)
  {
    ps[i].update();
    // ps[i].display();
  }
  stroke(150);

  //distance checking bt particles
  //if the distance is less than 50 - draw a line bt the two
  //check all the particles...

  //where is the current particle in x and y?
  //where are all of the other particles on the stage also in x and y?
  //what's the distance?

  for (int i=0; i<ps.length; i++)
  {
    //create inline variables to track the info we need
    float x1 = ps[i].x;
    float y1 = ps[i].y;

    //check the postitions of all the others...
    for (int j = i+1; j<ps.length;j++) //change j=0 to j=i will speed it up, start where the first loop left off
    {
      float x2=ps[j].x;
      float y2=ps[j].y;
      //calculate distance bt the two particles
      if (dist(x1, y1, x2, y2) <50)
      {
        ps[i].connected = true;
        ps[j].connected = true;
        line(x1, y1, x2, y2);
      }
      //float x2 = xxx
      //float y2 = xxxxx
    }
  }
  for (int i = 0; i<ps.length; i++)
  {
    //ps[i].update();
    ps[i].display();
  }
}

//end of daw....
void mouseReleased()
{
  for (int i = 0; i<ps.length; i++)
  {
    ps[i].reset();
  }
}

class Particle
{
  //local to the class, will not conflict with global variables
  float x, y, vx, vy, rad, drag;
  boolean connected;

  //constructor function
  //namr must match class name and is CASE SENSITIVE

  Particle()
  {
    x = random(width);
    y = random(height);
    vx = random(-1, 1);
    vy = random(-1, 1);
    rad = random(5, 25);
    drag = .90;
    connected=false;
  }

  //function in a class is called a 'member' of the class
  //variables declared in a class are referred to as 'fields' of the class

  void update()
  {

    x+=vx;
    y+=vy;
    vx+=noise(x*.01, y*.01, frameCount*.01)-.5;    //change frequency by changing decimals
    vy+=noise(frameCount*.01, x*.01, y*.01)-.5;
    vx*=drag;
    vy*=drag;


    //keeps object in bounds
    //left bound
    if (x < -rad)
    {
      x = width + rad;
    }

    //right
    if (x > width+rad)
    {
      x = -rad;
    }

    //top
    if (y < -rad)
    {
      y = height+rad;
    }

    //bottom
    if (y > height+rad)
    {
      y = -rad;
    }
  } //end of update function


  void display()
  {
    if (connected)
    {
      fill(53, 240, 230, 40);
    }
    else 
    {
      fill(250, 240, 33, 150);
    }
    //noFill();
    //stroke(250,240,33);
    //fill(250,1,1,100);
    pushMatrix();
    translate(x, y);
    triangle(this.x+ceil(width/2)*vx, this.y-height/2, 
    this.x+ceil(width/2)*vx, this.y+height/2, 
    this.x-ceil(width/2+1)*vx, this.y);
    //ellipse(0,0,rad,rad);
    popMatrix();
  }
  void reset()
  {
    x=mouseX+random(-10, 10);
    y=mouseY+random(-10, 10);
  }
}
