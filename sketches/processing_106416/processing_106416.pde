
int x = 26;
int y = 26;
int dx = 3;
int dy = 4;

void setup() { // setup function called initially, only once
    size(666,666);
}
void draw() { // draw function loops
    fill(200,164,222);
    ellipse(x,y,26,26);
    
    if (y>600) {
    dy = -dy;
    }
    if (y<26) {
    dy = -dy;
    }
    y = y+dy;
    
    if (x>600) {
    dx = -dx;
    }
    if (x<26) {
    dx = -dx;
    }
    x = x+dx;
    
    if (mousePressed) {
        x = mouseX;
        y = mouseY;
    }
}
