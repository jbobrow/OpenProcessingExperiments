
int x=20;
int y=20 ;  
void setup() {

    size (300,200);
    println("setup");

}

void draw() {
    fill (255,0,0);
   ellipse (x,y,40,50);
   x=x+1
   ellipse(mouseX,mouseY,20,20)
}
