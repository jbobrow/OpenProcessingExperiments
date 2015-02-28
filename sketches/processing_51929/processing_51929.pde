
PImage ast01,ast02,ast03,ast04,ast05,ast06,ast07,ast08,ast09,ast10;


  int i = 0;
  int j = 0;

void setup() {
   size(500,500);
   smooth();
   background(255);
}

void mouseReleased() {
  if(i == 4) {
    i= -1;
  }
  if(j == 4) {
    j = -1;
  }
  i++;
  j++;
}

void draw() {
  // Load all images
  ast01 = loadImage("AST_01.JPG");
  ast02 = loadImage("AST_02.JPG");
  ast03 = loadImage("AST_03.JPG");
  ast04 = loadImage("AST_04.JPG");
  ast05 = loadImage("AST_05.JPG");
  ast06 = loadImage("AST_06.JPG");
  ast07 = loadImage("AST_07.JPG");
  ast08 = loadImage("AST_08.JPG");
  ast09 = loadImage("AST_09.JPG");
  ast10 = loadImage("AST_10.JPG");
   
   // Create arrays
  PImage[] xphotos = new PImage[5];
  PImage[] yphotos = new PImage[5];
  xphotos[0] = ast01;
  yphotos[0] = ast02;
  xphotos[1] = ast05;
  yphotos[1] = ast06;
  xphotos[2] = ast08;
  yphotos[2] = ast07;
  xphotos[3] = ast03;
  yphotos[3] = ast10;
  xphotos[4] = ast04;
  yphotos[4] = ast09;
  
  pushMatrix();
  translate(width/2,height/2);
  if(mouseButton == LEFT) {
    rotate(radians(millis()/5.0));
  }
  if(mouseButton == RIGHT) {
    rotate(radians(millis()/50.0));
  }
  image(xphotos[i],0,0);
  image(yphotos[j],-200,-150);
  popMatrix();
}

