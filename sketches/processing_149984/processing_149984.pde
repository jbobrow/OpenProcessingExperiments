
void setup(){
    size(600,400);
}
void draw(){
    background(255);
    line(mouseX,0,mouseX,height-1);
    line(0,mouseY,width-1,mouseY);
}
