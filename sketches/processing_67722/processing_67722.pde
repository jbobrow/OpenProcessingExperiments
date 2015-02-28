
void setup() {

// size of the window
size(1500,800);
smooth();
frameRate(50) ;
}
void draw() {
  //black background
  background(0);
  //ellipses to CENTER and CORNER mode
  ellipseMode(CENTER);
  ellipseMode(CORNER);
  
  
  //Fat POO's body
  stroke(0);
  fill(200);
  ellipse(mouseX,mouseY,500,500);

  //Fat POO's head
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY -30,200,200);
  
  //Fat POO's eyes
  fill(mouseX,0,mouseY);
  ellipse(mouseX-50,mouseY-30,80,80);
  ellipse(mouseX+100,mouseY-30,80,80);
  
  //Fat POO's pull by a string
  stroke(255);
  line(mouseX,mouseY -30,120,120);
  
}




