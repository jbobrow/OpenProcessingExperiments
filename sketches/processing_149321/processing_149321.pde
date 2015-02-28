
void setup() {
    size(300,300);
    fill(200,255,200);
}

void draw() {
    //background(0);
    fill(255,200,0);
    ellipse(mouseX,mouseY,50,50);
    fill(220,0,0);
    ellipse(mouseX,mouseY,20,20);
    
    fill(255,200,0);
    ellipse(width-mouseX,mouseY,50,50);
    fill(220,0,0);
    ellipse(width-mouseX,mouseY,20,20);
    
    
}
void mousePressed() {
    background(random(255), random(255), random(255));
}
