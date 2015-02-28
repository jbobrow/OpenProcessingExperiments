

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
  
  if (frameCount%2 == 0) { //every second frame a particle comes out.
  
  pickles = (Particle[]) append(pickles, new Particle());
  
  }
  
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
  float gravity;
  
  int opacity;
  int fade;
  
  Particle () {
  //follows mouse movement
    x = mouseX;
    y = mouseY;
    
   velX = random (-10,10);
   velY = random (-10,10);
   
   

    
    drag = 0.96;
    
    c = color (0,0,random (100,255));
    
    particleSize = random (5,20);
   //set size between two values so particles r random size
   
   shrink = 1.01;
   //shrink is number less than one 0.95 and grow is number about one 1.05
   
   gravity = 0.5;
   opacity = 10;
   fade =  50;
  }
  
  void update () {
    
    velX *= drag; //makes particles slow down an stop
    velY *= drag;
    
    //add gravity
      velY+=gravity;
    
    x+=velX;
    y+=velY;
    
    opacity-=fade;
    
    particleSize *= shrink;
    
    fill (c);
    ellipse (x,y,particleSize,particleSize);
  }
  
  
}

