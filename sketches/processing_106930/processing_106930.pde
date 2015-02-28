
void setup() {  //setup function called initially, only once
  size(350, 250);
}

void draw() {  //draw function loops 

    background(255,210,200);
    
    ellipse(20+mouseX,20+mouseY,100,100);
    
    if (mousePressed) {
       fill(0,150,200);
    } else {
        fill(200,0,150);
    }
}
