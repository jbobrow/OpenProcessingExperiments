
void setup(){
  size(600,500);  //the size of the board on which the bounching ball prgram takes place.
  background(0);  //the background is black
  frameRate(60);   //it moves 60 frames per second. Pretty fast
 
}
 
 
int dx = 2; //makes the box change direction in a specific angle.
int dy = 3; //makes the box change direction in a specific angle.
 
int x = mouseX;  //makes the box appear.
int y = mouseY;   //makes the box appear.
void draw(){


    fill(255); //the color of the box (white).
    ellipse(x,y,25,25,5); //makes the box a square and sets its size.
   
    x = x + dx; //it shows the x location of the box and moves it by 3 to each frame, causing the box to move.
    y = y + dy; // Same as above^ but shows the Y
     
    if ( x< 0 || x > 475){  // this is the collision detection. Whenever the box hits the of the board it bounces off.
       dx = -1 * dx; //this directs the collision to -1 also making the ball bounce.
    }
     
    if ( y < 0 || y > 475){ //causes the ball to detect the edge of the board in the y direction.It causes it to bounce.
       dy = -1 * dy;  //directs the collision.
    }
    if (mousePressed == true){
        background(0);
        x = mouseX;
        y = mouseY;
        dy = 2;
        dy = 3; 
        }
}
 

