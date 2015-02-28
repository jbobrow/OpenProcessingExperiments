
void setup() {
  size(800, 600);
  smooth();
}
//Sets up a new Ellipse, this Ellipse has its size defined on the speed the mouse is moved across the screen. 
//Slow movements create small circles and fast movements make large circles.
//I found how to do this here: http://processing.org/learning/topics/pattern.html

void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}


//The ellipse is drawn at the current mouse point and is filled with random colours if mouse is clicked.
//If mouse is not clicked it will fill white.
void draw () {
 variableEllipse(mouseX, mouseY, pmouseX, pmouseY); 
  if(mousePressed) {
    fill(0+random(0,255),0+random(0,255),0+random(0,255));
  } else {
    fill(255);
  }
//This creates another standard ellipse at the mouse postion that moves around randomly at the mouse location.
//Just adds a bit of variety and interest.
  for(int i=0;i<30;i++);
  ellipse(mouseX+random(30), mouseY+random(30), 10, 10);


}


