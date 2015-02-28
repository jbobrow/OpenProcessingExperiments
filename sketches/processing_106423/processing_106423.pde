
int x = 20;
int y = 20;

int dx = 20;
int dy = 10;

void setup() {
    size(300,400);
}

void draw() {

    fill(30,80,190);
    ellipse(x,y,20,20);       
    
    if (y>400) {
        dy = -dy
    }    
    if (y<0) {
        dy = -dy
    }
    y = y + dy;
    
    if (x>400) {
        dx = -dx
    }
    if (x<0) {
        dx = -dx
    }
    x = x + dx;
    
    if (mousePressed) {
    
        x = mouseX;
        y = mouseY;
    }
        
}
