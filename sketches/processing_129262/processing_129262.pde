
/*
    White Ball Example
    Author: Justin Telmo
    Last Modified On: 1/21/2014
    
*/

// Set up just the size
void setup() { 
    size(500,500);
} 

// Variables
int diameter = 0; 
int x = 0;
int y = 0;
int speed = 5; // Modify to increase or decrease speed!


void draw() { 
    background(255, 0, 0);
     ellipse(mouseX, y, 10, 10);  //mouseX controls the x position!
     x = x + speed;
     y = y + speed;
     if ( y > height || y < 0) {
        speed = speed * -1; // Change direction
     }
 }
