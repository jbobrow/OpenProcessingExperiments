
int x=20;
int y=20;

int dx=5;
int dy=0;

void setup() {  //setup function called initially, only once
    size(300,300);
}

void draw() {  //draw function loops 
    background(0,0,0);
    ellipse(x,y,20,20);
    x=x+dx;
    y=y+dy;
    dy=dy+1
    if (y>300) {dy=-dy;}
    if (y<0) {dy=-dy;}
    if (x>300) {dx=-dx;}
    if (x<0){dx=-dx;}
    
    if(mousePressed) {
    x = MouseX;
    y = MouseY;
    }
    
}
