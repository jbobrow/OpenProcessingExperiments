
//Declarations: 

float xpos; //declare a variable for x
float ypos; //declare a variable for y
float xs; //declare a variable for x
float ys; //declare a variable for y
int radius; //radius!!
  // Global gravity variable
float gravity = 1; 

//Setup

void setup() {
  size(500, 500);

  xs = 2; //initialize x speed 

  xpos = 25;
  ypos = 25;
  radius = 50;
  
 
}


//Draw

void draw() {
    ys = ys + gravity; //initialize y speed
  noStroke();
  background(255, 255, 255);
  fill(200, 0, 0);

  xpos = xpos + xs;
  if ((xpos >= width-radius/2) || (xpos  <= radius/2)) {
    xs = xs * -1; 
  }

   ypos = ypos + ys;
  if ((ypos >= height-radius/2) || (ypos <= radius/2)) {
    ys = ys * -1;
   }
  
  if (ypos>=height-radius/2&&ys<=0) {
 
    ypos=height-radius/2;
  }
    ellipse(xpos, ypos, radius, radius); //draw a circle
  }



