
size (800,600); 
background (255);  
smooth(); 
noFill();

//um ponto
strokeWeight(2); 
point ( random(width), random(height));

smooth();
noStroke();
for ( int i = 0; i < 100000; i = i +1)
{
strokeWeight(random(2)); 
stroke(0);
point ( random(width), random(height) );
}

for ( int i = 0; i < 10000; i = i +1)
{
 
 
    stroke (255,222,171, 90);
    line(width/800, random(height), width-width/600, random(height) );

}






int numObject = 3000; 

float rectHeight, rectWidth, posX, posV; 

noStroke();
fill(255,255,0,0);


noStroke(); 
fill(0,224,189,118);
rect(0,0, width, height/2); 

for ( int i = 0; i < numObject; i = i +1)
{
  
       
     float m = map(i, 0, numObject, 0, 255);
    
     rectHeight = random (90,200); 
     rectWidth = random (6); 
    
     posX = random(width);
     posV = random(height/2-rectHeight/2,height/2+rectHeight/2 );
    
     
     rectMode(CENTER); 
     noStroke ();
     fill(m,255,255);
     rect(posX,posV, rectWidth , rectHeight);
      
     fill(255,255,0); 
     rect(posX,posV-rectHeight/2, rectWidth , 5);
     
     strokeWeight( rectWidth); 
     stroke (255,255,255,255) ; 
     line(posX,posV-rectHeight/2, width/2, height/4+40); 
     
  
            
} 

 rectMode(CORNER);
 
 noStroke(); 
fill(255,255,255,0);
rect(0,0, width, height/2); 

noStroke(); 
fill(0,224,189,118);
rect(0,height/2, width, height); 

