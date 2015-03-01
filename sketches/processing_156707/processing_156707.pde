
// Spezielle Kapitel der Schulinformatik SS2014
// Thema 8, Aufgabe Mausevents 
// Roland Richter
// Implementiert in Processing (http://processing.org)
// Online Demo: http://www.openprocessing.org/sketch/156707

int x = 100;
int y = 100;

boolean isDragged = false;

void setup() {
    size(400, 400);
    stroke(0);
}


void draw() {
    background(0, 224, 0);

    fill(255, 0, 0);
    rect(x, y, 40, 20);
}


void mousePressed() {
    isDragged = false;
    x = mouseX - 20;
    y = mouseY - 10;
}


void mouseDragged() {
    isDragged = true;
    x = mouseX - 20;
    y = mouseY - 10;
}


void mouseReleased() {
    isDragged = false;   
}


