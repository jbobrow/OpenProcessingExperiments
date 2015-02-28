
// Nathan Allen
// DATE
// PROJECT Bouncing Ball: [Bouncing ball that resets to mouse click]
// References: Sample code from Digital Media Academy
// Credit: Ren Ervin Bettendorf 
/* SCREENSAVERS FER DAYS BROSKIES */

void setup(){
  size(500,500);  
  background(0);
  frameRate(60);
}

int dx = 3;
int dy = 5;

int x = 50;
int y = 50;

void draw(){
    fill(255);
    ellipse(x,y,25,25);
  
    x = x + dx;
    y = y + dy;
    
    if ( x< 0 || x > 475){
       dx = -1 * dx;
    }
    
    if ( y < 0 || y > 475){
       dy = -1 * dy;  
    }
    if (mousePressed==true) {
      background (0);
      x=mouseX;
      y=mouseY;
    }
}
