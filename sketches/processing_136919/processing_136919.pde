
//Final Project by Luis Roy
//Introduction to Computational Arts Course- Coursera 

//Name of the project: 'Coloring snake'
// Date of the project: 01/03/2014
// This project is an interactive visual compositon that
//receives input from the user throught the mouse and keyboard
/*I wanted a ellipse to be drawn everytime the user moved her mouse on the x,y directions. 
I also wanted the ellipse to change colour randomly and the background each time the user click the mouse. 
instructions: move mouse on canvas: draw your snake. click mouse to erase snake and change background color. 
Use backspace or delete keys to erase the snake and bring canvas to the original background color.
Use keys 1, 2 and 3 to change the stroke colour of the ellipses while drawing the snake. 
Use key 's' to grab the best snapshoot of your drawing. 
*/

//Global variables
color strokeColor = color (2,6);
//used kuler adobe for monochromatic palette of colours 
color [] palette=  {#7FBB00,#C6FF4C, #ADFF00,#637F26,#8BCC00 };

//void setup

void setup(){
  size(1280,720);
  background (palette [1]);
  ellipseMode (RADIUS);
  
}


//draw()
//drawing the snake

void draw(){
 fill(random (width), random(height), random (100));
 strokeWeight (random (2,8));
 stroke (strokeColor);
 ellipse(mouseX, mouseY, 50, 50);


   
}

//change background colour with mouseReleased ()

void mouseReleased(){
  //the mouseReleased() function is called
  //every time a mouse button is relased. 
  background (random(width),random(height),random(100)); //random(100) means from 0 to 100
}

//keyPressed()
//bring canvas to original color 
//start the snake drawing from the begining 
//use key 's' to screeshoot the drawing anytime 
//switch between 3 different stroke colors for your snake drawing 


void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background (palette [1]);
  if (key == 's' || key == 'S') saveFrame ("screenshot.png");
  
  switch(key){
   case '1':
   strokeColor = color (2,10);
   break;
   
    case '2':
   strokeColor = color (192, 100, 64, 10);
   break;
   
    case '3':
   strokeColor = color (52,100,71,10);
   break;
   
    }
  
}



