
/* 
square texture/pattern maker

cittavritti@shaw.ca
june 2009

*/


void setup(){
  size (900, 600);
  background (#add8e6);
  frameRate (5);
  
};


void draw (){
 
  
  noStroke();
  fill (random (80,170), 170, 100, 120);
  rect (random (10, 820), random (10, 520), random (70,100), random (70,100));
  
  
  
};

void keyPressed(){
  save( "pattern" + key + ".png");
  
};

