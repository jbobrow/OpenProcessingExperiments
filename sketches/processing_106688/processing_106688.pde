
int x=20;
int y=20;

void setup (){

    size(300,200);
    println("Setup");
}

void draw (){

    fill(0,255,0);
    ellipse (x,y,20,20,20,20 );
    y=y+1;
    
    fill(255,0,0);
    ellipse(mouseX, mouseY, 20, 20);
}
