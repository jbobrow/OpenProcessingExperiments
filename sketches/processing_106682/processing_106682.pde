
int x=20;
int y=20;

void setup(){

    size(300,200);
    println("setup")

}

void draw(){

    fill(0,255,255)
    ellipse(x,y,25,25);
    x = x+2;
    y = y+1;
    
    
}
