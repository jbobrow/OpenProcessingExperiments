
void setup() {
    size(400,300); 
}

void draw() {
    background(0,0,250);
    if(mouseX  <width/2) fill(200,0,0);
    if(mouseX >= width/2) fill(0,200,0);
    line(mouseX,0,mouseX,height-1);
    line(0,height-1,mouseX,mouseY);
    ellipse(mouseX,mouseY,20,20);
}
