
// Nassim Azarzar(azarzar.wordpress.com),



void setup() { 
  size(800, 600); 
  background(255); 
 } 
 
 
void draw() { 
  smooth();
  
 
   if (mousePressed == true) { 
 
// j'ai rajouter un programme qui génère des droites entre 0,200, tout en gardant
// le tracking sur la sourie..
line(mouseX,mouseY,random(0,200),random(0,200) );  
 
    } 
    
 if (mousePressed == true) {
   // génère des couleurs aléatoire entre les valeurs( )
stroke(random(10,255) );
   line(mouseX,mouseY, random(0,10),random(0,10) );
 }   
 
  
 
 
  if (keyPressed == true) { 
     
  saveFrame();  
  background(#FFFFFF); 
 
 
  } 
   
   
     
} 
 
 


