
void setup() {  //setup function called initially, only once
    size(250, 250);  // size of the canvas
    background(255); // set background white
    frameRate(100);  // limit the number of frames per second
    strokeWeight(1); // set the width of the line.
    x = 150;
    y = 150;
} 
 
void draw() {  // this is run repeatedly.  
 
 
    // choose which direction to go
    r = random(1);
    
    // calculate new point
    if (r<0.25) {
        xn = x+5;
        yn = y;
    } else if (r<0.5) {
        xn = x-5;
        yn = y;
    } else if (r<0.75) {
        yn = y+5;
        xn = x;
    } else {
        yn = y-5;
        xn = x;
    }
    
    // draw line
    line(x, y, xn, yn);
    
    // update starting point;
    x = xn;
    y = yn;
 
}
