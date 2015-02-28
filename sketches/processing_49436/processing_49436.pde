

Particle [] pickles = new Particle [0];


void setup () {
 
 size (500,500);
 smooth ();
 noStroke ();
 
 //for (int i=0; i<pickles.length; i++) {
  // pickles [i] = new Particle ();
// }
 
 
}


void draw () {
  background (0); //clear the background
  
  pickles = (Particle[]) append(pickles, new Particle());
  
   for (int i=0; i<pickles.length; i++) {
  pickles[i].update();
   }
  
  if (pickles.length>100) {
    pickles = (Particle[]) subset(pickles,1); 
    //subset deletes oldest particle so that no more than 100 particles are present in array
  }
  
}

class Particle {
 
  float x;
  float y;
  
  float velX; // speed or velocity
  float velY;
  
  float drag;
  
  color c; //the colour of the particle
  
  float particleSize;
  float shrink;
  
  Particle () {
  //follows mouse movement
    x = mouseX;
    y = mouseY;
    
    velX = random (-10,10);
    velY = random (-10,10);
    
    drag = 0.96;
    
    c = color (0,0,random (100,255));
    
    particleSize = random (10,25);
   //set size between two values so particles r random size
   
   shrink = 0.95;
  }
  
  void update () {
    
    velX *= drag; //makes particles slow down an stop
    velY *= drag;
    
    //add gravity
    
    velY+=0.5;
    
    x+=velX;
    y+=velY;
    
    particleSize *= shrink;
    
    fill (c);
    ellipse (x,y,particleSize,particleSize);
  }
  
  
}

