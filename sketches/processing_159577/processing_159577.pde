
//week 1 assignment 5c

//setup

void setup() {
size(400,400);
background(200);
stroke(255);
}

void draw() {
strokeWeight((abs(mouseX-pmouseX)+abs(mouseY-pmouseY))/2);
line(pmouseX,pmouseY,mouseX,mouseY);
}

void mousePressed() {
stroke(0);
}

void mouseReleased() {
stroke(255);
}

