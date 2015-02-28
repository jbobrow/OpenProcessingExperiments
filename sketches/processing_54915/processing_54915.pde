

// By Ann Lu  
// learned from this tutorial:
// http://www.learningprocessing.com/exercises/chapter-3/exercise-3-7/

 
void setup(){ //basic setup
  size (600,600); //sets up the size of the window
  smooth();  //indicates that the lines will be smooth

}
 
void draw(){ //this will keep redrawing itself
 

stroke(mouseY,mouseX,mouseX,mouseY); // sets the colours used to draw the line around the circle
strokeWeight(abs(mouseY-mouseX)); // the thickness of the stroke is determined by the speed the mouse moves. When the position of the mouse is inside abs (), it becomes a positive number.
ellipse(mouseY,mouseX,40,40); //the width and length of the circle is 40; while mouseY and mouseX will set the position
strokeWeight(abs(mouseX-mouseY));
ellipse(mouseX,mouseY,40,40); //the width and length of the circle is 40; while mouseY and mouseX will set the position


}


