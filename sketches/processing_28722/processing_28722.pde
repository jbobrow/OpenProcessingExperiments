
/*Taylor Milner
Project 1 Revison
This is a revision of my first drawing machine. 
The idea is that by pressing the space bar, you can change 
from a symmetrical to a assymetrical compostion using gestault
principles.  The black rectangle represents a figure and the yellow
trace represents a field.  The black frame works to create
relationships between the figure and field.  By pressing 'o' and 'f'
you can see how the composition changes by adding an additional
frame and figure. 

*/
 
int drawingMode = 0;
 
//some variables to model properties of our drawings:
float symmetryProperty1;
float symmetryProperty2;
float figureProperty1, figureProperty2;
float AdditionalFieldProperty1, AdditionalFieldProperty2;
float AdditionalFigureProperty1, AdditionalFigureProperty2;
float asymmetryProperty1, asymmetryProperty2, asymmetryProperty3;
 
 
void setup() {
  size(400, 400);
  smooth();
  rectMode(CENTER);
  fill(255);
  noStroke();
  changeSymmetricComposition();
  changeAsymmetricComposition();
  changeFigureComposition();
  changeAdditionalFieldComposition();
  changeAdditionalFigureComposition();
}
 
 
 
void draw() {
 
  background(255);
 
  //based on the drawing mode, call the appropriate function (as defined below)
  if (drawingMode == 0) {
    drawSymmetricComposition();
    drawFigureComposition();
  } else if (drawingMode == 1) {
    drawAsymmetricComposition();
    drawFigureComposition();
  
  }
 
}
 
/*
keyReleased() is a special kind of function, known as an event handler
 
Here, the event is the releasing of a key on the keyboard,
and this function is automatically called when that happens,
once for each key (right after draw() finishes this frame).
 
This is how we add interactivity to programs. We'll change values of variables here based on what
key was pressed, and then those variables will affect what happens the next time draw() runs.
*/
void keyReleased() {
  //look for the space bar
  if (key == ' ') {
    if (drawingMode == 0) {
      drawingMode = 1;
      //change the properties of our drawing, but *only* when we switch modes (not every frame!)
      changeSymmetricComposition();
      changeFigureComposition();
   
    } else if (drawingMode == 1) {
      drawingMode = 0;
      //change the properties of our drawing, but *only* when we switch modes (not every frame!)
      changeAsymmetricComposition();
      changeFigureComposition();
     
    }
  }
}
 
 
void drawSymmetricComposition() {
  //draw two mirrored rectangles
  fill(0);
  rect(symmetryProperty1, symmetryProperty2 , 20, 400);
  noStroke();
  fill(240,229,7,70); 
  rect(width - symmetryProperty1, symmetryProperty2 , 100, 400);
}
 
void drawAsymmetricComposition() {
  //draw two almost mirrored rectangles, but vary them
  fill(0);
  rect(asymmetryProperty1, asymmetryProperty3, asymmetryProperty1 / 2, asymmetryProperty1 / 3);
 noStroke();
 fill(240,229,7,70);
  rect(width - asymmetryProperty1 * .8, asymmetryProperty2 * 3/5, asymmetryProperty1, asymmetryProperty2 );
   
}

void drawFigureComposition(){
  //draw two almost mirrored rectangles, but vary them
  noFill();
stroke(0);
rect(figureProperty1, figureProperty2, figureProperty2, figureProperty1);

}
void keyPressed(){
  if (key == 'f'){
    drawAdditionalFieldComposition();
  }
  if(key == 'o'){
    drawAdditionalFigureComposition();
  }
}

void drawAdditionalFieldComposition(){
  noStroke();
  fill(240,229,7,80);
  rect(  AdditionalFieldProperty1, AdditionalFieldProperty2, 100,250);
}

void drawAdditionalFigureComposition(){
  noStroke();
  fill(240,229,7,80);
  rect(  AdditionalFigureProperty1, AdditionalFigureProperty2, 50,150);
}
 
//randomize some values:
void changeSymmetricComposition() {
 symmetryProperty1 = random(50, 350);
 symmetryProperty2 = random(200, 30);
}
 
void changeAsymmetricComposition() {
 asymmetryProperty1 = random(0 , width);
 asymmetryProperty2 = random(25, height); 
 asymmetryProperty3 = random(25 , height ); 
}
void changeFigureComposition() {
figureProperty1 = random(50 , width);
 figureProperty2 = random(50, height); 
}

void changeAdditionalFieldComposition() {
  AdditionalFieldProperty1 = random(0, width/2);
  AdditionalFieldProperty2 = random(0, height);
}
  
  void changeAdditionalFigureComposition() {
    AdditionalFigureProperty1 = random(0,width);
    AdditionalFigureProperty2 = random(0,height);
    
}


