
Stripe[] myStripes = new Stripe[10];

void setup() { 
  size(400,400); 
  smooth();   
  noStroke(); 
  
  for(int i=0; i<myStripes.length; i++) { 
    
    myStripes[i] = new Stripe(i*40);  
    
  }
  
}

void draw() { 
  
  
 for(int i=0; i<myStripes.length; i++) { 
    
   
    myStripes[i].drawStripe();  
    
  } 
  
}




class Stripe {
  
  float x; 
  float w; 

  // constructor
  Stripe(float xpos) { 
    
    x = xpos; 
    w = 20; 
  
  }  

  void drawStripe() { 
   
     rect(x, 0, w, height); 
   
    
  }
  
}
