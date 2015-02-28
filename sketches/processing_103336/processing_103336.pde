
//Jason Xu
//6/9/13
//Bouncing Ball: Don't click on edges
// Credit: Ren Ervin Bettendorf 

void setup() {    //setting up the function
  size(600,500);  //size of the window
  background(0);  //color of the background
  frameRate(100);  //speed of updating the picture, 100 frames a second
}

int dx = 2;  //difference in x of ball every time
int dy = 3;  //difference in y of ball every time

int x = 50;  //starting x coordinate
int y = 50;  //starting y coordinate

void draw() {              // to draw the whole picture
    fill(255);            //color of ball = white
    ellipse(x,y,25,25);   //drawing the circle
  
    x = x + dx;   //change ball's x coordinate
    y = y + dy;   //change ball's y coordinate
    
    if ( x< 14 || x >= 585){  //if the ball hits the bottom or top edge
       dx = -1 * dx;        //reverse the changing of x coordinate
    }
    
    if ( y < 14 || y >= 485){  //if the ball hits left or right edge
       dy = -1 * dy;         //reverse the y coordinate changing
    }
    if (mousePressed == true) {  //if user clicks mouse
      x = mouseX;                // set ball's x coordinate to mouse's
      y = mouseY;                // ball's y coordinate to mouse's
      background(0);             //background reset to black, reset ball trails
    }
}
