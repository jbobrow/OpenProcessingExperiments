
// using example via http://forum.processing.org/one/topic/save-current-x-and-y-coordinate.html
int circlesize = 10;
PVector firstMouse; //The saved mouse position

void setup() {
    size(200, 200);
    background(255);
    smooth();
    fill(0, 50);
    //noStroke();
    firstMouse = new PVector(0, 0); //Initialize the PVector
}

void draw() {
    


    if (mousePressed == true) {
        line(firstMouse.x, firstMouse.y, 50, 50);
    }

}

void mousePressed() {
    firstMouse.x = mouseX; //Save the mouse position;
    firstMouse.y = mouseY;
}
