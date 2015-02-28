
 import ddf.minim.*;

Minim minim;
AudioInput in;
 float volume = 0;
float volumeF = 0;
  
   int maxParticles=300; // max number of particles. real particles count depends on ppf and its lifetime
int addPPF=2;         // number of particles per frame added
ArrayList particles;
  
void setup(){
  size(450,450);
  frameRate(30);
  smooth();
  background(0);
  noStroke();
     minim = new Minim(this);
  minim.debugOn();
  
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.MONO, 512);
    
    
  particles = new ArrayList();
}
  
void draw(){
  background(0); // overpaint circles the frame before
  //  for(int i = 0; i < 1; i++)
  //{
     volumeF = in.right.level()*1000;
  volume = 0.8*volume + 0.2*volumeF;
  if(particles.size()<maxParticles){
    /* add particle(s) */
    for(int k=1; k<= volume; k++){
      particles.add(new Particles());
    }
  }
  //}
  
  /* run trought all Balls and make some action */
  for(int j=0; j<particles.size(); j++){
    Particles particle = (Particles)particles.get(j);
    /* if particle still alive */
    if( particle.alive() ){
      /* update x/y positions */
      particle.position();
      /* now draw as cirle */
      fill(255,0,0, particle.lt);
      ellipse(particle.x, particle.y, particle.r, particle.r);
    }else{
      /* if lifetime is running out, delete */
      particles.remove(j);
    }
  }
}
  
  
  void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  
  super.stop();
}
  
public class Particles {
  float r, x, y, _x, _y, dx=0, dy=0, lt;
     
  /* init start-values */
  public Particles() {
    /* start position center */
    x=width/2;
    y=height/2;
    /* now random values to make it non-linear */
    lt=random(50,100);       // lifetime in frames
    r=random(20, 50);        // circle Radius
    _x=random(-0.5, 0.5);    // stepwidth in x-pos (left, right)
    _y=random(-0.5, 0.5);    // stepwidth in y-pos (up, down)
  }
  
  public void position() {
    /* stepwidth increases, circlespeed is exponential */
    dx+=_x;
    dy+=_y;
    x+=dx;
    y+=dy;
  }
  
  public boolean alive(){
     if(lt<=0){ return false; }else{ lt--; return true; }
  }
}


