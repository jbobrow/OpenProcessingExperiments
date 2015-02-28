
ParticleSystem ps = new ParticleSystem();  

boolean mouseDown = false;  

   

void setup()  

{  

  size(800,600,P2D);  

  smooth();  

  background(200);  

  noStroke();  

  ellipseMode(RADIUS);  

}  

   

void draw()  

{  

  background(255);  

  if(mousePressed)  

  {  

    ps.add(new Particle(mouseX, mouseY));  

  }  

  ps.run();  

}  

   

void keyPressed()  

{  

  if(key != CODED)  

  {  

    switch(key)  

    {  

      case 'r' : ps.removeAll(); break;  

    }  

  }  

} 

class Particle   

{  

  float x = width/2;  

  float y = height/2;  

  float xv = -3+random(6);  

  float yv = -random(4);  

  float maxYV = 20;  

  float gravity = 0.019;  

  float friction = 0.89;  

  float radius = random(10) + 5;  

  color c = color((0),(0),(0));  

     

  Particle(){  }  

   

  Particle(float xp,float yp)  

  {  

    x = xp;  

    y = yp;  

  }  

   

  Particle(float xp,float yp,float xvel,float yvel)  

  {  

    this(xp, yp);  

    xv = xvel;  

    yv = yvel;  

  }  

   

  void run()  

  {  

    update();  

    render();  

  }  

   

  public void update()  

  {  

    if(x <= radius)  

    {  

      xv = abs(xv);  

    }   

    else if(x >= width - radius)  

    {  

      xv = -abs(xv);  

    }  

   

    if(y + radius >= height)  

    {  

      yv = -abs(yv);  

      if(y + radius - height >= 0.15)  

      {  

        y = height - radius;  

        if(yv > -0.1)  

        {  

          xv *= 0.96;  

        }  

      }  

    }  

   

    if((yv < maxYV))  

    {  

      yv += gravity;  

    }  

    yv *= friction;  

    //println(yv);  

    y += yv;  

   

    x += xv;  

  }  

   

  void render()  

  {  

    fill(c);  

    ellipse(x,y,radius,radius);  

  }  

} 

class ParticleSystem  

{  

  ArrayList particles = new ArrayList();  

     

  ParticleSystem(){}  

     

  void add(Particle p)  

  {  

    particles.add(p);  

  }  

     

  void removeAll()  

  {  

    particles.clear();  

  }  

     

     

  void run()  

  {  

    for(int i = 0; i < particles.size(); i++)  

    {  

      Particle p = (Particle)particles.get(i);  

      p.run();  

    }  

  }  

} 




