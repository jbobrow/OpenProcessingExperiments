
int x = 250;
int y = 250;
int dx = 0;
int dy = 0;
int doorway = -1;

void setup () {
size(500,500);
smooth();
rectMode(CENTER);
}
void draw () {
    background(255,255,255);0
    if (doorway<0) {
        rect(490,220,20,20);
        rect(490,270,20,20);
    }
    else {
        rect(10,220,20,20);
        rect(10,270,20,20);
    }
    x=x+dx
    y=y+dy
    fill(255);
    ellipse(x,y,20,20);
    fill(0,0,255);
    rect(0,250,2,496);
    rect(250,0,500,2);
    rect(250,499,500,2);
    rect(499,250,2,496);
    if (keyPressed) {
        if (key == 'w' || key == 'W') {
            dy=-3;
        }
          
    } else {
        dy=0;
        
    }
    if (keyPressed) {
        if (key == 'a' || key == 'A') {
            dx=-3;
        }  
    } else {
        dx=0;
        
    }
  
    if (keyPressed) {
        if (key == 's' || key == 'S') {
            dy=3;
        } 
    } else { 
        dy=0;
    }
    if (keyPressed) {
        if (key == 'd' || key == 'D') {
            dx=3;
        } 
    } else {
        dx=0;
    }
    if (x<20) {
         x=x+6;
    }
     else {
        x=x+dx;
    }
    if (x>484) {
         x=x+-6;
    }
     else {
        x=x+dx;
    }
    if (y<20) {
         y=y+6;
    }
     else {
        y=y+dy;
    }
    if (y>484) {
         y=y-6;
    }
     else {
        y=y+dy;
    }
}
