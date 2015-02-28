
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;

void setup() {
    size(250,250);
}

void draw() {
    background(255,255,255);
    
    ellipse(x,y,20,20);
    
    if (mousePressed){
        fill(255,0,0);
    }
    
    else {
        fill(0,255,0);
    }
    
    if (keyPressed){
        fill(0,0,255);
        
        if (key == 'd' || key == 'D'){
            fill(255,255,0);
            dx = 1;
        }
        
        else if (key == 'a'){
            fill(255,255,0);
            dx = -1;
        }
        
        else if (key == 'w'){
            fill(255,255,0);
            dy = -1;
        }
        
        else if (key == 's'){
            fill(255,255,0);
            dy = 1;
        }
        
        else if (key == 'f'){
            fill(255,0,0);
            dx = 0
            dy = 0
        }
    }
       
    if (y>250) {
        dy = -dy;
    }
     
    if (y<0) {
        dy = -dy;
    }
    
    if (x<0) {
        dx = -dx;
    }
    
    if (x>250) {
        dx = -dx;
    }
    
    x = x+dx
    y = y+dy
    
}
