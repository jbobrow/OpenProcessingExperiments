
String FILEHOST = "http://imghost.net84.net/";
PImage bg;
PImage flappy;
float yvel = -2;
float ypos = 256 - 12;

void setup() {
  size(288, 512);
  background(255);
  bg = loadImage(FILEHOST + "bg.png");
  flappy = loadImage(FILEHOST + "flappy.png");
}

void draw() {
    yvel = yvel + .5;
    ypos = ypos + yvel;
    image(bg, 0, 0);
    image(flappy, 50, ypos);
}

void mouseClicked() {
    var snd = new Audio(FILEHOST + "flap.mp3");
    snd.play();
    yvel = -8;
}
