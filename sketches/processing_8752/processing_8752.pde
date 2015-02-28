
void setup() 
{ 
  size(600,600); 
  smooth(); 
  noLoop(); 
} 

void draw() 
{ 
  background(255);    
  strokeWeight(10); 
  translate(width/2,height-20); 
  branch(0); 
} 

void branch(int depth){ 
  if (depth < 12) { 
    line(0,0,0,-height/10); 
    { 
      translate(0,-height/10); 
      rotate(random(-0.1,0.1));  

      if (random(1.0) < 0.6){ // branching   
        rotate(0.3);
        scale(0.7);
        pushMatrix(); 
        branch(depth + 1); 
        popMatrix();     
        rotate(-0.6);
        pushMatrix(); 
        branch(depth + 1);    
        popMatrix();         
      } 
      else { // continue   
        branch(depth);
      } 
    } 
  }
} 


void mouseReleased(){ 
  redraw();  
} 



