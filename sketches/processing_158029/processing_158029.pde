
int counter;
int x;
int y;

void setup() {  //setup function called initially, only once
    size(400,400);
    background(255);
}
 
void draw() {  //draw function loops

    fill(255);
    ellipse(x,y,20,20);
    
    if (key == 'd') {            //right
        x = x + 1;
    }
    
    if (key == 'z') {            //down
        y = y + 1;
    }
    
    if (key == 's') {            //left
        x = x - 1;
    }
    
    if (key == 'w') {            //up
        y = y - 1;
    }
    
} 
