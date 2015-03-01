
void setup() {
  size(150, 150);
  frameRate(20);
  loadPixels();
  int counter = -1;
  for (int i = 0; i <= (height - 3)*(width) + width - 3; i+= 3) {
    if (counter != i/(3*width)) {
      if (random(1) < 0.1) {
        pixels[i] = color(153, 0, 153);
        pixels[i + 1] = color(153, 0, 153);
        pixels[i + 2] = color(153, 0, 153);
        pixels[i + width] = color(153, 0, 153);
        pixels[i + width + 1] = color(153, 0, 153);
        pixels[i + width + 2] = color(153, 0, 153);
        pixels[i + 2*width] = color(153, 0, 153);
        pixels[i + 2*width + 1] = color(153, 0, 153);
        pixels[i + 2*width + 2] = color(153, 0, 153);
      }
    }
    else if ((i + 1) % (3*width) == 0) {
      counter++;
    }
  }
  updatePixels();
}

void mouseDragged() {
  loadPixels();
  if(mouseX >= 0 && mouseY >= 0 && mouseX < width && mouseY < width && mouseX % 3 == 0 && mouseY % 3 == 0) {
        pixels[mouseY*width + mouseX] = color(153, 0, 153);
        pixels[mouseY*width + mouseX + 1] = color(153, 0, 153);
        pixels[mouseY*width + mouseX + 2] = color(153, 0, 153);
        pixels[mouseY*width + mouseX + width] = color(153, 0, 153);
        pixels[mouseY*width + mouseX + width + 1] = color(153, 0, 153);
        pixels[mouseY*width + mouseX + width + 2] = color(153, 0, 153);
        pixels[mouseY*width + mouseX + 2*width] = color(153, 0, 153);
        pixels[mouseY*width + mouseX + 2*width + 1] = color(153, 0, 153);
        pixels[mouseY*width + mouseX + 2*width + 2] = color(153, 0, 153);
  }
  updatePixels();
}

void draw() {
  loadPixels();  
  int counter = -1;
  for (int i = 0; i < width*(height - 3) + width - 3; i+= 3) {
    if (counter != i/(3*width)) {
      if (numberOfNeighbors(i) == 2 && pixels[i] == color(153, 0, 153)) {
      }
      else if (numberOfNeighbors(i) < 2 || numberOfNeighbors(i) > 3) {
        pixels[i] = color(255, 128, 0);
        pixels[i + 1] = color(255, 128, 0);
        pixels[i + 2] = color(255, 128, 0);
        pixels[i + width] = color(255, 128, 0);
        pixels[i + width + 1] = color(255, 128, 0);
        pixels[i + width + 2] = color(255, 128, 0);
        pixels[i + 2*width] = color(255, 128, 0);
        pixels[i + 2*width + 1] = color(255, 128, 0);
        pixels[i + 2*width + 2] = color(255, 128, 0);
      }
      else if(numberOfNeighbors(i) == 3)  {
        pixels[i] = color(153, 0, 153);
        pixels[i + 1] = color(153, 0, 153);
        pixels[i + 2] = color(153, 0, 153);
        pixels[i + width] = color(153, 0, 153);
        pixels[i + width + 1] = color(153, 0, 153);
        pixels[i + width + 2] = color(153, 0, 153);
        pixels[i + 2*width] = color(153, 0, 153);
        pixels[i + 2*width + 1] = color(153, 0, 153);
        pixels[i + 2*width + 2] = color(153, 0, 153);
      }
    }
    else if ((i + 1) % (3*width) == 0) {
      counter++;
    }
  }
  updatePixels();
}

int numberOfNeighbors(int index) {
  int row = index/width;
  int col = index % width;
  int count = 0;
  for (int i = row - 3; i <= row + 3; i+= 3) {
    for (int j = col - 3; j <= col + 3; j+= 3) {
      if ((i == row && j == col) == false && i >= 0 && j >= 0 && i < width && j < height && pixels[i*width + j] == color(153, 0, 153)) {
        count++;
      }
    }
  }
  return count;
}



