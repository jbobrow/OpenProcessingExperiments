
int x = 200;
int y = 20;
int xspeed = 3;
int yspeed = 3;
 
void setup() {
  size(800, 600);
  frameRate (400);
 
}
 
void draw() {
  background(255);
 
     
    //if (x+100 > width || x+100 < 0) { // left wall
      //xspeed = -xspeed; // go the other way
   // }
    if (x > width || x < 0) { // right wall
      xspeed = -xspeed; // go the other way
    }
    if (y > height || y < 0) { // top and bottom walls
      yspeed = -yspeed; // go the other way
    }
    fill (120,0,4);
    ellipse (x- 50, y, 30, 30);
    fill (0, 180, 80);
    ellipse (x,y,30,30);
    fill (60, 30, 200);
    ellipse(x+50,y,30,30);
   
  x+=xspeed; // this effectively moves them
  y+=yspeed;
}



