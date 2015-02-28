
int x=20;
int y=20;

void setup (){

    size(300,400);
   
}

void draw (){

    fill (300, 400, 20);
    ellipse (mouseY,mouseX,100,100);
    y = y+1;
}
