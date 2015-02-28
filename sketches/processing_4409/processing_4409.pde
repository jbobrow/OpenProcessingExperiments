


void setup()  
{  
  size(400,600);
  background(#FFFFFF) ; 
  smooth(); 
  noStroke(); 
}  

void draw(){   
    frameRate(20); 
    

    fill (random(255), random(255), random(255));
    ellipse (random(mouseX-100, mouseX+100), random(mouseY-100, mouseY+100), 15, 15);  
  
   
} 

void mousePressed(){  
fill (random(50), random(50-180), random(160, 255));
ellipse(random(500),random(500),25,25) ;
ellipse(random(500),random(500),25,25) ;
ellipse(random(500),random(500),25,25) ;

} 
 
 
 
//whatever

