
int size = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

int shapeType = 0;

boolean cycleColor = false;

int counter = 0;

color col = #FFFFFF;


void setup() 
{
  size(640, 300);
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
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-size || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
  }

  // Draw the shape
  if(key == 'g') col = #00FF00;
  else if(key == 'r') col = #FF0000;
  else if(key == 'b') col = #0000FF;
  else if(key == 'w') col = #FFFFFF;
  if(key == '+') size += 5;
  else if(key == '-') size -= 5;
  if(keyCode == BACKSPACE) {
	  xpos = width/2;
	  ypos = height/2;
          cycleColor = false;
          col = #FFFFFF;
  }
  if(keyCode == UP) yspeed += .2;
  else if(keyCode == DOWN) yspeed -= .2;
  else if(keyCode == LEFT) xspeed -= .2;
  else if(keyCode == RIGHT) xspeed += .2;
  
  if(key == 'c' && cycleColor == false){
	  cycleColor = true;
	  key = 0;
  }
  if(cycleColor == true && counter > 15){
	  if(col == #FFFFFF) col = #FF0000;
	  else if(col == #FF0000) col = #00FF00;
	  else if(col == #00FF00) col = #0000FF;
	  else if(col == #0000FF) col = #FFFFFF;
	  counter = 0;
  }
  if(key == 'y' && shapeType == 0){
    shapeType = 1;
    key = 0;
  }
  else if(key == 'y' && shapeType == 1){
    shapeType = 0;
    key = 0;
  }

  counter++;
  key = 0; keyCode = 0;
  fill(col);
  if(shapeType == 0){
    ellipse(xpos+size/2, ypos+size/2, size, size);}
  else if(shapeType == 1){
     rect(xpos+size/2, ypos+size/2, size, size);}
}

