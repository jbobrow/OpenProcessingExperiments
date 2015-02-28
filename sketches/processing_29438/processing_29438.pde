
int s;
int m;
int h;
int size =60;
float xpos, ypos; 
float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;
void setup() {
  size(600,600);
  background(255);
  smooth();
  xpos = width/2;
  ypos = height/2;
}
void draw() {
   xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  s = second();
  m = minute();
  h = hour();
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-size || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
  }
  stroke(255,s*10,s);
  
  triangle(xpos+size/2,ypos+size/2,s*10,m*15,s*10,m*15);
}

