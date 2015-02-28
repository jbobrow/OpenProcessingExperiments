
//Name:Liheng Zhang
//Date: 07/09/13
//A bouncing ball
//Click to make the ball bounce start at your current mouse posistion.

void setup(){
  size(600,500);  //the resolution
  background(0);  //background color
  frameRate(60);  //framerate
}

int dx = 2;  //move in the X direction 
int dy = 3;  //move in the Y direction

int x = 50;  //initial X posistion
int y = 50;  //initial Y posistion

void draw(){
    fill(255);  //Color of the ellipse
    ellipse(x,y,25,25);  //Ellipse posistion and size
  
    x = x + dx;  //change in X posistion
    y = y + dy;  //change in Y posistion
    
    if ( x< 0 || x > 475){  //when X is outside the 0 to 475 pix range
       dx = -1 * dx;  // Mutiply by -1 to move the object in the oppsite X diection
    }
    
    if ( y < 0 || y > 475){  //when Y is outside the 0 to 475 pix range
       dy = -1 * dy;  //Mutiply by -1 to move the object in the oppsite Y diection
    }

    if (mousePressed == true){ //When pressed mouse
      background (0);  //background become black to erease previous action
      x = mouseX;  //change the X to the current mouse posistion
      y = mouseY;  //change the Y to the current mouse posistion
    }
      
}
