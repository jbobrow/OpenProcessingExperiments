
//Variables
int posX = 50;
int posY = 50;
int dirX = 0;
int dirY = 1;
int RED = 123;
int GREEN = 255;
int BLUE = 98;
int ellipseSize = 80;

void setup() {
size(600, 300);
background(RED, GREEN, BLUE);
}


void draw() {
background(RED, GREEN, BLUE); 
println(mouseX + " " + mouseY); // co-ordinates of mouse is shown below
noStroke();
animator();
ellipse(posX, posY, ellipseSize, ellipseSize);
strokeWeight(10);
}


void animator() {
  
// Position on Y axis
if (posX >= width-ellipseSize/2) {
dirX = 1;
}
if (posX <= ellipseSize/2) {
dirX = 0;
}
if (dirX == 1) {
posX = posX - 5; 
}
else {
posX = posX + 5;
}

// Position on Y axis
if (posY >= height-ellipseSize/2) {
dirY = 1;
}
if (posY <= ellipseSize/2) {
dirY = 0;
}
if (dirY == 1) {
posY = posY - 5; 
}
else {
posY = posY + 5;
}
}



