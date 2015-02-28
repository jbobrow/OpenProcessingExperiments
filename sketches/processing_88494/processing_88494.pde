
/* @pjs preload="pacman0.png, pacman1.png, pacman2.png, pacman3.png, pacman4.png, pacman5.png, pacman6.png, pacman7.png, pacman8.png, pacman9.png, pacman10.png, pacman11.png, pacmansuper0.png, pacmansuper1.png, pacmansuper2.png, pacmansuper3.png, pacmansuper4.png, pacmansuper5.png, pacmansuper6.png, pacmansuper7.png, pacmansuper8.png, pacmansuper9.png, pacmansuper10.png, pacmansuper11.png"; */
int maxImages = 12;
int maxImages2 = 12;
int imageIndex = 0;
int imageIndex2 = 0;
float x = 500;
float a = -500;
float speed = 20;
PImage[] images = new PImage[maxImages];
PImage[] images2 = new PImage[maxImages2];
PFont f;

void setup() {
  size(500, 110);
  background(31, 31, 31);
  f= loadFont("ComicSansMS-Bold-32.vlw");
  for (int i = 0; i < images.length; i++ ) {
    images[i] = loadImage( "pacman" + i + ".png" );
  }
  for (int i = 0; i < images2.length; i++ ) {
    images2[i] = loadImage( "pacmansuper" + i + ".png" );
  }
  frameRate(5);
  noLoop();
}

void draw() {
  background(31, 31, 31);
  textFont(f, 12);
  textAlign(LEFT);
  fill(222, 222, 0);
  text("Please press and hold right mouse button.", 0, 110);
  pacmango();
}
  
void pacmango(){
  x = x - speed;
  if ( x < -500){
    powerpellet();
  }
  image(images[imageIndex], x, 0);
  imageIndex = (imageIndex + 1) % images.length;
}

void powerpellet() {
  a = a + speed;
  if ( a > 500 ) {
    textFont(f, 42);
  textAlign(LEFT);
  fill(222, 222, 0);
  text("OM NOM NOM NOM...", 0, 50);
  }
  image(images2[imageIndex2], a, 0);
  imageIndex2 = (imageIndex2 + 1) % images2.length;
}

void mousePressed() {
  loop();
}
void mouseReleased() {
  noLoop();
}
    


