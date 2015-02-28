

int SQUARE_WIDTH = 20;
int SQUARE_HEIGHT = 20;

PImage img1,img2;

void setup() {  
size(1000,1000);  
img1 = loadImage("glow1.jpg");  
img2 = loadImage("glow2.jpg");  
image(img1,0,0);
}

void draw() {
if(mousePressed){
  copy(img2,
  constrain(mouseX-SQUARE_WIDTH/2,0,width),
  constrain(mouseY-SQUARE_HEIGHT/2,0,height),
  SQUARE_WIDTH,
  SQUARE_HEIGHT,
  constrain(mouseX-SQUARE_WIDTH/2,0,width),
  constrain(mouseY-SQUARE_HEIGHT/2,0,height),
  SQUARE_WIDTH,
  SQUARE_HEIGHT);}
}

