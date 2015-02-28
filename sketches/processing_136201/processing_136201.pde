
////
// "Schotter" recreation
// by Georg Nees
// new code by patrick odonnel
// 02-24-2013
////

void setup() {  
  size(240, 440);  
  background(255);   
  noLoop();  
  noFill();
}  


int sq = 20;
int rows = sq/2;
int columns = sq;  

void draw() {  
  
  for (int r = 0; r<rows ; r++) {    
    for (int c = 0; c<columns; c++) {      
     
                    pushMatrix();  
      //set up variables for x and y position of top left rect corner              
      float x = 20 + r*sq + (random(-c*r/(sq), c*r/(sq)));      
      float y = 20 + c*sq + (random(-c*r/(sq), c*r/(sq)));      
      
      //move origin from (0,0)
      translate(x, y);        
      
      //set up variable for rotation
      float rot = random(-2*c*r/(sq), 2*c*r/(sq));            
      
      //rotate about new origin
      rotate(radians(rot));        
      
      rect(0, 0, sq, sq);      
                    popMatrix();
    }
  }
}

