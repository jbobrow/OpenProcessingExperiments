
int x = 200;
int y = 20;
int xspeed = 3;
int yspeed = 3;

void setup() {
  size(800, 600);

}

void draw() {
    background(255);
    int xpos = x; // actual x position.  Add to this line
    int ypos = y;
    
    if (xpos > width -70 || xpos < 0) { // left and right walls
      xspeed = -xspeed; // go the other way
      
    }
    
    if (y > height - 10 || y < 0 + 10) { // top and bottom walls
      yspeed = -yspeed; // go the other way 
      
    }
    
   {
    int count = 0;
    int spacing = 10;
    while (count < 3){
    ellipse(xpos + spacing, y, 20, 20);
    spacing = spacing + 25;
    count = count +1;
    }
   }
  
  x+=xspeed; // this effectively moves them
  y+=yspeed;
}




