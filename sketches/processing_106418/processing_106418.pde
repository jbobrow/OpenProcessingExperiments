
int x = 20;
int y = 20;

int dx = 0;
int dy = 3;



void setup() {  //setup function called initially, only once
    size(300,400);
}



void draw() {  //draw function loops

    background(255,255,255);
    fill(255,200,200); 
    ellipse(x,y,20,20);
    
    if (y>400) {
        dy = -dy;
    } 
    
    y = y+dy;
    
    if (mousePressed) {
    
        x = mouseX;
        y = mouseY;
    }
   
    
}
