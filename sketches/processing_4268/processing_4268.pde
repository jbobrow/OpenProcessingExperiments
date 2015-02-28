
// Used for assignment ARCH1391 David Butterworth 'Metaphor'
// All code thanks to Daniel Shiffman 'Tree' unless stated otherwise

float theta;    
 
void setup() { 
  size(1000, 800); //Edited David Butterworth
  smooth(); 
} 
 
void draw() { 
  background(0); 
  frameRate(100); //Edited David Butterworth
  stroke(0,206,255); //Edited David Butterworth
   
  
  float a = (mouseX / (float) width) * 45f; 
   theta = radians(a); 
  translate(width/2,height); 
   fill(0,61,200); //Edited David Butterworth
  rect(-27,0, 27,-200); //Edited David Butterworth
    translate(0,-200); //Edited David Butterworth
    branch(250, 30); //Edited David Butterworth
 
} 
 
 
 
void branch(float h, float w) { 
  h *= 0.70; 
  w *= 0.70; //Edited David Butterworth
   
  if (h > 5) { 
    pushMatrix();     
    rotate(theta);   
    rect(-w, 0, w, -h); //Edited David Butterworth
    translate(0, -h);  
    branch(h, w);       
    popMatrix();     
     
    pushMatrix(); 
    rotate(-theta); 
    rect(-w, 0, w, -h); //Edited David Butterworth
    translate(0, -h); 
    branch(h, w); 
    popMatrix(); 
  } 
} 
 


