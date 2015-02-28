
int x=20;
int y=20;
int dx=0;
int dy=1;

void setup(){
    size(400,300);
    }
    
void draw(){
    background(255,255,255);
    fill(0,255,0);
    ellipse(x,y,20,20);
    if(y>=250) dy=-dy;
    if(y<=0) dy=-dy;
    y=y+dy;
    if (mousePressed) {
    x=mouseX;
    y=mouseY
    }
}
