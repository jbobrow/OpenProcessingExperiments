
void setup(){      // function that runs once  
  size(500,500);   // sets size of window
    background(255); 
  frameRate(60);   // sets framerate
}
 
int dx = 2;        // creates variables
int dy = 3;        //  "        "  

int x = 50;        //  "        "
int y = 50;
    
void draw(){       // a function that runs in a loop
     
    fill(170,0,170);     // sets color of the rectangle
    ellipse(x,y,25,25);      // creates a rectangle with coordinates
 
    x = x + dx;    // every time draw loops, add dx to x
    y = y + dy;    //  "     "      "    " , add dy to y
 
    if ( x< 0 || x > 475){   // sets boundaries 
       dx = -1 * dx;         // reverses the direction if the code line above is true
    }
 
    if ( y < 0 || y > 475){  // does the same thing but for y
       dy = -1 * dy;  
    }
    if (mousePressed) {
       x = mouseX;      //when mouse is pressed, ball resets to mouse position
       y = mouseY;
    }
 
 
}
