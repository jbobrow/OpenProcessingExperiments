
void setup(){
  size(600,500);  //sets up size
  background(0);  //sets up color
  frameRate(60);  //decides how fast the ball is moving
}
 
int dx = 2;     //sets up rate of change of x
int dy = 3;     //ssts up the rate of change of y
 
int x = 50;     //sets the value of x
int y = 50;     //sets value of y
 
void draw(){
    fill(255);   // color of the rectangle
    ellipse(x,y, 20, 20); // draws a rectangle
 
    x = x + dx;
    y = y + dy;
 
    if ( x< 0 || x > 475){     //setup for a loop and bounce
       dx = -1 * dx;
    }
 
    if ( y < 0 || y > 475){    //setup for aa loop and bounce
       dy = -1 * dy;  
    }
 
 if(mousePressed) {
   x = mouseX;
   y = mouseY;
 }
}
