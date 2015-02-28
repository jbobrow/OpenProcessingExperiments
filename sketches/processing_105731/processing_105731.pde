
// Credit: Ren Ervin Bettendorf 
//Connor Novak
//Bouncing Ball
//2013/8/5
 
/* Screensavers For Days */

  //Runs once; Sets up the screen size, fill color of ball, and rate of frame refresh.
void setup(){
  size(500,500); 
  fill(0,255,0); 
  frameRate(60);
}
 
  //Creates two integers, one for speed in y-direction, one for speed in x-direction
int dx = 2;
int dy = 3;
 
 // creates two integers, one for x position of ball, one for y-position of ball
int x = 50;
int y = 50;
 
 //Runs infinitely many times; refreshes background, draws ellipse with x/y coords of ints x/y.
void draw(){
    background(0);
    ellipse(x,y,25,25);
 
     // moves ellipse by dx and dy.
    x = x + dx;
    y = y + dy;
 
 
     //If ball hits left or fight side, negate dx to reverse it's horizontal direction
    if ( x< 25 || x > 475){
       dx = -1 * dx;
    }
    
    //If ball hits top or bottom, negate dy to reverse it's vertical direction
    if ( y < 25 || y > 475){
       dy = -1 * dy;  
    }
    
    //If mouse is pressed, set x and y to the mouse's x and y.
    if (mousePressed) {
     x = mouseX;
    y = mouseY; 
    }
 
}
