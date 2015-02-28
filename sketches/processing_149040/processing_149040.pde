
void setup () {
    size (200,200);
}

void draw () {
    background (255);
    stroke (0);
    line (width/2,0,width/2,height);
    line (0,height/2,200,height/2);
    
    if (mouseX > width/2 && mouseY > height/2) {
        stroke (0);
        rect (100,100,100,100);
        fill (0);
    }
    
    if (mouseY > height/2 && mouseX < width/2) {
        stroke (0);
        rect (0,100,100,100);
        fill (0);
    }
    
    if (mouseX > width/2 && mouseY < height/2) {
        stroke (0);
        rect (100,0,100,100);
        fill (0);
    }
    if (mouseX < width/2 && mouseY < height/2) {
        stroke (0);
        rect (0,0,100,100);
        fill (0);
    }
}
