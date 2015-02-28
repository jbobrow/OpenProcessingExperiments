
//Copyright 2013
//D. John Kirby

Ball Earth;
Ball Mars;
Ball Venus;

void setup()
{
 size(760,760);
 translate( width/2, height/2);
 background(0);
 Earth  = new Ball(0.0,200.0,9.0,0.0,color(0,0,255),20);
 Mars  = new Ball(0.0,250.0,10.0,0.0,color(255,0,0),15);
 Venus = new Ball(0.0,150.0,11.0,0.0,color(255,177,0),19);

// Earth.display();
}

void draw()
{
 background(0);
 translate( width/2, height/2);
 fill(255,255,0);
 ellipse(0,0,50,50);
 Earth.display();
 Mars.display();
 Venus.display();
 Earth.move(); 
 Mars.move();
 Venus.move();
}

class Ball
{
 float xpos;
 float ypos;
 float xvel;
 float yvel; 
 float rad;
 float fric;
 float gravy = 20000;
 color col;

 Ball(float xin, float yin, float xvin, float yvin, color col, int rad)
 {
  xpos = xin;
  ypos = yin;
  xvel = xvin;
  yvel = yvin; 
  this.rad = rad;
  this.col = col;
 }
 
 void display()
 {
  fill(col);
  ellipse(xpos,ypos,rad,rad); 
 }
 
 void move()
 {
   float gravityFelt = gravy/pow(dist(xpos,ypos,0,0),3);
   xpos = xpos + xvel;
   ypos = ypos + yvel;
   xvel = xvel - gravityFelt*xpos;
   yvel = yvel - gravityFelt*ypos;
 }
}

