
/*
A program to move a creature according to the position
of the mouse. The creature's color changes also with
the mouse movement by Stani
*/
void setup(){
  size(200,200);
}
 
void draw() {
  background(174);
  ellipseMode(CENTER);
   
  //draw head of creature
 
    stroke(0,0,0);
    strokeWeight(3);
    fill(mouseX*5,(mouseX-mouseY)/4,mouseY+50);
    ellipse(mouseX,mouseY,100,60);
 
  //eyes of creature
  stroke(0,0,10);
  strokeWeight(4);
  ellipse(mouseX-29,mouseY+0,15,15);
  ellipse(mouseX+18,mouseY+0,15,15);
   
  //eyeballs
  point(mouseX-29,mouseY+0);
  point(mouseX+18,mouseY+0);
  
   
  //the mouth
  stroke(0);
  strokeWeight(1);
  fill(204,0,0);
  ellipse(mouseX-10,mouseY+15,20,10);
  
  //hair
  strokeWeight(3);
  line(mouseX-20,mouseY-80,mouseX-10,mouseY-30);
  line(mouseX+20,mouseY-80,mouseX-10,mouseY-30);
   
  
}

