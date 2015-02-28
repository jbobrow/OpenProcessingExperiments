
// CREATING CRAYON CLASS:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

// CRAYON CLASS VARIABLES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class Crayon {
  
 PVector location;
 PVector velocity; 
 PVector acceleration;
 float maxvelocity; 
 float maxforce; 
 float crayonSize;
 
// CRAYON CONSTRUCTOR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Crayons have three vectors: (i) location; (ii) velocity; (iii) acceleration

Crayon (){
    location = new PVector(random(width), random(height));
    velocity = new PVector (random (5,10), random (5,10));  
    acceleration = new PVector (0,0);
    
    maxvelocity = random (1,5);
    maxforce = random (40,50);
    crayonSize = 20;
 
  }  
  
// CRAYON METHODS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 

// Crayons Functions -- General...............................  
 
  void run(){
    borders();
    render();

    velocity.add(acceleration);
    velocity.limit(maxvelocity);
    location.add(velocity);
    acceleration.set(0,0,0);
  }   
  
// Crayon Function -- seek...................................

  void seek(PVector sp, float boundary, boolean slowdown){
   acceleration.add(turnFunction(sp, boundary, false));
  }
  

// Crayon Function -- turnFunction............................

  PVector turnFunction (PVector desired, float boundary, boolean slowdown){
    PVector turnFunction;
    
    desired.sub(location);
    float distance = desired.mag();
    
    if (distance > 0){
      desired.normalize();
      if ((slowdown) && (distance < boundary/2)) desired.mult(maxvelocity *(boundary/width));
      else desired.mult(maxvelocity);
    
      desired.sub(velocity);
      turnFunction = desired.get();

       turnFunction.limit(maxforce);
      } else {
      turnFunction = new PVector(0,0);
      }
    return turnFunction;
  }    


// WRAPAROUND BORDERS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
 void borders() {
    if (location.x > width ) location.x = 0;
    if (location.x < 0     ) location.x = width;
    if (location.y > height) location.y = 0;
    if (location.x < 0     ) location.y = height; 
  }

// DRAW CRAYON >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
 void render(){
   ellipse(location.x, location.y, crayonSize, crayonSize);
 }
  
// End
}


