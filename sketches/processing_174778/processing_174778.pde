
// the particle architecture is borrowed from
// The Nature of Code, Daniel Shiffman, http://natureofcode.com
 ParticleSystem ps;
void setup() {
    size(128*5, 128*5);
    background(255);
   ps = new ParticleSystem(new PVector(0, 0) );
   ps.addParticles(  );
}
void draw() {  
  background(255);
  // ps.addParticles(  );
   pushMatrix();
   translate(width/2, height/2);
    ps.run();
    popMatrix();
}
/////////////////////////////////////////////
/////////////////////////////////////////////
class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
    ParticleSystem(PVector location){ 
    origin = location.get();
    particles = new ArrayList<Particle>();
}
void addParticles(  ){
    PVector place;   
    float magnimax=400;
      for (float i=-magnimax; i<magnimax; i+=0.05) {
          float x = random(-180,180);
          float y = i + random(-3,3);
           place = new PVector(x, y  ); 
            particles.add(new Particle( place,  sqrt(magnimax*magnimax/4 - y*y)  )); //cos(radians(y))*100 
    }
  }
void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run(  particles); // ()
      if (p.isDead()) {
        particles.remove(i);
      }
    }  
  }
}
/////////////////////////////////////////////
/////////////////////////////////////////////
class Particle {
  PVector loc, vel, acc, loc0;
  float lifespan;
  float s, xx,yy, magni, myspeed, mytwist;
   // initialize
  Particle(PVector l, float m ) {
    loc0 = l.get();
    loc = new PVector(0,0,0 );
    magni=m;
    lifespan = 30.0;
    s=0;
    xx=0; yy=0;
  }
  void run(ArrayList<Particle> particles) { 
    update();
    display();
  }
  
  void update() {
    myspeed= map(mouseX,0,width,0.1,2);
    mytwist= map(mouseY,0,height,0,2) ;
    s=s+ 1;
   loc.x= cos(radians( (s+ loc0.x*myspeed) / myspeed ) )* magni   ;
   loc.y= loc0.y;//  cos(radians( (s+ loc0.y *myspeed) / myspeed/ mymorph )) * sqrt(400*400/4 - loc0.x*loc0.x)   ;
   //  lifespan -= 2.0;
   //loc.rotate(mytwist);
  }

  void display() {
     float   x= loc.x  +0;// lifespan/2; // width/100; //*15;
     float   y= loc.y  +0;// lifespan/2;// height/100;// *15;
//    stroke( (x/2), y/2 ,x,lifespan*3 );  //stroke(0,lifespan);
    stroke(0);
    strokeWeight(4.5);
   point(x,y );
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }  
}
/////////////////////////////////////////////
/////////////////////////////////////////////
