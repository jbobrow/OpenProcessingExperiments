
// Start the object in a random location
double x = random(width);
double y = random(height);

// The object's pursuit speed
float speed = 1;

void setup () {
    size(800, 600);
    fill(255,0,0);
}

void draw () {
    // clear the screen
    background(255);
    
    // draw the object
    ellipse(x, y, 20, 20);
    
    // find the angle between the mouse and the object
    double angle = Math.atan2(mouseY - y, mouseX - x);
    
    double slope = (mouseY - y)/(mouseX - x);

    // update the object's location for the next call to draw()
    x += mouseX*slope;
    y += mouseY*slope;
}
