
int x;
int y;
int xspeed = 3;
int yspeed = 3;
int diam = 20;
float r;
float g;
float b;

void setup() {
  size(500, 300);
  x=200; 
  y=20;
}

void draw() {
  noStroke();
  r = random(255);
  g = random(255);
  b = random(255);
  
    int xpos = x; 
    int ypos = y;
    
    if (xpos > (width - diam/2) || xpos < (0 + diam/2)) { // left and right walls
      xspeed = -xspeed; //change direction
      fill(r, g, b); //change color
    }
    if (y > (height - diam/2) || y < (0 + diam/2)) { // top and bottom walls
      yspeed = -yspeed; //change direction
      fill(r, g, b); //change color
    }
    ellipse(xpos, y, diam, diam);
  
  x+=xspeed; //move
  y+=yspeed;
}



