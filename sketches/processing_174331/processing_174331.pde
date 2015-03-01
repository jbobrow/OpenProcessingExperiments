
boolean xRight, yDown;
int xPos, yPos;
float speed = 5.5;
float tricleX = 150;
float tricleY = 150;
float tricleXspeed = 5.5;
float tricleYspeed = 5.5;
PImage bg;


void setup() {
  size(700,700);
  noStroke();
  colorMode(HSB,360,100,100);
  bg = loadImage("wallpapers-hd-7986-8317-hd-wallpapers.jpg");

  xRight = true;
  yDown = true;

  xPos = width/2;
  yPos = height/2;
}

void draw() {
  background(bg);
  if (mousePressed) {
  tricleX = tricleX + tricleXspeed; 
  tricleY = tricleY + tricleYspeed; 
  if((tricleX > width) || (tricleX < 0)) {
  tricleXspeed = tricleXspeed * -1;
  }
  if((tricleY > height) || (tricleY < 0)) {
  tricleYspeed = tricleYspeed * -1;
  }  
  fill(0,244,255);
  ellipse(tricleX,tricleY,50,50);

  
  } else {
    if (xRight) xPos += speed;
  else xPos -= speed;

  if (xPos+60 >= width || xPos <= 0) xRight = !xRight;

  // Control down and up
  if (yDown) yPos += speed;
  else yPos -= speed;

  if (yPos >= height || yPos-52 <= 0) yDown = !yDown;
  fill(0,244,255);
  triangle(xPos, yPos);
}
 }

void triangle(int xLinks, int yLinks) {
  int xA = xLinks;
  int yA = yLinks;
  int xB = xA + 60;
  int yB = yA;
  int xC = xA + 30;
  int yC = yA - 52;
  triangle(xA, yA, xB, yB, xC, yC);
}


