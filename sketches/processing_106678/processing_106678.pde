
int x=20;
int y=20;


void setup() {
    size(1000,1000);
}

void draw () {
    fill(255,255,255);
    ellipse(x,y,30,30);
    fill(0,0,0);
    ellipse(x,y,10,10);
    y=y+1;
    x=x+1;
    
}
