
// the x and y position of the circle
int x = 25;
int y = 40;
// the x and y speed of the circle
int xspeed = 5;
int yspeed = 7;
 
void setup() {
  size(400, 400);
  smooth();
}
 
void draw() {
 
  // clear the background
  background(0); 
  
  drawCircle ();
  collision ();
  movecircle ();
 
 
  // draw the ellipse
 
   
   
}

void drawCircle (){
  ellipse(x, y, 50, 50);
  
}

void  collision () {
   x += xspeed;
  y += yspeed;
  
}
void movecircle () {
  // if we're all the way over to the left,
  if (x<25) {
    // reverse the speed
    xspeed = -xspeed;    
    // and move it back so that it's touching the side
    x = 25;
  }
  else if (x>width-25) {
    // and if we're all the way over the left, reverse the speed
    xspeed = -xspeed;
    // and move it so it's touching the side
    x = width-25;
  }
 
  // and now all the same except for y
  if (y<25) {
    yspeed = -yspeed;
    y = 25;
  }
  else if (y>height-25) {  
    yspeed = -yspeed;
    y = height-25;
  }
  
}
                
                                
