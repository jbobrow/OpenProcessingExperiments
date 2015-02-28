
PImage img;
PImage img_02;
// PImage alphaImg = loadImage("jb_0285.png");

int X=0;
int Y=0;
int Z=0;

int W=0;
int V=0;


int locationX;
int locationY;
int zoomandscale = 5;

void setup() {
size(1280, 720);
img = loadImage("jb_0285.png");
locationX = -5;
locationY = 10;
}

void draw() {
// img.alpha(alphaImg);
int X=int(random(255));
int Y=int(random(255));
int Z=int(random(255));
int W=int(random(360));
int V=int(random(-1, 1));

// image(img, X, X);
translate(mouseX+locationX, mouseY+locationY);

println("locationX: " +locationX +" locationY: " +locationY);
rotate(X);
tint(X, Y, Z);
image(img, locationX-img.width/8, locationY-img.height/8, img.width/4, img.height/4);
stroke(Z,Y,X);
  line(mouseX, mouseY, mouseX+X, mouseY+Y);
// image(img, 25, 0);
}

void keyPressed() {
  switch(key) {
    case 'w':
    case 'W':
    case UP:
      moveUp();
      break;
    case 's':
    case 'S':
    case DOWN:
      moveDown();
      break;
    case 'a':
    case 'A':
    case LEFT:
      moveLeft();
      break;
    case 'd':
    case 'D':
    case RIGHT:
      moveRight();
      break;      
  }
}

  void moveUp() {
    locationY -= zoomandscale;

  }
  
  void moveDown() {
    locationY += zoomandscale; 
  }
  void moveLeft() {
    locationX -= zoomandscale;
  }
  
  void moveRight() {

    locationX += zoomandscale; 
  }

