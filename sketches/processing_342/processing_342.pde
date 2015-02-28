
 // streamlined code by TomC based on this example: www.flight404.com/p5/radial_0
 
/* Just something I stumbled upon when working on a flower program.  It might vary on resolution, but on my screen it rotates and makes
some great patterns
*/

void setup() {  
size(400,300);  
frameRate(30);

} 


float px=0, py=0;
float angle =15;
float radius =222;
float points=88;
 
 
void draw() {  
background(0);    
translate(width/2,height/2);  

 
for (int i = 0; i < points; i++) {  
  
    px =cos(radians(angle))*radius;
    py =sin(radians(angle))*radius;
    angle+=360/points;
    noFill();
    beginShape();
    stroke(0);  
    vertex(0,0);  
    stroke(255);  
    vertex(px,py);  
    endShape();  

 }   
} 

