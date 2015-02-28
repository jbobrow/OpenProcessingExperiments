
 
int diam = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 3.8;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

float mouseShapeDist;

void setup() 
{
  size(1280, 800);
  noStroke();
  frameRate(30);
  smooth();
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;

}

void draw() 
{
  background(102);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  //xpos = constrain (xpos, 0, width-diam);
  ypos = ypos + ( yspeed * ydirection );
  //ypos = constrain ( ypos, 0, height-diam);
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-diam || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-diam || ypos < 0) {
    ydirection *= -1;
  }
  mouseShapeDist = dist(xpos+diam/2,ypos+diam/2,mouseX,mouseY);
  println(mouseShapeDist);
  if(mouseShapeDist <= diam/2){
    xdirection *= -1;
    ydirection *= -1;
    xpos = 1.1*(xpos + xspeed * xdirection);
    ypos = 1.1*(ypos + yspeed * ydirection);
  }
  ellipseMode(CORNER);
  ellipse(xpos, ypos, diam,diam);
}

