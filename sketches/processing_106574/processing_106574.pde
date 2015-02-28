
int x = 20;
int y = 20;
int dy=0;
int dx=0;


void setup() {  //setup function called initially, only once
  size(250, 250);

}

void draw() {  //draw function loops 
background (255,255,255);
    ellipse(x,y,20,20);
    
    if (mousePressed) { 
        fill (255,0,0);
    }
    else fill(0,255,0);
    
    if (keyPressed){
        fill(0,0,255);
    
        if (key=='d' || key=='D'){
            fill (255,255,0)
            dx=1;
        }
        
        if (key=='a') dx=-1;
        if (key=='w') dy=-1;
        if (key=='s') dy=1;
        if (key=='d') dy=1;
    }
    x=x+dx
    y=y+dy
}
