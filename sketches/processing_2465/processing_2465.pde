
/*
Based on "Making Bullseyes: Functions" 
June 2009
balanceandunity@hotmail.com
*/

void setup() {
  
  size(500,500);
  background(0,255,0);
  smooth();
 
 drawThing(100, 200, 100);//Coordinates and size. x & y start at 0,0 in the top left-hand corner.
 drawThing(200, 300, 100);
 drawThing(300, 300, 160);
 
};

void draw() {
 drawThing(mouseX, mouseY, 50); 
};

void drawThing (int x, int y, int s){
  
  /*box*/
  fill(232, 207, 105); 
  rect(x,y,s,s);
  
  fill(13,81,11);
  ellipse(x,y,s*0.25,s*0.6);//To keep the size at 60% of "s".
  
  fill(237,32,106); 
  ellipse(x,y,s*0.2,s*0.2);   

};

