
int FPS = 30;  

int SECONDS_TO_RECORD = 60;  

int MAX_FRAMES = SECONDS_TO_RECORD*FPS;  

boolean recording = false;  

int NUM_PARTICLES = 400;  

//import processing.opengl.*;  

//import processing.video.*;  

   

//MovieMaker mm;  

   

color backgroundColor;  

particle[] Particles = new particle[NUM_PARTICLES];  

int framecount = 0;  

void setup()  

{  

  size(500,500, P3D);  

  noStroke();  

  background(0);  

  frameRate(FPS);  

  //mm = new MovieMaker(this, width, height, "o.mov", FPS, MovieMaker.ANIMATION, MovieMaker.HIGH);  

  for(int i = 0; i < NUM_PARTICLES; i++)  

  {  

    Particles[i] = new particle();  

  }  

}  

   

void draw()  

{  

  pushMatrix();  

  translate(0,0,-200);  

  background(0);  

  for(int i = 0; i < NUM_PARTICLES; i++)  

  {  

    Particles[i].update();  

  }  

  if(recording)  

  {  

    //mm.addFrame();  

    framecount++;  

    if(framecount==MAX_FRAMES)  

    {  

      //mm.finish();  

      exit();  

    }  

  }  

  popMatrix();  

}  

   

class particle  

{  

  PVector position;  

  PVector velocity;  

  float mass;  

   

  particle()  

  {  

    position = new PVector();  

    velocity = new PVector();   

    position.x = random(width);  

    position.y = random(height);  

    velocity.x = 0;  

    velocity.y = 0;  

    mass = random(1,2);  

  }  

   

  void followGravity(PVector location, float mass1, float mass2)  

  {  

    PVector unitVector = new PVector();  

    unitVector = location.get();  

    unitVector.sub(position);  

    float dist = location.dist(position);  

    unitVector.normalize();  

    PVector force = new PVector();  

    double g = -0.06673;  

    g *= ((mass1*mass2)/(dist));  

    force.x = (float)(g*(double)unitVector.x);  

    force.y = (float)(g*(double)unitVector.y);  

    float magnitude = force.mag();  

    velocity.sub(force);  

  }  

   

  void update()  

  {  

    for(int i = 0; i < NUM_PARTICLES; i++)  

    {  

      if(position.x != Particles[i].position.x || position.y != Particles[i].position.y)  

      {  

        followGravity(Particles[i].position, mass,Particles[i].mass);  

      }  

    }  

   

    velocity.mult(0.9);  

    position.add(velocity);  

    PVector center = new PVector(width/2,height/2);  

    if(position.dist(center)>400)  

    {  

      PVector normalVec = new PVector();  

      normalVec=position.get();  

      normalVec.sub(center);  

      normalVec.normalize();  

      normalVec.mult(10);  

      velocity.sub(normalVec);  

    }  

    render();  

  }  

   

  void render()  

  {  

    fill(255,255,255);  

    pushMatrix();  

    translate(position.x,position.y,0);  

    rect(0,0,2,2);  

    popMatrix();  

  }  

}  

   

void keyPressed()  

{  

  if(key=='s'||key=='S')  

  {  

    //mm.finish();  

    exit();  

  }  

  if(key==' ')  

  {  

    if(recording)  

    {  

      recording = false;  

      //mm.finish();  

      exit();  

    }  

    else 

    {  

      recording = true;  

    }   

  }  

} 


