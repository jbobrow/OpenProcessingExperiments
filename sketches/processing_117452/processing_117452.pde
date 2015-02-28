
void setup() {
    size(200,200) ;
}

void draw() {
    background(255) ;
    if(mouseY>100) {
    fill(0) ;
    }
    if(mouseY<=100) {
    fill(255) ;
    }
    if(mouseY>100) {
    stroke(255) ;
    }
    if(mouseY<=100) {
    stroke(255,0,0) ;
    }
    ellipse(mouseX,mouseY,50,50) ;
}
