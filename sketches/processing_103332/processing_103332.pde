
//Samwise Pollack
//July 9th, 2013
//An edited bounce simulator
// Credit: Ren Ervin Bettendorf 

void setup(){ 
  size(500,500);  //sets the stage to a certain size
  background(0);  //sets the background to black
  frameRate(60);  //sets the frame rate to sixty fps
}

int dx = 2;  //assigns a value to dx
int dy = 3;  //assigns a value to dy

int x = 50;  //assigns a value to x
int y = 50;  //assigns a value to y

void draw(){  
    fill(255);
    ellipse(x,y,20,20);  //creates a white rectangle, now a circle
  
    x = x + dx;  //code that changes the value of x by dx every frame
    y = y + dy;  //changes the value of y by dy every frame
    
    if ( x < 10 || x > 490){  //if the x value hits the edge of the screen...
       dx = -1 * dx;  //then dx reverses
    }
    
    if ( y < 10 || y > 490){  //if the y value hits the edge of the screen...
       dy = -1 * dy;  //then dy reverses
    }
    
    if (mousePressed == true) {
      x = mouseX;
      y = mouseY;
      background(random(255),random(255),random(255));
    }

}
