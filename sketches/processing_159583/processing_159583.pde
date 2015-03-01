
float nScale = 400;

class particle
{
  float theta, u;
  float x,y,z;
  
  particle(float Theta, float U)
  {
    theta = Theta;
    u = U;
  }
  
  void update(float tm)
  { 
    float sU = u;
    float sTheta = noise(tm, u*2) + theta;
    
    float noiseV = noise((x+sTheta)/nScale, (y+sU)/nScale, tm*2)*100;
    x = (radius+noiseV) * cos(sTheta)*sqrt(1-(sU*sU));
    y = (radius+noiseV) * sin(sTheta)*sqrt(1-(sU*sU));
    z = sU*(radius + noiseV);
  }
   
  void render()
  {
    stroke(255,128,128);
    line(0,0,0,x,y,z);
    pushMatrix();
      translate(x,y,z);
      noStroke();
      box(2);
      //sphere(2);
    popMatrix();
    
  }
}


class particleBall
{
  particle[] Particles = new particle[NUM_PARTICLES];
   
  particleBall()
  {
    for(int i = 0; i < NUM_PARTICLES; i++)
    {
      float theta = random(0,TWO_PI);
      float u = random(-1,1);
      Particles[i] = new particle(theta,u);
    }
  }
   
  void update(float tm)
  {
    fill(20,20,20,255);
    sphereDetail(40);
    sphere(radius);
    fill(255,45,45,100);
    for(int i = 0; i < NUM_PARTICLES; i++)
    {
      Particles[i].update(tm);
      Particles[i].render();
    }
  }
}



int NUM_PARTICLES = 120;
 
particleBall ParticleBall;
float startingRadius = 100, radius = 150;
int centerX, centerY;
boolean mouseDown = false;
float t = 0;

PShader blur;

void setup()
{
  
  size(400,400,P3D);
  
  ParticleBall  = new particleBall();
  
  frameRate(36);

}

void draw()
{
  
  background(1,1,1,255);
  
  noStroke();

  camera(0,0,500, 0,0,0, 0,1,0);
  if(mouseDown)
  {
    radius = startingRadius + centerX-mouseX;
  }
  background(1,1,1,255); 
  pushMatrix();
    rotateY(map(mouseX,0,width,0,TWO_PI));
    rotateX(map(mouseY,0,height,0,TWO_PI));
    fill(150,222,45, 50);
    ParticleBall.update(t);

  popMatrix();
  t += 0.01;
}
 
void mousePressed()
{
  mouseDown = true;
  centerX = mouseX;
  centerY = mouseY;
}
 
void mouseReleased()
{
  mouseDown = false;
}
 
