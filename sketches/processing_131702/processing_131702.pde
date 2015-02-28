

/*
Prueba para la tarea 01
Taller de programación MDI UVeritas
 
Reference:    http://www.openprocessing.org/sketch/116310
Author:       David Morera Chavarría
Description:  Bouncing ball. Class.
*/

//Clase

class Ball {
  float xpos, ypos;
  float xspeed, yspeed;
  float r;
 
  Ball() {
    xspeed = random(-1, 4);
    yspeed = random(-1, 4);
    xpos = width/2;
    ypos = height/2;
    r = random(20, 40);
  }
  void run() {
    update();
    bounce();
    display();
  }
 
  void update() {
    xpos += xspeed;
    ypos += yspeed;
  }
 
  void display() {
    fill(#0D42AE);
    ellipse(xpos, ypos, r*2, r*2);//by2Diameter
  }
 
 
  void bounce() {
    if ( (ypos > height-r) || (ypos < r))
    {
      yspeed *= -1;
    }
    if ( (xpos > width-r) || (xpos < r))
    {
      xspeed *= -1;
    }
  }
}
// Cierre de la clase


Ball a, b, c, d, e, f;//establecer
 
void setup()
{
  size(200, 400);
  smooth();
  noStroke();
  a = new Ball();
  b = new Ball();
  c = new Ball();
  d = new Ball();
  e = new Ball();
  f = new Ball();
}
void draw()
{
  transBackground();
  a.run();//llamar
  b.run();
  c.run();
  d.run();
  e.run();
  f.run();
}
 
void transBackground() {
  fill(0, 255); //fondo con alpha
  rect(0, 0, width, height);
}
 



