
int x = 20;
int y = 20;

int dx = 11;
int dy = 5;

void setup() {  //setup function called initially, only once
  size(250, 250);
}

void draw() {  //draw function loops 
 
    background (255,255,255);
    
    fill(0,255,0);
    ellipse(x,y,20,20);
    
    
    if (y<0) {
        dy = -dy;
    }
    if (y>250) {
        dy = -dy;  
    }
    if (x<0) {
        dx = -dx;
    }
    if (x>250) {
        dx = -dx;  
    }
    
    y = y+dy;
    x = x+dx;
    
    if (mousePressed) {
    x = mouseX;
    y = mouseY;
    fill (0,0,50);
    ellipse (x,y,20,20);
    }
}
