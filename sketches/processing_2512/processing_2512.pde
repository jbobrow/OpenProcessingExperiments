
/*

argyle
june 2009
jenna@jennaledger.com

*/

void setup() {                                         
  
  size (700,300);                                      
  background(200,160,160);                                      
  smooth(); 
  
};

void draw() {
  drawArgyle(mouseX,mouseY,random(0,100));
 
};

void drawArgyle(int x,int y,float s) {
  noStroke();
  fill(#333333);
  rect(x,y,s,s);
  fill(#cc30f0);
  rect(x,y,s*.6,s*.6);
  fill(#ffcccc);
  rect(x,y,s*.2,s*.2);
  
  
};

