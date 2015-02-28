
import processing.opengl.*;

/*static public void main(String args[]) {
 Frame frame = new Frame("testing");
 frame.setUndecorated(true);
 // The name "sketch_name" must match the name of your program - i.e.
//'texture_scatter' as it's the name of this sketch
 PApplet applet = new texture_scatter();
 frame.add(applet);
 applet.init();

 frame.setBounds(0, 0, 7680,800);

 frame.setVisible(true);
 }*/

float x, y, vx, vy, grav, rad;


//DECLARING CLASS
Particle p; //declare single particle class object.
//beginning of array
int numparts=5;//always starts at 0, ie 0-99.
///Particle[] parts = new Particle[numparts];//tells Processing we're building an array.
ArrayList parts;
/* Connector c;
 int parts=1;
 Connector[] parts = new Connector[parts]; */

Wave[] w;
int spacing = 21;
int numwaves;
float t;
//Wave2[] w2;

int spacing2 = 15;
int numwaves2;
float t2;



void setup()
{
  size(7680, 800, OPENGL);
  // size(screen.width,screen.height, OPENGL);
  x = width/2;
  y = height*.1;
  vx = random(-2, 2);
  vy = random(-2, 0);
  rad = 8;
  grav = .1;
  numwaves = width/spacing;

  w = new Wave[numwaves];//number of waves
  parts = new ArrayList();
  for (int i = 0; i < w.length;i++)
  {
    w[i] = new Wave(i*spacing, height/2);
  }

  numwaves2 = width/spacing2;//number of waves
  //  w2 = new Wave2[numwaves2];
  //  for (int j = 0; j < w2.length;j++)
  //  {
  //    w2[j] = new Wave2(j*spacing2, height/2);
  //  }

  //construct the particle class 'p'.
  //  p = new Particle();

  //construct particles through the array.
  /*for (int i = 0; i < parts.length;i++)
   {
   parts[i] = new Particle();
   }*/
}
void draw()
{
  background(0);
  x +=vx;
  y +=vy;
  vy+=grav;

  t = frameCount*.03;
  t2 = frameCount*.03;
  for (int i = 0; i < w.length;i++)
  {
    w[i].update();
    w[i].display();
  }
  //  for (int j = 0; j < w.length;j++)
  //  {
  //    w2[j].update();
  //    w2[j].display();
  //  }
  ellipse(x, y, rad, rad); //rad rad width and height
  // p.update();//finds the particle object 'p' and runs its functions..
  // p.display();//displays 'p'.
  /*for (int i = 0; i < parts.length;i++)//need a forloop to run through
the array of particles.
   {
   parts[i].update();
   parts[i].display();
   }*/

  if (frameCount % 2 == 0)
  {
    parts.add(new Particle());
  }
  for (int i = 0; i < parts.size();i++)
  {
    Particle p = (Particle) parts.get(i);
    p.update();
    p.display();
  }
}





class Wave
{
  float x, y;
  float s;
  float phase;
  float lpy, lpx;
  float r, g, b;
  float alf;

  ArrayList connectors;
  Wave(float _x, float _y)
  {
    x = _x;
    y = _y;
    phase = (x/width)*(PI*20)    ;
    connectors = new ArrayList();
    r = 0;
  g = random(50, 120);
    b = random(230, 255);
    alf = random(180, 255);
  }
  void update()
  {
    s = y+sin(t+phase)*100;

    //distance checking...

    //parts
    for (int i = 0 ; i< parts.size();i++)
    {
      Particle p = (Particle) parts.get(i);
      float dx = p.x - x;
      float dy = abs(p.y - s);

      if ( dx < 125 && dx > 25 && dy < 5)
      {
        connectors.add(new Connector(dx, 0));
         connectors.add(new Connector(dx+25, 0));
         connectors.add(new Connector(dx+10, 0));
         connectors.add(new Connector(dx+5, 0));
         connectors.add(new Connector(dx-25,0));
         connectors.add(new Connector(dx-13,0));
        parts.remove(i);
      }
    }


    /*
    if(random(1) > .98)
     {
     float tempx = random(150);
     connectors.add(new Connector( tempx, 0));

     }
     */
  }
  void display()
  {
    fill(r, g, b, alf);
    noStroke();
    pushMatrix();
    translate(x, s);
    ellipse(0, 0, 8, 8);
    ellipse(150, 0, 8, 8);
    //stroke(255, 50);
    noStroke();
    line(0, 0, 150, 0);


    for (int i = 0; i < connectors.size();i++)
    {
      Connector c = (Connector) connectors.get(i);

      if (c.age > c.agelimit)
      {
        connectors.remove(i);
      }
      else
      {
        c.display();
      }
    }
    popMatrix();
  }
}


/*class Wave2
 {
 float x, y;
 float s;
 float phase;
 Wave2(float _x, float _y)
 {
 x = _x;
 y = _y;
 phase = (x/width)*(PI*20)    ;

 }
 void update()
 {
 s = y+cos(t2+phase)*100;
 }
 void display()
 {
 fill(0, 200, 255);
 noStroke();
 ellipse(x, s, 8, 8);
 }
 }*/
class Particle
{
  float r, g, b; //for different colors. also need to set all of these in the constructor(Particle, in this case).
  float bounciness;
  float x, y, vx, vy, grav, rad; //copying and pasting variables to become local to the particle object...
  //analog to the setup function, but don't use setup function
  //always have to have a constructor function.
  //Functions in a class are called methods of the class...
  //Variables in a class are called fields of the class...
  //CONSTRUCTOR - ALWAYS the exact same name as the class name, including case.
  Particle()//the constructor
  {
    //set initial state for ellipse...
    x = random(width);
    y = -10;
    vx = random(-2, 2);
    vy = random(-2, 0);
    rad = 5;//size of ball
    grav = .1;
    /*r = 0;
    g = random(190, 215);
    b = random(230, 255);*/
      r = random (200,255);
    g = random (120,180);
    b = 0;

  }

  void update()
  {
    x +=vx;
    y +=vy;
    vy+=grav/2;//want the vy speed to change with gravity

    if ( y > height + 10)
    {
      x = random(width);
      y = -10;
      vx = random(-2, 2);
      vy = random(-2, 0);
    }
    /* IF STATEMENTS GO HERE */
  }

  void display()
  {
    fill(r, g, b, 200); //last is opacity
    ellipse(x, y, rad, rad); //rad rad width and height of ellipse
    /* MOAR IF STATEMENTS */
  }
}

class Connector
{
  float x, y;
  float r, g, b;
  float age, agelimit;
  float alf;


  Connector(float _x, float _y)
  {
    x = _x;
    y = _y;
    /*r = 0;
    g = random(190, 215);
    b = random(230, 255);*/
      r = random (200,255);
    g = random (120,180);
    b = 0;
    alf = random (100, 255);
    age = 0;
    agelimit = random(200, 600);
    alf = random(100, 255);
  }

  void display()
  {
    noStroke();
    fill(r, g, b, alf);
    age++;
    ellipse(x, y, 5, 5);
  }
}


