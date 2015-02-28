

int NUM_PARTICLES = 1000;
ParticleSystem p;
void setup(){
  smooth();
  size(1600,800);
  p = new ParticleSystem();
  
}

void draw(){
  fill(0,5);
  rect(0,0,width,height);
  p.update();
  p.render();
}
class Particle
{
  PVector position, velocity;
  
  Particle()
  {
    position = new PVector(random(width),random(height));
    velocity = new PVector();
  }
  
  void update()
  {
    velocity.x = 200*(noise(mouseX/1+position.y/100)-0.5);
    velocity.y = 200*(noise(mouseY/1+position.x/100)-0.5);
    position.add(velocity);
     
    
    if(position.x < 0)position.x = mouseX;
    if(position.x>width)position.x=mouseX;
    if(position.y<0)position.y = mouseY;
    if(position.y>height)position.y = mouseY;
    
    if(mousePressed == true){
      stroke(random(255),random(255),random(255));
      position.x = random(1600);
      position.y = random(800);
      velocity.x++;
      velocity.y++;
    }
  }
  
  void render()
  {
    stroke(random(255));
    fill(random(255),random(255),random(255),random(255));
    line(position.x,position.y,position.x-velocity.x,position.y-velocity.y);
  }
}
      
class ParticleSystem
{
  Particle[] particles;
  
  ParticleSystem()
  {
    particles = new Particle[NUM_PARTICLES];
    for(int i = 0; i < NUM_PARTICLES; i++){
      particles[i] = new Particle();
    }
  }
  
  void update()
  {
    for(int i = 0; i < NUM_PARTICLES; i++){
      particles[i].update();
    }
  }
  
  void render(){
    for(int i = 0; i < NUM_PARTICLES; i++){
      particles[i].render();
    }
  }
}


