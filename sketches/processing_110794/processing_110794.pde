
int size = 60;  
float xpos, ypos;//Uhhh position..starting position 

//Speed
float xspeed = 2.8;
float yspeed = 2.2; 

//Direction
int xdirection = 1;// X is left
int ydirection = 1;// Y is right?

void setup() { 
size(600, 500); 
frameRate(60); 
smooth(); 
xpos = width/2; 
ypos = height/2; 
}

void draw() { background(12, 23, 5); 

xpos = xpos + ( xspeed * xdirection );// Almost gave up life trying to understand.
ypos = ypos + ( yspeed * ydirection ); 

if (xpos > width-size || xpos < 0) 
{ xdirection *= -1; } // Trial and error of hell
if (ypos > height-size || ypos < 0) 
{ ydirection *= -1; } //Negative keeps it within boundaries. Greater than 0 will make it move

fill(122, 134, 5); 
ellipse(xpos+size/2, ypos+size/2, 50, 50);
}


