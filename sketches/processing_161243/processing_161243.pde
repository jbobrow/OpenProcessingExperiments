
int x = 200;
int y = 20;
int xspeed = 3;
int yspeed = 3;
int r = int(random(255));
int g = int(random(255));
int b = int(random(255));

void setup() {
  size(800, 600);
 
}

void draw() {
  background(255);
   stroke(r,g,b); //add some color for fun
   int spacing;  
   for (spacing = 0; spacing <= 60; spacing+=30){
        ellipse(x+spacing, y, 20, 20);
   }
    if (x > width -  70 || x < 0) { // left and right walls
      xspeed = -xspeed; // go the other way
    }
    if (y > height || y < 0) { // top and bottom walls
      yspeed = -yspeed; // go the other way 
    }
   
  x+=xspeed; // this effectively moves them
  y+=yspeed;
}



