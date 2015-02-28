
Square[] squares;        //New list of squares
int pixelsize = 40;      //Square size

void setup() {
  frameRate(10);
  size(400, 400);
  squares = new Square[width/pixelsize];   //number of squares in the list needed to fill a horizontal row
  for (int i = 0; i<squares.length;i++) {  //create squares in the list
    squares[i] = new Square(i, pixelsize);
  }
  background(255);
}



void draw() {
  //drawz squarez
  for (int i = 0; i<squares.length;i++) {
    squares[i].update();
    squares[i].display();
  }
}

class Square {
  //declare them all
  float x; 
  float y; 
  color c;
  float cycleR;
  float cycleG;
  float pixelsize;
  float i;
  boolean isLost;

  //constructor
  Square(float theI, float thePixelsize) {
    i=theI;
    pixelsize=thePixelsize;
    resetPixel(); //set position
  }
  
  //update the pixel
  void update() {
    if (checkLost()) {
      resetPixel();
    }
    changeColor();
    movePixel();
    keepDrawing();
  }
  
  //display the pixel
  void display() {
    noStroke();
    fill(c);
    rect(x, y, this.pixelsize, this.pixelsize);
  }

  //move the pixel
  void movePixel() {
    x  = x + int(random(-2, 2))*this.pixelsize;
    y = y + int(random(-2, 2))*this.pixelsize;
  }

  //is the pixel outside the frame? 
  boolean checkLost() {
    if (this.x < 0-this.pixelsize || this.x > width+this.pixelsize) {
      return true;
    }
    else if (this.y < 0-this.pixelsize || this.y > height+this.pixelsize) {
      return true;
    }
    else {
      return false;
    }
  }
  
  //change the color of the pixel in relation to position
  void changeColor() {
    cycleR = map(sin(radians(this.x)), -1, 1, 0, 255);
    cycleG = map(sin(radians(this.y)), -1, 1, 0, 255);
    c = color(cycleR, cycleG, 200);
  } 
  
  //reset location of pixel (if it goes outside the frame)
  void resetPixel() {
    this.x = height/2;
    this.y = height/2;
  }
  
  //keep drawing until all pixels are not white. 
  void keepDrawing() {
    loadPixels();
    for (int i = 0; i < (width*height); i++) {
      if (pixels[i] == color(255)) {
        return;
      }
    }
    noLoop();
  }
  
  
}



