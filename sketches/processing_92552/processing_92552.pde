
world w;
void setup()
{
  smooth();
  ellipseMode(CENTER);
  size(800,500,P2D);
  w = new world();
  ball b1 = new ball(250,250,random(-1,1),random(-1,1));
  ball b2 = new ball(100,220,random(-1,1),random(-1,1));
  ball b3 = new ball(25,25,random(-1,1),random(-1,1));
  ball b4 = new ball(20,420,random(-1,1),random(-1,1));
  w.addobject(b1);
  w.addobject(b2);
  w.addobject(b3);
  w.addobject(b4);
  for (int i =0;i<500;i++)
  {
  w.addobject(new ball(random(20,width-20),random(20,height-20),0,0));
  }
    frameRate(100);
}

void draw()
{
  background(255);

    w.update();
}

class world
{
  int updatetimer=0;
  PVector gravity;
  ArrayList<ball> worldObject;
  //PShape bounds;
  world()
  {
    updatetimer = millis();
    //bounds = rect(0,0,width,height);
    worldObject = new ArrayList<ball>();
    gravity = new PVector(0,10);
  } 
  void addobject(ball newo)
  {
    worldObject.add(newo); 
  }
  void update()
  {
      
      float timenow = millis()-updatetimer;
    for (ball b : worldObject)
   {
     if (b.position.x < b.radius)
     {
        b.position.x = b.radius;
        b.velocity.x *= -1*.8;
     }
    if( b.position.x > width-b.radius)
     {
       b.position.x = width-b.radius;
       b.velocity.x *=-1*.8;
     }
     if (b.position.y < b.radius)
     {
       b.position.y = b.radius;
       b.velocity.y*=-1*.8;
     }
     if(b.position.y > height-b.radius)
     {
       b.position.y =height-b.radius;
       b.velocity.y *=-1*.8;
     }
    
    
  
     b.velocity.x += gravity.x/100*timenow;
     b.velocity.y += gravity.y/100*timenow;
     b.position.x += b.velocity.x/100*timenow;
     b.position.y += b.velocity.y/100*timenow;
     b.update();
     b.draw();
     for (ball a : worldObject)
     {
       if (b != a)
       {
       a.isColliding(b); 
       }
     }
     
   } 
   updatetimer =millis();
  }
  
}

class ball{
  PVector position;
  PVector velocity;
  float mass;
  float radius;
  ball()
  {
    this.position = new PVector(0,0);
    this.velocity = new PVector(0,0);
    this.mass = 10;
    this.radius = 2;  
  }
  ball(float x, float y, float dx, float dy)
  {
    this.position = new PVector(x,y);
    this.velocity = new PVector(dx,dy);
    this.mass = 10;
    this.radius = 2;
  }
  void draw()
  {
      for (int i = 1; i <10;i++)
      {
        noStroke();
        fill(255,random(0,255),0,5);
        
        ellipse(this.position.x,this.position.y,(this.radius+(10-i)*2)*2,(this.radius+(10-i)*2)*2);
      }
      //fill(100);
      
      //ellipse(this.position.x,this.position.y,this.radius*2,this.radius*2); 
  }
  void update()
  {
    this.position.x += this.velocity.x;
    this.position.y += this.velocity.y;
    //


  }
  void isColliding(ball b2)
  {
    
    float d = dist( this.position.x ,this.position.y, b2.position.x, b2.position.y);
    //println(d);
    if (d <= (this.radius+b2.radius))
    {
      
      float angle = atan2(b2.position.y-this.position.y,b2.position.x-this.position.x);
      float angle2 = atan2(this.position.y-b2.position.y,this.position.x-b2.position.x);
      //this.position.x += this.velocity.x;
      //this.position.y += this.velocity.y;
      //b2.position.x += b2.velocity.x;
      //b2.position.y += b2.velocity.y;
      this.velocity.x -= (cos(angle))*.8;
      this.velocity.y -= (sin(angle))*.8;
      b2.velocity.x -= (cos(angle2))*.8;
      b2.velocity.y -= (sin(angle2))*.8;
      this.update();
      b2.update();
    }
  }
  void setvelocity(float xv, float yv)
  {
    this.velocity.x = xv;
    this.velocity.y = yv; 
  }
  void interact(ball b2)
  {
    
  }
}

class wall{
  
}
