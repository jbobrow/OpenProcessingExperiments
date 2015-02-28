
int x=20;
int y=20;


void setup(){

    size(300,200);
    println("setup");

}

void draw(){

    
    ellipse(x,y,20,20,20,20);
    fill(random(255),random(255),random(255),50);
    y=x+1
    x=y+1
    
    ellipse(mouseX,mouseY,20,20,20,20);
    fill(random(255),random(255),random(255),50);

}
