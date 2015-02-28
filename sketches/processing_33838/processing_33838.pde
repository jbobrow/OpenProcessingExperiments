

int posx;
int posy;

void setup()

{
  size(450,450);
  PImage myImage = loadImage("24470020.jpg");
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

    posx=mouseX-(mouseX%20);
    posy=mouseY-(mouseY%20);
    rect(posx,posy,20,20);
  }
}



