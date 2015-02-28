
int x=20;
int y=20;

int dx=5;
int dy=5;
void setup() {  //setup function called initially, only once
    size(500,500);
}

void draw() {  //draw function loops 
    background(255,255,255);
    ellipse(x,y,20,20);
    
    if(key == 'd'){
        dx=5;
        dy=0;
    }
    
    if (key=='a'){
        dx=-5;
        dy=0;
    }
    
    if (key=='s'){
        dx=0;
        dy=5;
    }
    
    if (key=='w'){
       dx=0
       dy=-5
    }
    
    x=x+dx;
    y=y+dy;
    
    }

