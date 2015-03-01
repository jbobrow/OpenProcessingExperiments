
ParticleSystem ps;
FlowField ff;

float t = 0;
boolean pause = false;

color black = color(0, 0, 0);
color brown = color(39, 23, 16);



void setup()
{
  size(720, 480);
  bg(black, brown);  
  
  ff = new FlowField();
   
  ps = new ParticleSystem();
  ps.addParticles();  
}

void draw()
{ 
  ff.init(t);
  ps.run(ff);
  t += 0.0003;
}


void mousePressed()
{
  noiseSeed((int)random(10000));
  ps.restart();
  bg(black, brown);
  pause = false;
}


void keyPressed()
{
  if (key == 'p' || key == 'P') pause = !pause;
  if (pause) {  noLoop();  }
  else {  loop();  }
  
  if (key == 's' || key =='S')  saveFrame("smoke-###.png");
  
  
}


void bg(color c1, color c2)
{
  for (int i = 0; i < height; i++)
  {
    float j = map(i, 0, height, 0, 1);
    stroke(lerpColor(c1,c2,j));
    line(0, i, width, i);
  }
}
class FlowField
{
  PVector[][] field;
  int cols, rows;
  int resolution;
  
  FlowField()
  {
    resolution = 10;
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
  }
  
  void init(float t)
  {
    float xoff = 0;
    for (int i = 0; i < cols; i++)
    {
      float yoff = 0;
      for (int j = 0; j < rows; j++)
      {
        float theta = noise(xoff, yoff, t);
        theta = map(theta, 0, 1, 0, TWO_PI);
        
        field[i][j] = new PVector(cos(theta), sin(theta));
        
        yoff += 0.07;
      }
      xoff += 0.07;
    }
  }
 
  
  PVector lookup(PVector lookup)
  {
    int column = int(lookup.x / resolution);
    column = constrain(column, 0, cols - 1);
    
    int row = int(lookup.y / resolution);
    row = constrain(row, 0, rows - 1);
    
    return field[column][row].get();
  }
  
  
}
class Particle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float maxForce;
  
  
  Particle(PVector l)
  {
    location = l.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    maxSpeed = 1;
    maxForce = 0.15;
  }
    
    
  void bounderies()
  {
    if (location.x < 0)  {  location.x = width;  }
    else if (location.x > width)  {  location.x = 0;  }
    
    if (location.y < 0)  {  location.y = height;  }
    else if (location.y > height)  {  location.y = 0;  }    
  }
  
  
  void follow(FlowField flow)
  {
    PVector desired = flow.lookup(location);
    desired.limit(maxSpeed);
    
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  
  void applyForce(PVector force)
  {
    acceleration.add(force);
  }
  
  
  void update()
  {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  
  void display()
  {
    stroke(chooseColor(), 10);
    point(location.x, location.y);
  }
  
  
  color chooseColor()
  {
    color c;
    color orange = color(255, 246, 237);
    color white = color(255, 255, 255);
    color blue = color(163, 229, 253);
    
    int choice = frameCount % 400;
    int amt = (frameCount % 100) / 100;
    
    if (choice < 100)  {  c = lerpColor(orange, white, amt);  }
    else if (choice < 200)  {  c = lerpColor(white, blue, amt);  }
    else if (choice < 300)  {  c = lerpColor(blue, white, amt);  }
    else  {  c = lerpColor(white, orange, amt);  }
    
    return c;
  }
}
class ParticleSystem
{
  ArrayList <Particle> particles;
  
  
  ParticleSystem()
  {
    particles = new ArrayList <Particle> ();
  }
  
  
  void addParticles()
  {
    for (int i = 0; i < 100; i++)
    {
      PVector l = new PVector(random(width), random(height));
      particles.add(new Particle(l));
    }
  }
  
  
  void restart()
  {
    for (int i = 99; i >= 0; i--)  {  particles.remove(i);  }
    addParticles();
  }
  
  
  void run(FlowField flow)
  {
    for (Particle p : particles)
    {
      p.follow(flow);
      p.bounderies();       
      p.update();
      p.display();
    }
  }
}


