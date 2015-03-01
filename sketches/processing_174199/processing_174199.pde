
int posx;
int posy;
 
void setup()
 
{
  size(600,500);
  PImage myImage = loadImage("cir.jpg");
  image(myImage, 0, 0,600,500);
  myImage.updatePixels();
}
 
void draw()
 
{
 
  loadPixels();
  color pixel = get(mouseX,mouseY);

  noStroke();
  fill(pixel);
 
  if(mousePressed == true) {
 
    posx=mouseX-(mouseX%20);
    posy=mouseY-(mouseY%20);
    ellipse(posx,posy,20,20);
  }
}




