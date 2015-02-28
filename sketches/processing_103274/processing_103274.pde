
//Gil Gerstel
//July 8th 2013
//Bouncing Cube
// Credit: Ren Ervin Bettendorf 

/* SCREENSAVERS FER DAYS BROSKIES */
void setup(){// seting up the animation
  size(600,500);  //size of screen
  background(0);  //background color black
  frameRate(60);  // how many frames does the game update
}

int dx = 2;//sets angle of movement lengthwise
int dy = 3;//sets angle of movement heightwise

int x = 50;//sets variable
int y = 50;// sets variable

void draw(){  // seting the part of aniomation that updates
    fill(255); //color of ball
    ellipse(x,y,25,25); // creates the moving ball
  
    x = x + dx; // sets placement and movement of ball
    y = y + dy; // sets placement and movement of ball
    
    if ( x< 0 || x > 475){ // tells the ball to bounce back if it hits the sides
       dx = -1 * dx;
    }
    
    if ( y < 0 || y > 475){ // tells the ball to bounce back if it hits top or bottom
       dy = -1 * dy;  
    }
    if (mousePressed) {
    x = mouseX ;
    y = mouseY ;
    }
}
