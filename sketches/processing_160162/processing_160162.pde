
//week 2 assignment 5c
 
//change the following values to change screen size:
int sizeX = 450; //width of the screen
int sizeY = 210; //height of the screen
 
int centerX = sizeX/2; //half of screen width
int centerY = sizeY/2; //half of screen height
 
int color;               //declares the variable "color" as an integer, because color variables cannot have decimals.
boolean grey;            //variable "grey" can be true or false.

void setup() {
size(sizeX,sizeY);
grey = false;            //sets grey to false, because it starts as true.
}
 
void draw() {
background(255);         //setup of initial shapes
stroke(0);
line(centerX,0,centerX,sizeY);
line(0,centerY,sizeX,centerY);

noStroke();
fill(color);
 
if (mouseX < centerX && mouseY < centerY) {
    rect(0,0,centerX,centerY);
} else if (mouseX > centerX && mouseY < centerY) {
    rect(centerX,0,centerX,centerY);
} else if (mouseX < centerX && mouseY > centerY) {
    rect(0,centerY,centerX,centerY);
} else if (mouseX > centerX && mouseY > centerY) {
    rect(centerX,centerY,centerX,centerY);
}
 
}

void mousePressed() {    //changes color and the "grey" boolean variable.
    if (grey) {
        color = 0;
        grey = false;
    } else {
        color = 150;
        grey = true;
    }
}
