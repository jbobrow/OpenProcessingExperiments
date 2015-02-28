
void setup() {
  size(800, 600);
  smooth();
}
//Sets up a new Ellipse, this Ellipse has its size defined on the speed the mouse is moved across the screen. 
//Slow movements create small circles and fast movements make large circles.
//I found how to do this here: http://processing.org/learning/topics/pattern.html
//We added a rectangle to this to make it more funky.

void variableEllipse(int x, int y, int px, int py) 

{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
  rect(x, y, speed, speed);
  
  
}

//The ellipse and rectangle are drawn at the current mouse point and is filled with random colours if mouse is clicked.
//If mouse is released it will fill with what ever random colour was last.
void draw () {
 variableEllipse(mouseX, mouseY, pmouseX, pmouseY); 

  if(mousePressed) {
    rect(mouseX, mouseY, 20, 20); 
    fill(0+random(0,255),0+random(0,255),0+random(0,255));
  } else {

  }




}


