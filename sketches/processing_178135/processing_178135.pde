
  ArrayList<Particle> particles;
  //PVector wind;
  int N = 50;  // Change this value for different effects.
  int r  = 255;
  int b  = 255;
  int g  = 255;
  
  void setup()
  {
   size(500, 500);
   particles = new ArrayList<Particle>();
   background(0);
   for(int i = 0; i < N; i++)
   particles.add(new Particle(width/2 + 80 * cos(i * TWO_PI/N), height/2 + 80 * sin(i * TWO_PI/N), 5) );
  }
  
  void draw()
  {
   // fill(255, 5);
   //rect(0, 0, width, height);
   //background(255);
   //wind = new PVector(mouseX - pmouseX, mouseY - pmouseY);
   for(Particle p : particles)
   p.run();
  // println(frameRate);
   
   //Make connections between particles 0 and 1, 1 and 2, so forth.
   for(int i = 0; i < N - 1; i++)
   {
     Particle q = (Particle)particles.get(i);
     Particle r = (Particle)particles.get(i + 1);
     q.drawLine(r);  
   }
   //Connect the last particle to the first particle.
   particles.get(0).drawLine(particles.get(N-1));
   
   //Color change
   if(mousePressed)
   {
    r = int(random(255));
    b = int(random(255));
    g = int(random(255));
   //particles.get(2).applyForce(wind);
   }
  }
  


 class Particle
 {
  
   PVector location, velocity, acceleration;
   float mass;
   float damping = 1;
   int topspeed = 2;
   
   Particle(float X_, float Y_, float mass_)
   {
    mass = mass_;
    location = new PVector(X_, Y_);
    velocity = new PVector(random(-5, 5), random(-5, 5));
    acceleration = new PVector(0, 0);
   }
    
   void applyForce(PVector p)
   {
    p.div(mass);
    acceleration = p; 
   }
   
   void update()
   {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration = new PVector(0, 0);
   
    if(velocity.mag() < 0.001f * 0.001f)
    velocity = new PVector(0, 0); 
   
    velocity.limit(topspeed);
    velocity.mult(damping);
   }
   
   void display()
   {
    fill(175);
    //ellipse(location.x, location.y, 20, 20);
   }
   
   void run()
   {
    update();
    collisionCheck();
    //display(); 
   }
   
   void drawLine(Particle p)
   {
    stroke(r, b,g, 10);
    line(location.x, location.y, p.location.x, p.location.y);
   }
   
   void collisionCheck()
   {
    if(location.x > width)
      {
        location.x = width;
        if(velocity.x > 0 )
        velocity.x *= -1;
      }
       if(location.x < 0)
      {
        location.x = 0;
        if(velocity.x < 0 )
        velocity.x *= -1;
      }
      if(location.y > height)
      {
        location.y = height;
        if(velocity.y > 0 )
        velocity.y *= -1;
      }
       if(location.y < 0)
      {
        location.y = 0;
        if(velocity.y < 0 )
        velocity.y *= -1;
      }
   }
 }


