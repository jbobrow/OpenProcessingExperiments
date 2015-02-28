
/* @pjs preload="clouds.png"; */
/* @pjs preload="mountains.png"; */
/* @pjs preload="hills.png"; */
/* @pjs preload="flowers.png"; */
/* @pjs preload="spaceship.svg"; */
PImage clouds;
PImage mountains;
PImage hills;
PImage flowers;
PShape spaceship;
PFont font;

void setup() {
 size (800, 600);
 font = loadFont ("AvenirNext-Heavy-30.vlw");
 textFont(font);
 imageMode (CENTER);
 clouds = loadImage ("clouds.png");
 mountains = loadImage ("mountains.png");
 hills = loadImage ("hills.png");
 flowers = loadImage ("flowers.png");
 spaceship = loadShape ("spaceship.svg");
}

void draw () {
  background (255);
 image (clouds, 450, 320, mouseX*.2+1000, mouseY*.2+800);
image (mountains, 450, 280, mouseX*.2+1000, mouseY*.2+600);
image (hills, 450, 240, mouseX*.08+1000, mouseY*.08+600);
image (flowers, 450, 300, mouseX*.03+1000, mouseY*.03+600);
noCursor();

shape (spaceship, mouseX-50, mouseY-20);
if (mousePressed == true) {
    textSize(30);
    textMode(CENTER);
    text ("ALIENS!", mouseX-55, mouseY+55);
}
}


