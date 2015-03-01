
ParticleSystem particles;
Random generator;
 
void setup()
{   
  size(400, 400);
   
  // Generate new random for Gaussian random numbers
  generator = new Random();
   
  // Create an alpha masked image to be applied as the particle's texture
  // Load mask
  PImage msk = loadImage("texture.gif");
  // Create new iamge
  PImage img = new PImage(msk.width,msk.height);
  for(int i = 0; i < img.pixels.length; i++)
    img.pixels[i] = color(255);
  img.mask(msk);
   
  particles = new ParticleSystem(0,new PVector(200,200,0),img);
}
 
void draw()
{
  background(0);
  particles.addParticle();
    particles.run();
}
 
class ParticleSystem
{
  ArrayList particles;
  PVector origin;
  PImage img;
   
  ParticleSystem(int num, PVector position, PImage img)
  {
    this.origin = position.get();
    this.img = img;
    this.particles = new ArrayList();
    for(int i = 0; i < num; i++)
      particles.add(new Particle(origin,img));
  }
   
  void run()
  {
     for(int i = 0; i < particles.size(); i++)
     {
        Particle p = (Particle) particles.get(i);
        p.run();
        if(p.dead())
          particles.remove(i);
     }
  }
   
  void addParticle()
  {
     particles.add(new Particle(origin,img));
  }
   
}
 
class Particle
{
  PVector position;
  PVector velocity;
  PImage img;
  float timer;
   
  Particle(PVector position, PImage img)
  {
    this.position = position.get();
    this.img = img;
    float x = (float) generator.nextGaussian()*0.3f;
    float y = (float) generator.nextGaussian()*0.3f - 1.0f;;
    println(x);
    println(y);
    velocity = new PVector(x,y,0);
    timer = 180.0;
  }
   
  void run()
  {
     update();
     render();
  }
   
  void update()
  {
     position.add(velocity);
     timer -= 2.5;
  }
   
  void render()
  {
     tint(255,timer);
     image(img,position.x,position.y);
  }
   
  boolean dead()
  {
     if(timer <= 0.0)
       return true;
     else
       return false;
  }
   
}

