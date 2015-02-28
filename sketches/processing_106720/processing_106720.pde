
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

    if (keyPressed) {
                
               
        if (key == 'd'&&key; == 's') {
            dy = 2;
            dx = 2;
        }
        
        else if (key == 'a'&&key; == 's') {
            dx = -2;
            dy = 2;
        }
        
        else if (key == 'a'&&key; == 'w') {
            dy = -2;
            dx = -2
        }
        
        else if (key == 'd'&&key; == 'w') {
            dy = -2;
            dx = 2;
        }
               
        else if (key == 'd') {
            dx = 2;
            dy = 0;
        }
        
        else if (key == 'w') {
            dy = -2;
            dx = 0;
        }
        
        else if (key == 'a') {
            dx = -2;
            dy = 0;
        }
        
        else if (key == 's') {
            dy = 2;
            dx = 0
        }       
    }
    
    else {
        fill(250,0,0);
        dx = 0;
        dy = 0;
    }
    
    x = x + dx;
    y = y + dy;
    
    

}
