
int num_objects = 1000;
Static[] static_array = new Static[num_objects];


void setup() //__________________________________________________
{
  size(500, 300);
  for (int i = 0; i < num_objects; i++)
  {
    static_array[i] = new Static();
  }
}




void draw() //___________________________________________________

{
  background(15);
  noStroke();

  

  for (int i = 0; i < num_objects; i++)
  {
    static_array[i].update();
    static_array[i].display();
  }


  noFill();
  stroke(random(255), random(255), random(255), 90);

  for (int i = 0; i < num_objects; i++)
  {
    for (int j = i+1; j < num_objects; j++)
    {
      //object one
      float x1 = static_array[i].x;
      float y1 = static_array[i].y;

      //object two
      float x2 = static_array[j].x;
      float y2 = static_array[j].y;

      if (dist(x1, y1, x2, y2) < 3)
      {
        line(x1, y1, x2, y2);
      }
    }
  }
  
  
}



//_______________________________________________________________
class Static
{
  float x, y, vx, vy, grav, diam;
  float bounciness;



  Static()
  {
    x = random(width);
    y = random(height);
    diam = random(20, 20);
    bounciness = random(-.75, -.5);
    vx = random(-50, 50);
    vy = random(-10, 10);
    grav = .5;
  }






  void update() //_______________________________________________________
  {


    vy+=grav;
    x+=vx;
    y+=vy;

    if (y > height) 
    {
      y= height;
      vy *= bounciness;
    }


    if (x < 0)
    {
      x = 0;
      vx *= -1;
    }


    if (x > width)
    {
      x = width;
      vx *= -1;
    }    
  }





  void display() //______________________________________________________
  {
    pushMatrix();
    translate(x, y);
    ellipse(0, 0, diam, diam);
    popMatrix();
  }
}

