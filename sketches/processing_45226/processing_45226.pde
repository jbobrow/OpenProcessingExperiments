
PImage myImage;

void setup() {
  size(1000, 1000);
  myImage = loadImage("butterfly-wing2-m.jpg");
    }
    
    void draw() {
      tint(255, 255, 255, 150);
      image(myImage, mouseX, mouseY, 100, 100);
      
    }


