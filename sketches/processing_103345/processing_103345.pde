
//aidan hussain
//jul 9
//bright little circle

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
  float r = random(20,50);
  background(x/3,y/3,r*4);
    fill(y,x,2*x);
    noStroke();
    ellipse(x,y,r,r);
    ellipse(r*7,100,r*2,r);
    
    x = x + dx;    //x is changing shown by moving the circle right
    y = y + dy;    //y is changing shown by moving the down
    
    if ( x< 0 || x > 475){    //x will "hit" a boundry and then its direction will reverse from right to left or vice versa
       dx = -1 * dx;         
    }
    
    if ( y < 0 || y > 475){   //y will hit a boundry and then its direction will reverse from down to up or vice versa
       dy = -1 * dy;  
    }
    if (mousePressed == true) {  //if mouse is pressed then the ball will move locations and the previous path will be deleted
      x = mouseX;
      y = mouseY;
    }
    if (keyPressed == true) {  //
      x = -1 * x;
      
      x = x + dx;
    }
}
