
void setup() {
    size(601,601);
}

void draw() {
    for(int x=0;x<=600;x=x+10) {
        line(x,0,x,600)
    }
    for(int y=0;y<=600;y=y+10) {
        line(600,y,0,y)
    }
}
