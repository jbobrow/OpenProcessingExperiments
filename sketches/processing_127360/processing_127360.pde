
void setup() {
  size(400,300); 
  smooth();
}
 
void draw() {

ellipseMode(CENTER);
  rectMode(CENTER);
  
 
 // FACCIA
  stroke(0);
  fill(255);
  
  ellipse(mouseX,mouseY-30,60);
  ellipse (155,50,50,48);
 
point (150,60);
point (160,60);
    fill (210,31,27) ;
rectMode (CENTER);
   
rect (150,135,50,100);
 
line (125,85,100,160);
line (175,85,200,160);
line (140,185,130,250);
line (130,250,125,250);
line (160,185,170,250);
line (170,250,175,250);
  

   // Nothing happens in draw() in this example!
}

// Whenever a user clicks the mouse the code written inside mousePressed() is executed.
void mousePressed() {
  stroke(0);
  fill(175, 200, 30);
  rectMode(CENTER);
  rect(mouseX,mouseY,40,50);
}


void keyPressed() {
  background(255, 120,30);
}
