
int x; // declare variables for the x and y coordinates of our monster here
int y;

void setup(){
  smooth(); // initial conditions
}

void draw(){
  x = mouseX; // assign our variables the values of the mouse coordinates for each run of draw
  y = mouseY;
  
  background(255);// define and draw our monster
  fill(135,255,0); //head
ellipse(x,y,50,40);
ellipse(x-10,y-10,10,10);//left eye
ellipse(x+10,y-10,10,10);//right eye
point(x,y);//nose
rectMode(CENTER);//use center to draw rectangle
//makes it easier to draw
rect(x,y+10,20,10);//mouth
//x+=2;
}

