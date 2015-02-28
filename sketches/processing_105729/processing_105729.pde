
//Lathem Wojno
//ClickBall: Ball moves to wherever you click the mouse
//8/6/2013
// Credit: Ren Ervin Bettendorf 
 
/* SCREENSAVERS FER DAYS BROSKIES */
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
  background(0);
    fill(255);
    ellipse(x,y,25,25);
 
    x = x + dx;
    y = y + dy;
    
    if (mousePressed) {
      x = mouseX;
      y = mouseY;
    }
    
    if ( x< 0 || x > 600){
       dx = -1 * dx;
    }
 
    if ( y < 0 || y > 500){
       dy = -1 * dy;  
    }
 
}
