
PImage img;
void setup() {
  size(1024, 768);
  img=loadImage("http://www.hoffmanah.com/clients/8642/images/Ginger_Domestic_Kitten_rolling_on_its_back.png");
}

void draw() {
background(255);
  image(img, mouseX-225, mouseY-80);
  }
