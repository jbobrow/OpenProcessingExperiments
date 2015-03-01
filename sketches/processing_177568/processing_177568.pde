
//working with images in processing
//Declare a PImage variable type
PImage rythme;
//load an image file from HDD to my setup code
/*Not forget to add the file to my sketch data folder*/
void setup(){
  size(1280,720);
  rythme=loadImage("rythme.jpg");
}
//Draw the image to the screen at (0,0)
void draw(){
  image(rythme, 0, 0);
}

