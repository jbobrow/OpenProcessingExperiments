

Particle [] pickles = new Particle [0];


void setup () {
 
 size (500,500);
 smooth ();
 noStroke();
 
 //for (int i=0; i<pickles.length; i++) {
  // pickles [i] = new Particle ();
// }
 
 
}


void draw () {
  background (100); //clear the background
  
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
  
  
  Particle () {
   //x and y position to be in middle of screen
    x = width/2;
    y = height/2;
    
    velX = random (-10,10);
    velY = random (-10,10);
    
   
  }
  
  void update () {
    
    velX *= 0.95; //makes particles slow down an stop
    velY *= 0.95;
    
    x+=velX;
    y+=velY;
    
    fill (255,0,0);
    ellipse (x,y,10,10);
  }
  
  
}

