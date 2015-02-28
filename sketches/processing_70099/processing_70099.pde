
/*  pattern.pde 
    Aya Demler */

//initializing variables
int windowWidth = 500;
int windowHeight = windowWidth;
int spaceNumber = 20;
int deltaX = (windowWidth/spaceNumber);
int deltaY = (windowHeight/spaceNumber);
int x1 = 0;
int y1 = 0;
int x2 = windowWidth;
int y2 = 0;


//initializing window
void setup() {
    smooth();
    size(windowWidth, windowHeight);
    //size(windowWidth, windowHeight, PDF, "wallpaper.pdf");
    background(0);
    drawPattern();
    pushMatrix();
    translate(250, 50);
    rotate(radians(45));
    scale(0.565);
    drawPattern();
    popMatrix();
    pushMatrix();
    translate(170, 170);
    scale(0.317);
    drawPattern();
    popMatrix();
}

//drawing the pattern
void drawPattern() {
    //going across top edge
    stroke(#2E7452);
    for(int i = 0; i < spaceNumber; i++) {
        y2 += deltaY;
        line(x1, y1, x2, y2);
        x1 += deltaX;
    }
    
    //going down right edge
    stroke(#29B975);
    for(int i = 0; i < spaceNumber; i++) {
        x2 -= deltaX;
        line(x1, y1, x2, y2);
        y1 += deltaY;
    }
    
    //going across bottom edge
    stroke(#84F2BE);
    for(int i = 0; i < spaceNumber; i++) {
        y2 -= deltaY;
        line(x1, y1, x2, y2);
        x1 -= deltaX;
    }
    
    //going up left edge
    stroke(#29B975);
    for(int i = 0; i < spaceNumber; i++) {
        x2 += deltaY;
        line(x1, y1, x2, y2);
        y1 -= deltaX;
    }
    exit();
}
