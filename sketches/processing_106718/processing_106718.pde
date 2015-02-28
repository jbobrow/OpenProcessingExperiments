
int x=20;
int y=20;
int dx=1;
int dy=1;

int diameter=1;
int rad=diameter/2;


void setup() {  //setup function called initially, only once
    size(250,250);
 }

void draw() {  //draw function loops 
    ellipse (x,y,diameter,diameter);
    diameter=diameter+0.1;

    if (keyPressed == true) {
        if (key == 'd'||key == 'D') {
            dx=1;
            dy=0;
            }
        else if (key == 'a'||key=='A') {
            dx=-1;
            dy=0;
            }
        else dx=0;
        
        if (key=='w'||key=='W') {
            dy=-1;
            dx=0;
            }
        else if (key=='s'||key=='S') {
            dy=1;
            dx=0;
            }
        else dy=0;
    } 

    
    x=x+dx;
    y=y+dy;
    if (x>250-diameter) dx=-dx;
    if (x<0) dx=-dx;
    if (y>250-diameter) dy=-dy;
    if (y<0) dy=-dy;
    
}
