
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background (255,255,255);
}

void draw() {  //draw function loops 
    
    ellipse(x,y,20,20);
    
    
    if (keyPressed){

        fill(0,255,0);
        
        if (key == 'd'){
            dx = 1;
            dy = 0;
        }
        
        else if (key == 'a'){
            dx = -1;
            dy = 0;    
        }
        
        else if (key == 'w'){
            dx = 0;
            dy = -1;
            }
        }
        else if (key == 's'){
            dx = 0;
            dy = 1;
        }
        
          
   else {
        fill(200,123,0);
        }  
    
    x = x+dx;
    y = y+dy;
    
}
