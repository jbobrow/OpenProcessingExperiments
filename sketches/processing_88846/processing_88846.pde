
int Ox= 310;  //object starting x position
int Oy= 300;  //object starting y position
float hit;  //get() value that determines a collision 
PImage maze;  //maze background

void setup()
{
  size(600,600);  //has to be the same size as the maze image
  smooth();
  maze= loadImage("Simple_maze.png");  //generated from http://www.mazegenerator.net/
  
}

void draw()
{
  background(maze);  //set background to maze image
  
  color c= get(Ox,Oy);  //color c is equal to the get value of the Obecjts X,Y
  hit= red(c);  //hit is equal to the red value of color c
  avatar(Ox,Oy);  //avatar function is the graphic of the avatar
  
  if (keyPressed)  //if a key is pressed
  {
    if(key==CODED)  //and if it is coded
    {
      if(keyCode==UP)  //if the coded key is the UP key
      {
      Oy--;  //decrease the objects y value
      }
      else if(keyCode==DOWN)  //if the coded key is the DOWN key
      {
      Oy++;  //increase the y value
      }
      else if(keyCode==LEFT)  //if the coded key is the LEFT key
      {
       Ox--;  //decrease the x value
      }
      else if(keyCode==RIGHT)  //if the coded key is the RIGHT key
      {
      Ox++;  //increase the x value
      }
    }
  }
  if(hit==0.00)  //if hit is 0,00 (black)
  {
    exit();  //then ext
  }
}

