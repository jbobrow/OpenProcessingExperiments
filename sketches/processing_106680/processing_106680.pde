
int x=20;
int y=20;

void setup(){
    size(300,200);
   
}

void draw(){
    fill(255,255,0);
    ellipse(x,y,100,100);
    y=y+1;
    x=x+2;
    
    fill(255,0,0);
    ellipse(mouseX,mouseY,20,20);
}
