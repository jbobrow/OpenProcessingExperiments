
int width = 400;
int height = 400;

ImageObject imageObject;

void setup() {
  size(400, 400, P3D);
  noFill();
  stroke(255);
  
  imageObject = new ImageObject(width,height);
}

void draw() {
  background(0);
  imageObject.mouseActions();
  imageObject.move();
  imageObject.render();
}

class ImageObject {
  
  PImage img;
  int[][] imgPixels;
  float transX, transY, transZ = 0; 
  float rotateX, rotateZ = 0;
  int resolution = 5;
  
  int width = 400;
  int height = 400;

  ImageObject(int width, int height) {
    this.width = width;
    this.height = height;
    
    img = loadImage("girl.jpg");
    imgPixels = new int[img.width][img.height];
    for (int x = 0; x < img.width; x++) {
      for (int y = 0; y < img.height; y++) {
        imgPixels[x][y] = img.get(x, y);
      }
    }
  } 
 
  void render() {
    for (int x = 0; x < img.width; x += resolution) {
      for (int y = 0; y < img.height; y += resolution) {
        float rr = red(imgPixels[x][y]); 
        float gg = green(imgPixels[x][y]);
        float bb = blue(imgPixels[x][y]);
        float tt = rr+gg+bb;
        stroke(rr, gg, gg);
        line(x, y, tt/10-20, x, y, tt/10);
        line(x-1, y, tt/10-20, x, y, tt/10);
        line(x+1, y, tt/10-20, x, y, tt/10);
        line(x, y-1, tt/10-20, x, y, tt/10);
        line(x, y+1, tt/10-20, x, y, tt/10);
      }
    }
  }
  
  void move() {
    transZ = constrain(transZ, -100, 150);
    rotateX = constrain(rotateX, -50, 50);
    rotateZ = constrain(rotateZ, -50, 50);
    
    translate(transX, transY, transZ);
    rotateX(radians(rotateX));
    rotateZ(radians(rotateZ)); 
  }
  
  void mouseActions() {
  
    transX += (mouseX+40 - (width/2) - transX) / 30; // +40 extra offset
    transY += (mouseY+20 - (height/2) - transY) / 30; // +20 extra offset
  
    float rotationSpeed = 0.1;
  
    if(mousePressed) { 
      if(mouseX < 0.3 * width) {
        rotateZ -= rotationSpeed;
      }
      if(mouseX > 0.7 * width) {
        rotateZ += rotationSpeed;
      }
      if(mouseY < 0.3 * height) {
        rotateX += rotationSpeed;
      }
      if(mouseY > 0.7 * height) {
        rotateX -= rotationSpeed;
      }
      if(mouseX > 0.3 * width && mouseX < 0.7 * width &&
        mouseY > 0.3 * height && mouseY < 0.7 * height) {
         transZ += 0.3;
      }
    } else {
      transZ -= 0.2;
    }
  }
  
}

