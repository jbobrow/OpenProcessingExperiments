
PImage img;

void setup(){
  size (610,610);
  img = loadImage("image0063.jpg");


}



void draw(){
  background(255);
  /* we are creating a colour variable called myPixel and then assigning the value of the 
  get () method to it.  The get method is getting the value of the pixel at the 
  x (48) and y (40) position
  */

  color myPixel = img.get(48,40);
  // we are now filling the rectangle with the value of myPixel
  fill (myPixel);
  rect (50,50,50,50);
  // this time we are going to grab a range of pixels in this case 20 pixels wide and 20 pixels high.  
  // We then create a variable of Datatype PImage and store the range of pixels in it.  
   PImage pixelSize = img.get(10,10,100,100);
  // finally we use the image method to draw our pixels stored in the pixelSize variable back to the screen
  // at x (0) and y(0)
   image (pixelSize, 0,0);


}


