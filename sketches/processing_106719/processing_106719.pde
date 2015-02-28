
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;

void setup() {
  size(250,250);
 
}

void draw() {
    background (255,255,0);
    ellipse(x,y,20,20);
    

    rect (50,50,50,50);
    
    if (x > 50&& x<100);
     dx = 0;
     dy = 0;
    
if (keyPressed) {
    fill(0,255,0);
    
    if (key == 'd'){
        dx = 5;
        dy = 0;
     }
        
     else if (key =='a'){
        dx = -5;
        dy = 0;
     }
    
       
    else if (key == 'w'){
        dy = -5;
        dx = 0;
     }
        
     else if (key =='s'){
        dy = 5;
        dx = aaasdwasa0;
     }
     
    }
    
else {
   fill(255,0,0);
   dx = 0;
   dy = 0;
   }
    
    x = x+dx;
    y = y+dy;
  
}
