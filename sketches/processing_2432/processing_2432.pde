
/*what flavour is that anyway?

june 2009
cittavritti@shaw.ca
*/


void setup(){
  background(0);
  size(600,600);
  smooth();
   
};



void draw(){
  noStroke();
  background(0);
  
  fill(255, 255, 255);
  rect(mouseX, mouseY, 6, 200);
  
  fill(200, mouseX, mouseY);
  ellipse(mouseX, mouseY, 100, 100);
  
};

