
PImage myImage;
int pointX = 0;
int x;
 
void setup() {
  frameRate(8);
  size(350,1000);
  background(200);
  myImage = loadImage( "MarjorieWigton1.jpg" ); // load the image data
}
 
void draw() {
   
  int imageWidth = myImage.width;
   
  if (mouseX > 275) {
    pointX = pointX + ((mouseX-225)/50);
  }
   
  if (mouseX < 275) {
    pointX = ((mouseX-225)/50) + pointX;
  }
   
  //println(pointX);
   
  for (int x = 1; x < 5; x++) {
    image(myImage, -pointX, 0); // make an image and load it to the screen
    image(myImage, -pointX - (x*imageWidth), 0);
    image(myImage, -pointX + (x*imageWidth), 0);
  }
   
}


void mousePressed() {
  PImage img;
  img = loadImage("MarjorieWigton3.jpg");
  image(img,0, 0);}

