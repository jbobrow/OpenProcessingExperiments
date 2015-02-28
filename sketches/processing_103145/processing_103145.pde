
Mover[] m = new Mover[100];
Liquid liquid;
PVector gravity;
PFont font;

void setup()
{
    size(640, 640);
    smooth();
    liquid = new Liquid(0, height/2, width, height/2, 0.1);
    font = loadFont("Dialog-16.vlw");
    for (int i = 0; i < m.length; i++)
      m[i] = new Mover(random(0.4, 3), random(width), 0);
}

void draw()
{
    background(245);  
    liquid.display();
    
    textFont(font);
    fill(80);
    text("attrito aerodinamico - aerodynamic friction", 5, 20);
    text("click del mouse per ricominciare - click to reset", 5, 35);
    
    for (int i = 0; i < m.length; i++)
    {
      if(m[i].isInside(liquid))
        m[i].drag(liquid);
        
      float massa = 0.1*m[i].mass;
      gravity = new PVector(0, massa);
      m[i].applyForce(gravity);
 
      m[i].update();
      m[i].checkEdges();
      m[i].display();
    }
}

class Liquid
{
  float x, y, w, h;
  float c;
  
  Liquid(float x_, float y_, float w_, float h_, float c_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
  
  void display()
  {
    noStroke();
    fill(90, 212, 255);
    rect(x, y, w, h);
  }
}

void mousePressed() {
    for (int i = 0; i < m.length; i++)
      m[i] = new Mover(random(0.4, 3), random(width), 0);
}



class Mover
{
    PVector location;
    PVector velocity;
    PVector acceleration;
    float mass;
    float radius;
    float alpha;
    
    Mover(float m, float x, float y)
    {
      location = new PVector(x, y);
      velocity = new PVector(0, 0);
      acceleration = new PVector(0, 0);
      mass = m;
      radius = mass*8;
      alpha = 80;

    }
    
    void update()
    { 
      velocity.add(acceleration);
      location.add(velocity);
      velocity.limit(10);
      acceleration.mult(0);
      
    }
    
    void display()
    {
       stroke(50, 80);
       fill(120, 80);
       ellipse(location.x, location.y, radius*2, radius*2);
    }
    
    void checkEdges()
    {
        if(location.x > (width - radius))
        {
          location.x = width-radius;
          velocity.x *= -1;
        }
        else if(location.x < radius)
        {  
          location.x = radius;
          velocity.x *= -1;
        }
           
        if(location.y > (height-radius))
        {
          velocity.y *= -1;
          location.y = height - radius;
        }
        else if(location.y < radius)
        {
          velocity.y *= -1;
          location.y = radius;
        }
    }
    
    boolean isInside(Liquid l)
    {
      if(location.x >= l.x && location.x <= l.x+l.w && location.y >= l.y && location.y <= l.y+l.h)
        return true;
      else
        return false;
    }
    
    void drag(Liquid l)
    {
      float speed = velocity.mag();
      float dragMag = speed*speed*l.c*1*1*0.5;
      PVector drag = velocity.get();
      drag.normalize();
      drag.mult(-1);
      drag.mult(dragMag);
      applyForce(drag);
    }
      
    
 void applyForce(PVector force)
 {
    acceleration.add(PVector.div(force, mass));
 }   
    
}
