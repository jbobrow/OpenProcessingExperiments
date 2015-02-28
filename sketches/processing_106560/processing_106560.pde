
int x=20;
int y=30;
int Sx=20;
int Sy=20;
int sizeX=400;
int sizeY=300;
int dx=0;
int dy=1;

void setup(){
    background(255,255,255);
    size(sizeX,sizeY);
}

void draw(){
    background(255,255,255);
    fill(0,255,0);
    if(mousePressed){
        x=mouseX;
        y=mouseY;
    }
    ellipse(x,y,Sx,Sy);
    if(y>=sizeY-Sy/2) dy=-dy;
    else if(y<=Sy/2) dy=-dy;
    y+=dy;
}
