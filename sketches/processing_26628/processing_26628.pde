
class Burst {
  
  Point[] particles; //store particles
                     //note y-values used to store direction
  Point[] particlesPrev; //store positions of previous frame
  
  Point initPos;
  
  int numParticles; //number of remaining particles
  int countFrames = 0; //number of frames since the beginning of burst
  int transparency = 50;
  
  //constructor
  Burst(int numParticles, float posX, float posY) {
    particles = new Point[numParticles];
    particlesPrev = new Point[numParticles]; 
    
    for (int i = 0; i < numParticles; i++) {
      particles[i] = new Point(0, 0);
      particlesPrev[i] = new Point(0, 0);
    }
    
    initPos = new Point(posX, posY);
    this.numParticles = numParticles;
  }
  
  //continue animating existing particles
  void update() {
    Point tmp = new Point(0, 0);
    float diff;
    
    //if start of burst
    if (countFrames == 0) {
      
      //determine particles initial direction
      for (int i = 0; i < numParticles; i++) {
        particles[i].x += random(-50, 50); //distance
        particles[i].y = random(0, 360); //direction
      }    
      
    }else{
      for (int i = 0; i < numParticles; i++) {
        
        diff = particles[i].x - particlesPrev[i].x;
        tmp.x = particles[i].x;
//        particles[i].x += random(diff);
        particles[i].x += diff*0.85; //updated distance from origin
        particlesPrev[i].x = tmp.x;
      }       
    }
    countFrames++;
  }

  //draw current frame of burst
  void display() {
    //colour dependent on position of particle
    int colour = int(map(particles[0].x, -200, 200, 0, 255)); 
    transparency = int(map(countFrames, 0, 50, 50, 0));
    
    pushMatrix();
    translate(initPos.x, initPos.y);
    
    for (int i = 0; i < numParticles; i++) {
      rotate(radians(particles[i].y));
      
      colorMode(HSB);
      fill(colour, countFrames*5, 255, transparency);
      stroke(255, transparency);
//      strokeWeight(3);
      
//      particlesPrev[i].output();
//      particles[i].output();

      ellipse(particles[i].x, 0, 5, 5);  
    }
    
    colorMode(RGB);
    popMatrix();
  }

  //delete particle at index
  void delete(int indexToDelete) {
      swapEnd(particles, indexToDelete);
      particles = (Point[]) shorten(particles);
  } 
  
  //check burst finished
  boolean isOver() {
    return (transparency < 1);
  }
}

