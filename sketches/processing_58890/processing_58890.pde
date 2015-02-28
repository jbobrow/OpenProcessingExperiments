
PImage myImage;
int pointX = 0;
int x;
 
void setup() {
  size(1343, 350);
  background(200);
  myImage = loadImage( "optimized.jpg" ); 
}
 
void draw() {
   
  int imageWidth = myImage.width;
   
  if (mouseX > 525) {
    pointX = pointX + ((mouseX-375)/50);
  }
   
  if (mouseX < 475) {
    pointX = ((mouseX-425)/50) + pointX;
  }
  
   
  for (int x = 1; x < 5; x++) {
    image(myImage, -pointX, 0);
    image(myImage, -pointX - (x*imageWidth), 0);
    image(myImage, -pointX + (x*imageWidth), 0);
  }
   
}


