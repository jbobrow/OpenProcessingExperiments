
float flashposX = 250;
float flashposY = 490;
PImage flash;
PImage kid;


void setup() {
  size(500,500);
  frameRate(20);
  flash = loadImage("flashlight.png");
  kid = loadImage("flashkid.png");
}

void draw() {
background(0,0,0);
fill(255,255,255);


if(mouseX>=flashposX && mouseY>=flashposY) {
fill(255,255,0);
noStroke();
ellipse(mouseX + 50,mouseY + 50,60,60);
triangle(flashposX,flashposY,mouseX+25,mouseY+55,mouseX+68,mouseY+30);
}

if(mouseX>flashposX && mouseY<=flashposY) {
fill(255,255,0);
noStroke();
ellipse(mouseX + 50,mouseY - 50,60,60);
triangle(flashposX,flashposY,mouseX+25,mouseY-55,mouseX+68,mouseY-30);
}

if(mouseX<=flashposX && mouseY<flashposY) {
fill(255,255,0);
noStroke();
ellipse(mouseX - 50,mouseY - 50,60,60);
triangle(flashposX,flashposY,mouseX-25,mouseY-55,mouseX-68,mouseY-30);
}

if(mouseX<flashposX && mouseY>flashposY) {
fill(255,255,0);
noStroke();
ellipse(mouseX - 50,mouseY + 50,60,60);
triangle(flashposX,flashposY,mouseX-25,mouseY+55,mouseX-68,mouseY+30);
}

if (key == CODED && keyCode == RIGHT && keyPressed) {
  flashposX = flashposX + 4;
}

if (key == CODED && keyCode == LEFT && keyPressed) {
  flashposX = flashposX - 4;
}

if (key == CODED && keyCode == UP && keyPressed) {
  flashposY = flashposY - 4;
}

if (key == CODED && keyCode == DOWN && keyPressed) {
  flashposY = flashposY + 4;
}

if (flashposX < 0) {
  flashposX = 0;
}

if (flashposX > 500) {
  flashposX = 500;
}

if (flashposY < 0) {
  flashposY = 0;
}

if (flashposY > 500) {
  flashposY = 500;
}


image(kid,flashposX-80,flashposY-100,150,180);
image(flash,flashposX,flashposY,25,12);

}

