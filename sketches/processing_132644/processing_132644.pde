
int c = 255;
int L = 100;
// la variabile booleana mantiene in memoria lo stato: "il mouse Ã�Â¨ sopra?"
boolean mouseOver = false;



// SETUP //////////////////////////////////////////////////
void setup() {
    size(240, 240);
    smooth();
    frameRate(24);
}


// DRAW ///////////////////////////////////////////////////
void draw() {
    
    background(255);
    strokeWeight(3);
    stroke(0);
    
    
    if(mouseX > 30 && mouseX < 30+L && mouseY > 30 && mouseY < 30+L) {
        mouseOver = true;
    } else {
        mouseOver = false;
    }
    //println(mouseOver);
    
    
    if (mouseOver) {
        c = 0;
    } else {
        if (c < 255)
            c += 5;
    }
    
    fill(c);
    rect(30, 30, L, L);
}

