
float x, y; //position
float dx, dy; //change in position

void setup(){
  smooth();
  noStroke();
  size(250,250);

  
  //set var to change position
  dx=5;
  dy=5;
}

//to set up sequence of dotted lines
void draw(){
  x=x+dx;
  y=y+dy;

//if the line reaches either end it will start again from the opposite end
  if(x>width)x=0; 
  else if (x<0) x=width;
   if(y>height)y=0;
  else if (y<0) y=height;

fill(x,y,200,200);
ellipse(x,y,2,2);


//when the mouse is being held down, white circles appear, and cluster up
//otherwise, a click changes the direction of the dotted lines
if (mousePressed == true){ //checks to see if condition is true
dx = random(-10,10);
dy = random(-10,10);
frameRate(10); //slows down the white circles
fill(#ffffff,100); //changes colour and opacity
ellipse(x,y,20,20); //changes size of circles

}else{
  frameRate(25); //when the mouse isn't clicked, it'll move faster
}}

