
void setup(){
    size(600,400);
}
void draw(){
    background(255);
    stroke(0);
    strokeWeight(1);
    line(mouseX,0,mouseX,height-1);
    line(0,mouseY,width-1,mouseY);
    ellipse(mouseX,mouseY,100,100);
    stroke(255,0,0);
    strokeWeight(3);
    point(mouseX,mouseY);
}
