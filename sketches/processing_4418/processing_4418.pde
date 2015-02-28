
// Used for assignment ARCH1391 David Butterworth 'Metaphor' 
// All code thanks to dotlassie 'shortest tree generator' unless stated otherwise
 
void setup() {  
  size(800, 800); // Edited by David Butterworth
  background (0); 
}  
 
float i; 
void draw(){if(i<1)translate(400,400); 
strokeWeight(4/i); // Edited by David Butterworth
line(0,0,0,-70); 
stroke (10, 170, 255); // Edited by David Butterworth
 
 
if(i>5)return; 
 
pushMatrix(); 
translate(0,-70); 
scale(random(1.5)); // Edited by David Butterworth
rotate(3/++i); // Edited by David Butterworth
 
draw();rotate(-10/i); // Edited by David Butterworth
 
draw();i--;popMatrix();}  
 


