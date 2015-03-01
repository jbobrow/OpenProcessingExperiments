
PImage myImage;
PImage myImage2;
PFont myFont; //tools - create font


void setup () {
  size (900,675);
  myImage =loadImage("TheMoon.jpg");
  myImage2 =loadImage("Person.png");
  myFont = loadFont ("ComicSansMS-48.vlw");
}

void draw (){
  image (myImage,0,0);
  image (myImage2,mouseX,mouseY);
  textFont(myFont);
  text ("MOON PARTY", 50, 50);
  text ("2MORRO", 100, 100);
}



