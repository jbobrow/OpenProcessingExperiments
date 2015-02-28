
PImage monet;                                                          //create space in memory for the image insert through PImage coding

void setup() {
  monet = loadImage ("Impressionist Sunrise.jpg");                     //place the image found in the sketch folder into the space found in memory
  size(900, 600);                 //match the size of the canvas to that of the painting
  colorMode(RGB, 255);
  background(255);
}

int count = 0;                                                         //this count and number combination will determine how many lines will be draw in the gridded line output formatted below
int num = 1;

void draw() {
  //monet.loadPixels();                                                  //loads the pixels of the painting so that they may be accessed
  //image(monet,0,0);                                                    //draws the Monet painting in the background
  //noStroke();                                                          
  //fill(255,99);
  //rect(0,0,width,height);
  //rect(0,0,width,height);
  for (int i = 0; i < monet.width; i++) {                               //first for loop here is created to decode and access the one dimensional matrix of pixels
    for (int j = 0; j < monet.height; j++) {

      if (count < num) {                                                //creating a grid to draw in from. In this case, the size of each grid block is 5 pixels x 5 pixels
        for (int x = 0; x < width; x+=100) {
          for (int y = 0; y < height; y+=100) {
            int loc = x + y*width;                                     //determine the location of any pixels based on this equation. Breaking down the matrix. Later a randomization is added to select a color from the Monet painting
            int locRand = (x + floor(random(90))) + (y + floor(random(90)))*width;        //determining pixel location within the grid ( each grid box gets its own pixel )
            float r = red(monet.pixels[locRand]);                      //selects the red value from the RGB color of the pixel found at locRand (a randomly selected pixel within the image pixel matrix)
            float g = green(monet.pixels[locRand]);                    //selects the green value from the RGB color of the pixel found at locRand (a randomly selected pixel within the image pixel matrix)
            float b = blue(monet.pixels[locRand]);                     //selects the blue value from the RGB color of the pixel found at locRand (a randomly selected pixel within the image pixel matrix)
            float sat = (saturation(monet.pixels[locRand])/25.5);      //drawing the saturation from pixel
            float bright = (brightness(monet.pixels[locRand])/25.5);   //drawing brightness from pixel
            float threshold = 6;                                       //threshold of brightness set
            if (sat == 0) {                                            //prevent saturation from being zero
              sat = .25;
            }
            if (bright < 0) {                                          //prevent brightness from being zero
              bright = 0;
            }
            pushMatrix();
            scale(2.0);                                              //potential to scale the drawing to see the lines and colors in more detail
            translate(-(3*width)/5, -height/3);
            if (random(0, 100) < 60) {                                   //probability determining the amount of pixel analysis frames drawn
              if (bright > threshold) {                                 //IF A PIXEL HAS A BRIGHTNESS OVER THE THRESHOLD, THEN IT IS DRAWN AS A VERTICAL GRAIN AND ITS FRAME IS ACCENTUATED
                //int z = floor(random(0,4));
                verticalGrain(x, y, 2, sat, r, g, b);                        //VERTICAL GRAIN DOTTED LINES DRAWN. SPACING BETWEEN LINES DETERMINED BY THE SATURATION OF THE PIXEL SELECTED
              }
              else {
                //int z = floor(random(0,4));
                horizontalGrain(x, y, 2, sat, r, g, b);                      //HORIZONTAL GRAIN DOTTED LINES DRAWN. SPACING BETWEENLINES HORIZONTALLY DETERMINED BY SATURATION
              }
            }
            popMatrix();
          }
        }
      }
      count++;
    }
  }
  if (count>num) {
    println("Complete");
    noLoop();
  }
}



void verticalGrain(int a, int b, int c, float d, float e, float f, float g) {
  pushMatrix();
  translate(5, 5);
  stroke(0);
  strokeWeight(1);
  fill(0);
  rect(a+2, b+2, 90, 90);
  strokeWeight(.5);
  fill(255);
  rect(a, b, 90, 90);
  for (float hSat = d; hSat < 90; hSat+=d) {
    for (int vSat = c; vSat < 90; vSat+=c) {
      stroke(e, f, g);
      strokeWeight(1);
      point(a+hSat, b+vSat);
    }
  }
  popMatrix();
}





void horizontalGrain(int a, int b, int c, float d, float e, float f, float g) {
  pushMatrix();
  translate(5, 5);
  stroke(0);
  fill(255);
  strokeWeight(.5);
  rect(a, b, 90, 90);
  for (int hSat = c; hSat < 90; hSat+=c) {
    for (float vSat = d; vSat < 90; vSat+=d) {
      stroke(e, f, g);
      strokeWeight(1);
      point(a+hSat, b+vSat);
    }
  }
  popMatrix();
}



