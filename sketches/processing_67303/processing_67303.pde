
int WIDTH_SCR = 800;
int HEIGHT_SCR = 600;

//Sketch vars
  PImage img;
  float direction = .9;

  float signal;

  PGraphics p = createGraphics(800, 600, JAVA2D);  // 2D content preferred

  void setup() {
    size(WIDTH_SCR, HEIGHT_SCR);
    smooth();
    stroke(255);
    background(255);

    img = loadImage("a.jpeg");
    img.resize(WIDTH_SCR,HEIGHT_SCR);
    println(img.pixels.length);
    img.loadPixels();
  }

  void draw() {
   
    if ( frameCount%1 == 0 && keyPressed == false) {

      signal += (.3*direction);  //keep increment < 2
     if (signal > HEIGHT_SCR-2 || signal < 0) { //give plenty of room
            direction = direction * -.9;
          }
      int signalOffset = int(signal)*WIDTH_SCR;
      //println(signalOffset);

      color[] currentPixels = new color[WIDTH_SCR*HEIGHT_SCR];

      println(signalOffset);
      for (int y = 0; y < HEIGHT_SCR-1; y++) {
        int strip = floor(random(WIDTH_SCR));
        int dest = floor( (y)*WIDTH_SCR + strip );
        //println(y);
        arrayCopy(img.pixels, signalOffset, currentPixels, dest, WIDTH_SCR-(strip+1) );
      }
      PImage currentImage = new PImage(WIDTH_SCR,HEIGHT_SCR);
      currentImage.pixels = currentPixels;
      currentImage.updatePixels();
      image(currentImage,0,0);

    }


  }



