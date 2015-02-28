
void setup() {
    size(601, 601);
}
    
void draw() {
    for (int x=0; x<=600; x=x+10) {
        line(x,x,x,600);
    }
    for(int y=0; y<=600; y=y+10) {
        line(y,y,600,y);
    }
}
