
int x;  // is the x position of the ball
        // x is a variable
int y;     // dx and dy are velocity

int dx=1;
int dy=0;   
           
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
}
 
void draw() {  //draw function loops
 fill(0,0,0);
 ellipse(x,50,50,50); //put x as the x position

  x=x+dx;             // changes the position of x for the ball
  
  if (x<500)
  {
  dx=1;
  }
  if(x>0)
  {
  dx=1;
}

