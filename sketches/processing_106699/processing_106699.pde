
int x = 20;
int y = 20;

int dx = 2;
int dy = 1;


void setup() {  //setup function called initially, only once
    size(300,300);
}

void draw() {  //draw function loops 
    
    background(255,255,255);
    ellipse(x,y,20,20);
    
    x = x + dx;
    y = y + dy;

    if(y > 300) {
    
    dy = -dy
    
    }
    
    if(y < 0) {
    
    dy = -dy
    
    }
    
    if(x > 300) {
    
    dx = -dx
    
    }
    
    if(x < 0) {
    
    dx = -dx
    
    }
    
    if (mousePressed) {
    x = mouseX;
    y = mouseY;
       
    }

}
