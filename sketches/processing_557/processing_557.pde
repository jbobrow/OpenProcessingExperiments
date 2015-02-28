
int xBlocks = 6;
int yBlocks = 3;
int blockSize = 120;
int gap = 15;

color highlight;
byte frameNumber = 0;

void setup () {
  //int theWidth = (xBlocks * blockSize) + ((xBlocks+1) * gap);
  //int theHeight = (yBlocks * blockSize) + ((yBlocks+1) * gap);
  //size(theWidth, theHeight);
  //println(str(width) + " " + str(height));
  
  // Hard-coded size for applet
  size(825, 420);
  
  highlight = color(random(220,255), 10,25);
  colorMode(HSB, 360, 100,100);
  noStroke();
}

void draw() {
  colorMode(HSB, 360, 100,100);  // applet seems to require it sometimes
  noStroke();                    // ditto
  
  if (frameNumber % 20 == 0) {
    background(360,0,100);       // Odd, I know!

    for (int i = 0; i < xBlocks; i++) {
      for (int j = 0; j < yBlocks; j++) {

        fill( color(random(0,360), random(90,100), 90, 80));
                
        int x = gap + (gap * i) + (blockSize * i);
        int y = gap + (gap * j) + (blockSize * j);
        
        // highlight check
        if (mouseX >= x && mouseX <= x+blockSize) {
          if (mouseY >= y && mouseY <= y+blockSize) {
            fill(highlight);
          }
        }

        rect(x,y,blockSize, blockSize); 
      }
    }

  }
  frameNumber++;
}

void mouseMoved() {
  for (int i = gap; i < width; i+=(gap+blockSize)) {
    for (int j = gap; j < height; j+=(gap + blockSize)) {

      if (mouseX >= i && mouseX <= i+blockSize) {
        if (mouseY >= j && mouseY <= j+blockSize) {
          fill(highlight);
          rect(i,j,blockSize, blockSize); 
        }
      } 
    }
  }
}

void mousePressed(){
  //saveFrame();
}

