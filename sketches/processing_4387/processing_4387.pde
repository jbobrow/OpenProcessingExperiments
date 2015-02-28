


void setup()  
{  
  size(500,500);
  background(#FFFFFF) ; 
  smooth(); 
  noStroke(); 
}  

void draw(){   
    frameRate(15); 
    
    
    fill (random(150)); //DARK
    ellipse(random(300),random(300),10,10);
    ellipse(random(200,500),random(200,500),10,10);
  
  
    //LIGHT AIRY
    fill (random(50), random(50-180), random(160, 255));
    ellipse (random(200, 500), random (300), 10, 10);  
    ellipse(random(300),random(200,500),10,10);
   
} 

void mousePressed(){  
 fill(#FFFF00);
 rect(random(500),random(500),10,10) ;
} 
 
 
 


