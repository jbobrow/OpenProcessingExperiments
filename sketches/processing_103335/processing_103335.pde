
// Alex Chow
// 7/09/13
// Bouncing ball, that you can control



void setup(){
  size(600,500);
  background(0);
  frameRate(60);
}
int dx = 2;
int dy = 3;

int x = 50;
int y = 50;

void draw(){
  fill(255);// creates an elipse as target location
  background(0);
  ellipse(x,y, 25, 25);
  
 x = x + dx; // Where location of ball is
 y = y + dy; 
  
  if (mousePressed == true){
  x = mouseX + dx;
  y = mouseY + dy;// when mouse pressed the ball resets to mouse location
  }
 
  if (mousePressed == true)// erases other ball marks
  background(0); 
if ( x< 0 || x> 475){ // as long as The ball's cordinates are less then 475 it keeps going in that directions
    dx = -1 * dx;
  }
 if ( y < 0 || y > 475){ // ball changes direction if it would go over 475
    dy = -1 * dy;
 }

}

