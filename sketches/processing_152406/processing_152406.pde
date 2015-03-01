
// using example via http://forum.processing.org/one/topic/save-current-x-and-y-coordinate.html
int circlesize = 10;
PVector savedMouse; //The saved mouse position


void setup() {
    size(200, 200);
    background(255);
    smooth();
    fill(0, 50);
    //noStroke();
    savedMouse = new PVector(0, 0); //Initialize the PVector
}

void draw() {
    println("Current saved mouse position: " + savedMouse.x + ", " + savedMouse.y); //Prit the saved mouse position


    if (mousePressed == true) {
        line(savedMouse.x, savedMouse.y, 0, 0);
        
    }

}

void mousePressed() {
    savedMouse.x = mouseX; //Save the mouse position;
    savedMouse.y = mouseY;
}
