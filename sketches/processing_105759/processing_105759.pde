
void setup(){
  size(600,500);  //size of the canvas  
  background(0);  //color of the background
  frameRate(60);  //how fast screen loops
}
 
int dx = 2;  //variable that helps determine speed
int dy = 3;  //variable that helps determine speed
 
int x = 50;  //starting position on x axis
int y = 50;  //starting position on y axis
 
void draw(){
    fill(255);  //makes the object white
    ellipse(x,y,25,25);  //the demensions of the circle
    
    if (mousePressed) {
     x = mouseX;
     y = mouseY;
    } 
 
    x = x + dx;  //speed the ball will move at on x axis
    y = y + dy;  //speed the ball will move at on y axis
 
    if ( x< 0 || x > 475){  //condition for the ball giving barriers on the x axis
       dx = -1 * dx;  //flips the ball's motion when the statement above is false
    }
 
    if ( y < 0 || y > 475){  //condition for the ball giving barriers on the y axis
       dy = -1 * dy; //flips the ball's motion when the statement above is false 
    }
 
}
