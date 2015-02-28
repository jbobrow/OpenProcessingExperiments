
PImage img;
color backgroundColor = #FFFFFF;
color drawColor = #FF0000;
color pixelColor = 0;
float lastMouseX;
float lastMouseY;
int brushSize = 1;


void setup() {
  size(800, 600);
  img = createImage(width, height, RGB);

  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    img.pixels[i] = backgroundColor;
  }
  img.updatePixels();
}

void draw() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    if (mousePressed) {
      if (mouseButton == LEFT) {
        img.loadPixels();
        img.pixels[mouseY*width+mouseX] = drawColor;
      }
    }
    Gravity();

    lastMouseX = mouseX;
    lastMouseY = mouseY;
    //must come last in draw();
    DrawImage();
  }
}

void DrawImage() {
  img.updatePixels();
  image(img, 0, 0);
}

void Gravity() { 
  for (int i = img.pixels.length - width; i > 0; i--) {
    if (img.pixels[i] != backgroundColor) {
      pixelColor = img.pixels[i];
      img.pixels[i + img.width] = pixelColor;
      img.pixels[i] = backgroundColor;
    }
  }

  /*
  for (int i = img.pixels.length - width; i > 0; i--) {
   if (img.pixels[i + img.width] == backgroundColor) {
   img.pixels[i] = backgroundColor;
   }
   else {
   img.pixels[i] = pixelColor;
   }
   }
   
   */
}

void keyPressed() {
  if (key == '[' && brushSize > 1) {
    brushSize--;
  }
  else if (key == ']') {
    brushSize++;
  }
}




