
//Week 4 - An Interactive Sketch (Processing Assignment 3 - A3)
// DIGITAL PAINTING
//The goal of my project was to create a virtual paintbrush and canvas using Processing. I wanted the user to be able to choose colors via keys and manipulate their mouse or touchpad to paint anything they wish.(also works well with Wacum pen/pad) I used an array to hold the brush colors and corresponding number keys to choose each value. The brush size is determined by the variable 'd' which controls the diameter of the ellipse which functions as the brush shape. Using variables, an array and switch statements make it easy to add more colors and adjust brush size if you wish. If you want to start over hit BACKSPACE or DELETE. When you have finished your masterpiece hit 'S' to save a screenshot.


//Global Variables
color brushColor; 
// white, red, magentas, blue, cyan, green, yellow, black, brown
color[] palette = { #ffffff, #ff0000, #FF00FF, #0000FF, #00ffff, #00FF00, #FFFF00, #000000, #8B4513 };
int d = 15;// sets brush size

//////////////////setup
void setup() {
  size(800, 600);
  background(#eeeeee);
  noFill();
}/////////////////end set up


//////////////////draw
////////////////////////// FIRST CHOOSE KEY FOR BRUSHCOLOR!!!!!!
void draw() {
  switch(key) {
    case '0':
      brushColor = color(palette[0]);//white
      break;
    case '1':
      brushColor = color(palette[1]);//red
      break;
    case '2':  
      brushColor = color(palette[2]);//magenta
      break;
    case '3':  
      brushColor = color(palette[3]);//blue
      break;     
    case '4':  
      brushColor = color(palette[4]);//cyan
      break;        
    case '5':  
      brushColor = color(palette[5]);//green
      break;        
    case '6':  
      brushColor = color(palette[6]);//yellow
      break;      
    case '7':  
      brushColor = color(palette[7]);//black
      break;        
    case '8':  
      brushColor = color(palette[8]);//brown
      break;             
  }// end switch
  
if(mousePressed){
  
         fill(brushColor);
         noStroke();
       ellipse(mouseX, mouseY, d, d);//adjust brush size by variable 'd' above       

}//end if mouse pressed 
}//////////////////end draw


void keyReleased() {
  
  ///// Want to START OVER? hit BACKSPACE or DELETE
  if (key == DELETE || key == BACKSPACE) background(#eeeeee);// ERASE DRAWING
  
  ////// FINISHED your masterpiece? hit 'S' key
  if (key == 's' || key == 'S') saveFrame("screenshot.png");//SAVE DRAWING
}

////// HOPE YOU HAD FUN!





