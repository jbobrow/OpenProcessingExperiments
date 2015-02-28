
int x=20;
int y=20;

void setup(){ //function def
    size(300,200);
    println("setup");
    
    }
    

void draw(){ //draw body

    fill(0,0,255);
    ellipse(x,y,20,20);
    y = y+1;
    
    fill(255,0,0);
    ellipse(mouseX,mouseY,20,20);
    
    }
