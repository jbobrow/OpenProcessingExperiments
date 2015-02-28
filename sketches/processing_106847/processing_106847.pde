
void setup() {
    size(250,250);
}

int x = 20;
int y = 20;
int dx = 0;
int dy = 1;

void draw() {
    ellipse(x,y,20,20);
    
    y += dy;
    
    if (y > 250) {
        dy = -dy;
    }
    if (y < 0) {
        dy = -dy;
    }

    if(mousePressed){
        x = mouseX;
        y = mouseY;
    }
}
