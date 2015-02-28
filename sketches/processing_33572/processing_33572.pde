
/*
Norman Diaz
August 10
*/


PImage potato;
PImage eyes;
float xPoscross1;
float yPoscross1;
float xPoscross2;
float yPoscross2;


void setup() {
size(300, 300);
background(0);
eyes = loadImage("eyes.png");
potato = loadImage("potato1.jpg");
smooth();
}


void draw() {
noCursor();
background(255);
image(potato, 0, 0);
image(eyes, xPoscross1, yPoscross1);
image(eyes, xPoscross2, yPoscross2);


xPoscross1 = constrain(mouseX, 5, 50);
yPoscross1 = constrain(mouseY, 1, 3);
xPoscross2 = constrain(mouseX, 5, 50);
yPoscross2 = constrain(mouseY, 1, 3);
}






