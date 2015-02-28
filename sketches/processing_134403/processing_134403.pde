
/*
 *Yueping Wang, Febuary 17, 2014;
 *"Bezier knot"
 *Homework for Flipped Coding, RISD ID, Spring 2014
 *Please move the cursor to alter the knot.
 */

void setup(){
  size(240,240);
  background(255);
  
}

void draw(){
  background(255);
  noFill();
  strokeWeight(7);
  stroke(244, mouseX+10, -mouseY+255);
  bezier(120,160, 180,160, 180,80, 120,80);
  bezier(120,80, 80+mouseX/10,80, 80+mouseX/10,140-mouseX/5, 120,140-mouseX/5);
  bezier(120,140-mouseX/5, 160-mouseX/10,140-mouseX/5, 160-mouseX/10,80, 180-mouseX/5,0); 
  bezier(120,160, 80+mouseX/10,160, 80+mouseX/10,100+mouseX/5, 120,100+mouseX/5);
  bezier(120,100+mouseX/5, 160-mouseX/10,100+mouseX/5, 160-mouseX/10,160, 180-mouseX/5,240); 
}


