
/*

disco lights
june, 2009
jenna@jennaledger.com

*/

void setup() {                                          
  size (700,300);                                      
  background(0);                                      
  smooth(); 
  
};

void draw() {
  drawDisco(mouseX,mouseY,random(0,50));
 
};

void drawDisco(int x,int y,float s) {
  noStroke();
  fill(#00ffff);
  ellipse(x,y,s,s);
  fill(#ff00f0);
  ellipse(x,y,s*.6,s*.6);
  fill(255);
  ellipse(x,y,s*.2,s*.2);
  
  
};

