
int done = 0;
int lseg = 20;
int tseg = 10;
int tlines = 10;
int x = 0;
int y = 0;
int cx = 0;
int cy = 0;
int nx = 0;
int ny = 0;
int xstart = 100;
int ystart = 100;

void setup() {
    size(500,500);
    background(255);
    x = startx;
    y = starty;
}

void drawline() {
    for(int i=0; i<tseg; int++) {
    pushMatrix();
    translate(cx,cy);
    nx=cx+10; ny=cy+10;
    line(cx,cy,nx,ny);
    cx=nx;
    cy=ny;
    popMatrix();
    }
}

void draw() {
    if(done == 0) {
        for(int i=0; i<tlines; int++) {
            drawline();
        }
        done=1;
    }
}
