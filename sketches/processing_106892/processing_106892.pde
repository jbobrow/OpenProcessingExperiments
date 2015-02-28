
int x=20;
int y=20;
int dx=0;
int dy=0;
void setup(){
    size(300,300);
    background(255,255,255);
    }
void draw(){
fill(255,255,255);
line(x,y,20,20);
if (key== 'd'){
    dx=1;
    dy=0;
}
    if (key== 's') {
        dy=1;
        dx=0;
    }
    if (key== 'a') {
        dx=-1;
        dy=0;
    }
    if (key== 'w') {
        dy=-1;
        dx=0;
    }
    x=x+dx;
    y=y+dy;
    
    }
