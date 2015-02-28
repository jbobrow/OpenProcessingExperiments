
// Tweaked from Brian Schrank's http://www.openprocessing.org/sketch/69307

float i = 0; //hey playgramming! this is a VARIABLE used to control the rotation

void setup() {
  size(400, 400);
}

void draw() { //this entire section loops once a frame
    background(0); //this makes the background black and draws over the last square
    i = i + 0.1; //this is the variable that keeps the rotation going can also be written i += 0.1;
    
    pushMatrix(); // use this before you translate, rotate or scale.
    translate(50,50); //this puts the rect in the middle of the screen
    smooth(); //this makes the square look smooth
    fill(255,125,0); // this makes the rect orange
    rotate(i); //this rotates the rect using the variable
    rect(-25,-25,50,50); //this finally draws the rect to screen
    popMatrix(); // clear the translate, rotate or scale
    
    // Since the matrix was popped this rect behaves like before
    pushMatrix();
    translate(100, 100);
    rotate(i); //this rotates the rect using the variable
    rect(-25,-25,50,50); //this finally draws the rect to screen

    // The matrix was not popped so this rect uses the previous translate and so is rotating 100 away from its center.
    translate(100, 100);
    rotate(i); //this rotates the rect using the variable
    rect(-25,-25,50,50); //this finally draws the rect to screen
    popMatrix();
}
