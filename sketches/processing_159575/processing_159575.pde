
//week 1 assignment 5
//exercise 3-7 in book

//setup

void setup() {
size(400,400)
background(255)
stroke(0)
}

void draw() {
strokeWeight((abs(mouseX-pmouseX)+abs(mouseY-pmouseY))/2);
line(pmouseX,pmouseY,mouseX,mouseY);
}

