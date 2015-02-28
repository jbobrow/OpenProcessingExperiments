
void setup() {
    size(200,200) ;
}

void draw() {
    background(200,100,0) ;
    stroke(0,100,200) ;
    line(mouseX,mouseY+20,mouseX,mouseY-20) ;
    line(mouseX-20,mouseY,mouseX+20,mouseY) ;
    
    fill(0,0,175) ;
    ellipse(mouseX,mouseY,50,50) ;
}
