
/* 
 *      file Multimotion.pde
 *
 * Yevgeniy "Eugene" Berenshteyn and Maxime Berenshteyn. 2012. pluroSquare
 *
 * OBJECTIVE: An experimental study in simple motion.  
 * 
 * INTENTION: to implement, test, and refine animation-like effects while refraining from using
 * pre-saved images. 
 * 
 * CLASSES/IMPLEMENTATION/DIFFERENCES: class MySquare calls the library
 * function "copy(...)" from its method "display(...)". The object 
 * of that class drifts on the right side of the display window. 
 * class SquareOne (a derived class of the base class MySquare) recalculates the 
 * positions and redraws the previously rendered primitive elements 
 * on each iterations of the function "draw(...)". The parameters of the 
 * continuously adding elements are saved in the ArrayList drawnSegments. The object 
 * of this class travels up and down of the left side of the display window. 
 * 
 * LIMITATIONS: the value of "increments" calculated in method "displayInit(...)"
 * of class MySquare as "int(halfside/iCounter)"; as it appeared, the visual presentation is
 * very sensitive to that ratio. The values of halfside and iCounter are provided as arguments
 * of the constructors for objects of classes MySquare and SquareOne. The values
 * used in the function "setup()" for these objects were found after prolonged tweaking
 * and testing. Subsequent tweaking should take into account possible harm to displayed images.
 * 
 * LESSONS LEARNED:
 * (1) usage of references to "super" methods and variables
 * (see constructor and method "displayInit(...)" of class SqaureOne):
 * calls and assignments utilizing "super" methods and variables
 * should precede any other operations in the routines referencing these methods
 * and variables;
 * (2) a call to the library function "noLoop()" stops Processing from
 * executing the code within "draw(...)" no matter where that function "noLoop()" is 
 * called from. Several objects may be active or in motion, but, should 
 * one of them had called "noLoop()", everything stops. 
 * (3) usage of the opacity value (fourth argument) in the library function
 * fill(...). When the inner regions of the displayed squares must be 
 * "cleared" to their original states, opacity must be set to its
 * maximal value of 255, otherwise the previously rendered
 * drawings (light blue segments) would remain visible. (See the difference between calls to 
 * "fill (...)" from the function "setup ()" and from the functions "display(...)"
 * of classes MySquare and SquareOne.) 
 */

// declaration of the objects of class MySquare
// the class is implemented in  file MySquare.pde
MySquare myFirstSquare;     
MySquare mySecondSquare;

// declaration of the object of class SquareOne
// the class is implemented in file SquareOne.pde
SquareOne myThirdSquare;
                        
////////   function setup(): initialization of objects, etc.
void setup(){
  
  frameRate(20);                                                 // also tested with rates: 15; 25
  size(600,600);
  background(41,83,166);
  stroke(0,255,255,255);
  fill(0,0,41,100);
  rectMode(RADIUS);
  
  smooth();
  
  myFirstSquare = new MySquare();                               // initialization of object of class MySquare 
  mySecondSquare = new MySquare(540,60,106,13);                 // initialization of object of class MySquare
 
  myThirdSquare = new SquareOne(60,540,74,9,"third");           // initialization of object of class SquareOne
  
  myFirstSquare.displayInit();
  mySecondSquare.displayInit();
  
  myThirdSquare.displayInit();
   
}  // end of setup()


////////// function draw():  actual rendering  of changing images
void draw(){
  
  myFirstSquare.display();
  mySecondSquare.display();
  
  myThirdSquare.display(0,-5);
  
  
} // end of draw()


