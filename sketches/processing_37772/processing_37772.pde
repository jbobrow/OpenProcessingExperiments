

int size = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 10;  // Speed of the shape
float yspeed = 25;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 0;  // Top to Bottom
int times = 1; // 

void setup() 
{
  size(640, 200);
  noStroke();
  frameRate(30);
  smooth();
  // Set the starting position of the shape
  xpos = width/2  ;
  ypos = height/2;
}

void draw() 
{
  background(-120);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-size || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
  }
  if (xpos < width/2 && xdirection == -1 && times>3){
    xdirection = 0 ; ydirection = -1; times = 1 ;
  }
  if (ypos < height/2 && ydirection == -1 && times>3){
    ydirection = 0 ; xdirection =1 ; times = 1 ;
  }
if (xpos> width-size || xpos < 0){
  times = times +1;
} 
 if (ypos > height-size || ypos < 0) {
   times = times +1;}
  // Draw the shape
  color (330) ;
  ellipse(xpos+size/2, ypos+size/2, size, size);

}


