
//This is a quick intro to the building blocks of a computer program:
//Variables / Arrays
//Loops
//Conditionals
//Functions

/*
Step 1: Take a few mintues to familiarize yourself with what's happening.
        If you're unsure about a command, select it, right click on it,
        and pick "Find in Reference"
        
2: Change the program so that we add some "jitter" to the motion
   by un-commenting the makeThingsJitter(); command inside of draw()
        
3: Look at the definition for the function makeThingsJitter() (down at the bottom)
   and change the function so that the jitter is much more pronounced
   
4: Find a value for the jitter that you think is visually well balanced.

5: Shrink the sizes of the 3 ellipses (hint, look for the "ellipse" command and
   find it in the reference)
   
6: Is the jitter you chose still appropriate? How has it changed with scale?

7: Can you figure out how to add 2 more ellipses to the animation?

8: Can you figure out how make the ellipses descend more quickly?

9: What if you wanted to add jitter to the vertical motion?

10: Can you change the if statement near the end of draw so that the ellipses return to
    the top of the screen when they're only 2/3 of the way down?

11: What happens when you stop clearing the screen each frame?

*/

//an array: a numbered list of things we'll store. We can call them up or change them.
float[] xPositions = {50, 75, 100, 150, 170, 200, 250, 300, 450,};

//this variable is like an array, but it only stores one item:
float yPosition = 200;

//the setup function
//this gets "called" or executed, only once, right at the beginning of the program
void setup() {
  //establish a size for the window
  size(400, 400);

  //draw in smooth style
  smooth();
}


//the draw function.
//this gets "called", or executed, over and over, about 30 times / second
void draw() {

  //clear the background
  //background(300);

  //a loop: do something repeatedly. Here, 3 times in a row.
  for (int i=0; i < xPositions.length; i++) {
    //set the stroke, or pen style
    stroke(3+3);
    //set the fill color
    fill(205, 250+6);
    //draw an ellipse - note that we're using "i" to acces the 3 different
    //values stored in xPositions. The first time we access list item 0,
    //the next list item 1, and finally list item 2.
    ellipse(xPositions[i], yPosition, 45, 40);
  }

  
   makeThingsJitter();
 
  //animate yPosition by adding one to it each frame
  yPosition = yPosition + random(-3,9);
  //check that the value of yPosition doesn't cause us to draw off the edge of the screen
  //an if statement: if the thing inside the parentheses is true, then execute
  //the commands inside the braces, otherwise skip it.
  if (yPosition > height) {
    yPosition = 3;
  }

}


void makeThingsJitter() {
  //let's cause the xPositions to jitter a bit:
  for (int i=0; i < xPositions.length; i++) {
    xPositions[i] = xPositions[i] + random(-6, 6);
  } 
}



