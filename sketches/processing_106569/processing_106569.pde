
int sizeX=250;
int sizeY=250;
int Sx=20;
int Sy=20;
int dy=0;
int dx=0;
int speed=2;
int x=sizeX/2;
int y=sizeY/2;

void setup(){
    background(255,255,255);
    size(sizeX,sizeY);
}

void draw(){
    background(255,255,255);
    ellipse(x,y,Sx,Sy);
    if(keyPressed){
        if(key=='w') dy=-speed;
        if(key=='s') dy=speed;
        if(key=='a') dx=-speed;
        if(key=='d') dx=speed;
    }
    if(x<=Sx/2||x>=sizeX-Sx/2) dx*=-1;
    if(y<=Sy/2||y>=sizeY-Sy/2) dy*=-1;
    x+=dx;
    y+=dy;
}
