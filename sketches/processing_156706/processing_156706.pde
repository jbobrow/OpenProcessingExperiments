
// Spezielle Kapitel der Schulinformatik SS2014
// Thema 8, Aufgabe Tastaturevents 
// Roland Richter
// Implementiert in Processing (http://processing.org)
// Online Demo: http://www.openprocessing.org/sketch/156706

int x = 100;
int y = 100;

String s = "";

void setup() {
    size(400, 400);
    stroke(0);
}


void draw() {
    background(0, 224, 0);
    
    fill(0);
    textSize(16);     
    text(s, x, y);
    
    fill(255);
    rect(x, y, 10, 10);
}


void keyPressed() {
    s = "keyPressed ";
    
    if (key == CODED) {
        switch (keyCode) {
            case UP:    --y; s = s + "UP"; break;
            case DOWN:  ++y; s = s + "DOWN"; break;
            case LEFT:  --x; s = s + "LEFT"; break;
            case RIGHT: ++x; s = s + "RIGHT"; break;
        }
    } else {
        s = s + "\'" + str(key) + "\'";   
    }
}


void keyTyped() {
    s = "keyTyped \'" + str(key) + "\'"; 
}


void keyReleased() {
}


