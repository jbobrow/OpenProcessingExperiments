
//draw 20 houses, bouncing against the walls
House[] houses = new House[20]; //array for 20 houses

void setup()
{
   size(300,300); //window-size
   for (int i=0;i<20; i++){ 
     houses[i] = new House();  
}
}
void draw(){
  background(255,255,255);
  for (int i = 0; i<20; i++){
    houses[i].draw_house();
    houses[i].move_house();
  }
}

//set variables
class House {
float xspeed;
float yspeed;
float xpos;
float ypos;
int speed;
float R;
float G;
float B;
int size;

//give values to the variables
House (){  
xspeed= 1; //moving in x direction
yspeed= 1.5; //moving in y direction
xpos= random (width); //start with a random x-position from 0-width
ypos= random (height); //start with a random y-position from 0-height
speed= 1; //speed of the houses
R = random(255); //random value for red from 0-255
G = random(255); //random value for green from 0-255
B = random(255); //random value for blue from 0-255
size= 20; //variable for the size of the geometric forms
}

//drawing the house
void draw_house(){
 fill(R,G,B); //random color
 rect(xpos,ypos,size, size); //house base
 fill(247,221,72); //yellow
 triangle(xpos, ypos, xpos+size, ypos,xpos+size/2, ypos-size); //roof
 fill(11,175,17); //green
 rect(xpos+7.5, ypos+13, size/4, size/3); //door
  }
  void move_house(){ //moving from left to right
    xpos = xpos + xspeed;
    if (xpos>=width-20) xspeed = xspeed*(-1); //when reaching the right side of the window, move left
    else if (xpos<=0) xspeed = xspeed*(-1); //when reaching the left side of the window, move right
    
    ypos = ypos + yspeed; //moving up and down
    if (ypos>=height-20) yspeed = yspeed*(-1); //when reaching the bottom of the window, move up
    else if (ypos<=20) yspeed = yspeed*(-1); //when reaching the top of the window, move down
  }
}
    
  


