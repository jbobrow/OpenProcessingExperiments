
int counter;

void setup() {  //setup function called initially, only once
    size(350,250);
}
     

void draw() {  //draw function loops 
    background(200,30,70)
    ellipse(20+mouseX,20+mouseY,100,100);
    
    if (mousePressed) {
        fill(0,255,0);
    }
    else {
        fill(255,0,0);
    }
}
