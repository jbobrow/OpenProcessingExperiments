
// The aim of the is video game is to get the two balls across the screen and back
// without them touching the moving rectangles
// To move the balls across the screen you must press a key 
// once they reach the otherside and you realise the key the balls will change direction 
// you can then change their direction by pressing a key or change the speed by clicking the mouse 

int x = 0; // The location of the rectanggles
int y = 0; // the location of the ciracles
int speed = 10; // The speed of the rectangles
int speed1 = 2; // The speed of the circles
int state = 0; // The variable that keeps track of the circle going across the screen

void setup() { 
  size(600,600); 
  smooth();
} 
 void draw() { 
   background(50); // The background is set to grey
   bounce(); // The function that makes the rectangles bounce back and forth
   move(); // The function that makes the rectangles and circles move
   display(); // The function that displays all of the shapes 
   mouse(); 
 } 
 
 void move () { 
   x = x + speed; // This is the speed of the rectangles
   y = y + speed1; // the speed of the circles
 } 
 
 void bounce() { 
   if ((x>width) || (x<0)) { // When the rectangle reaches the edge of the screen 
     speed = speed * -1; }   // Multiplying the speed by -1 will make the rectangle bounce back
   if ((y>width) || (y<0)) {
     speed1 = speed1 * -2; } 
   if (!keyPressed) { // Pressing any key will change the direction of the balls
     speed1 = speed1 * -1;  
   } 
 } 
  
 void display() {   // This function is what displays the circles, lines going up and down the screen and the rectangles
   rect(40,x,40,40); 
   rect(520,x,40,40);
   rect(280,x,40,40);
   rect(40,100,x,40); 
   rect(40,280,x,40); 
   rect(40,500,x,40); 
   line(0,300,600,300); 
   line(300,600,300,0); 
   ellipse(y,200,20,20); 
   ellipse(y,400,20,20);
 }  
  
  void mouse() {  
    if (!mousePressed) { // If the mouse has not been pressed then speed of the balls will be one
      speed1 = 2; 
    } else { // If it has been pressed it will change to five
      speed1 = 5;
     
    } 
  
  if (state == 0) { // This functions keeps track of the balls moving across the screen and back again
    y = y + speed1; 
    if (y > width-10) { 
      y = width-10; 
      state = 1; 
    } 
  } 
  }




