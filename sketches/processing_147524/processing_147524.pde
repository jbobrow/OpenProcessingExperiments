
int posicionX;
int posicionY;
 
void setup()
 
{
  size(750,640);
  PImage myImage = loadImage("cecilcecil.jpg");
  image(myImage, 0, 0);
  myImage.updatePixels();
}
 
void draw()
 
{
 
  loadPixels();
  color pixel = get(mouseX,mouseY);
  //pixels[i]= pixel;
  noStroke();
  fill(pixel);
 
  if(mousePressed == true) {
 
    posicionX=mouseX-(mouseX%10);
    posicionY=mouseY-(mouseY%10);
    rect(posicionX,posicionY,10,10);
  }
}



