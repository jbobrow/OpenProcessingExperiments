
void setup(){
  size(700,700);
  smooth();
  background(0, 0, 0);
}
 
void draw(){
  
noFill();
strokeWeight(2);

  if (mousePressed == true) {
    stroke(0,0,0,50);
  } else {
   stroke(255,255,255,20);
  }

dist (mouseX, mouseY, pmouseX, pmouseY);
float varianz= dist(mouseX, mouseY, pmouseX, pmouseY)*2.7;

bezier(mouseX,mouseY,-mouseY,-mouseX,0,0,mouseX,mouseY);
ellipse(mouseX,mouseY,varianz,varianz);

 // bezier(x1, y1, cpx1, cpy1, cpx2, cpy2, x2, y2);
 
 
}


