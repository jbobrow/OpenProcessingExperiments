
PImage[] images = new PImage[3]; // Supposing we have 5 images
PImage img04;
float MIN_VALUE; // The lowest value we can get (here: 0)
float MAX_VALUE; // The highest value we can get
 
void setup()
{
  size(230, 230);
 
  MAX_VALUE = width * PI; // Adjust to your real data
  for (int i = 0; i < images.length; i++)
  {
    images[i] = loadImage("img" + nf(i+1, 2) + ".png"); // nf() allows to generate 01, 02, etc.
  }
}
 
void draw()
{
  background(255);
 
  float someValue = mouseY * PI; // Can be coming from a file, serial port, Internet, etc.
  int imageIndex = int(map(someValue, 0, MAX_VALUE, 0, images.length));
 
  fill(#005599);
  String msg = nf(someValue, 1, 3) + " -> " + imageIndex; // Here nf() limits the number of decimal digits
  
  image(images[imageIndex], 0, 0);
  
  if (mousePressed==true) {
img04 = loadImage("img04.png");
image(img04, 0, 0);
}}





