
import java.util.*;

float sensitivity = 0.009;
int brushWidth = 150;
long idleTime = 30 * 1000; // 30 seconds idle
boolean fastRecover = true; // This means the app will just reload all the images again

String [] picNames = new String [] {
  "Map 1 1772.jpg.small.png",
    "Map 2 1814.jpg.small.png",
    "Map 3 1824.jpg.small.png",
    "Map 4 1830.jpg.small.png",
    "Map 5 1840.jpg.small.png",
    "Map 6 1860.jpg.small.png",
    "Map 7 1862-3.jpg.small.png"
};

PImage [] imgs;
long lastTouch;

void loadImages () {
  imgs = new PImage [] {
              loadImage (picNames [0]),
              loadImage (picNames [1]),
              loadImage (picNames [2]),
              loadImage (picNames [3]),
              loadImage (picNames [4]),
              loadImage (picNames [5]),
              loadImage (picNames [6])
            };

  for (int i = 0; i < imgs.length; i++) {
    if (imgs [i].format != ARGB) {
      println ("Image not in the right format!");
      PImage newImage = createImage (imgs [i].width, imgs [i].height, ARGB);
      newImage.copy (
          imgs [i],
          0,
          0,
          imgs [i].width,
          imgs [i].height,
          0,
          0,
          imgs [i].width,
          imgs [i].height
          );
      imgs [i] = newImage;
      i = 0;
    } else {
      println ("Image in the right format");
    }
  }
}

PImage brush;

void loadBrush () {
  brush = loadImage ("brush.png");
  brush.resize (brushWidth, 0);
  brush.loadPixels ();
}

void setup () {
  size (ceil ((float)displayWidth * 0.8), ceil ((float)displayHeight * 0.8), P2D);

  loadImages ();

  loadBrush ();

  lastTouch = millis ();
}

void setNotIdle () {
  lastTouch = millis ();
}

void mouseDragged () {
  setNotIdle ();
  int shiftX = brush.width / 2;
  int shiftY = brush.height / 2;

  int X = mouseX - shiftX;
  int Y = mouseY - shiftY;

  int pixelIndex;
  int oldPixel;

  float value;
  float compare;

  for (PImage i : imgs) {
    i.loadPixels ();
  }

  for (int brushY = 0; brushY  < brush.height; brushY++) {
    for (int brushX = 0; brushX < brush.width; brushX++) {
      value = sensitivity * alpha (brush.pixels [(brushY * brush.width) + brushX]);

      for (int i = 0; i < imgs.length && value > 0; i++) {
        // imgs [i].loadPixels (); // Again, we dont' need this. Damn processing..
        pixelIndex = (X + brushX) + (Y + brushY) * imgs [i].width;
        if (pixelIndex < 0 || pixelIndex > imgs [i].pixels.length) break;
        try {
        oldPixel = imgs [i].pixels [pixelIndex];
        } catch (Exception e) {
          println ("Exception!");
          e.printStackTrace ();
          return;
        }

        compare = alpha (oldPixel);

        if (compare > value) {
          imgs [i].pixels [pixelIndex] = color (red (oldPixel),
                                                green (oldPixel),
                                                blue (oldPixel),
                                                floor (compare - value)
                                                );
          break;
        } else {
          imgs [i].pixels [pixelIndex] = color (red (oldPixel),
                                                green (oldPixel),
                                                blue (oldPixel),
                                                0
                                                );

          value -= compare;
        }
      }
    }
  }

  for (PImage i : imgs) {
    i.updatePixels ();
  }
}

void handleIdle () {
  if (millis () - lastTouch > idleTime) {
    if (fastRecover) {
      loadImages ();
    } else {
    }
  }
}

void draw () {
  background (0);

  imageMode (CORNER);
  for (int i = imgs.length - 1; i >= 0; i--) {
    image (imgs [i], 0, 0);
  }

  handleIdle ();

 // THESE ARE USEFUL FOR DEBUGGING, enable when needed
 // Disable the above code in the case of debugging
 /*  int x = 0, y = 0;

  imageMode (CORNERS);
  textSize (20);
  textMode (CORNER);
  textAlign (LEFT);
  for (int i = 0; i < imgs.length; i++) {
    image (imgs [i], x, y, x + 200, y + 200);
    fill (0);
    text (i, x + 20, y + 20);
    x += 200;
    x += 10;

    if (x + 200 > width - 10) {
      y += 200;
      y += 20;
      x = 0;
    }
  }

  imageMode (CENTER);
  image (brush, mouseX, mouseY); */
  // END DEBUGGING SECTION
}

int scale;
int inc = 20;

void keyPressed () {
  /*
  println ("Key pressed");
  switch (key) {
    case '+':
      scale += inc;
      break;
    case '-':
      scale -= inc;
      break;
  }

  loadImages ();

  for (PImage i : imgs) {
    i.resize (scale, 0);
  } */
}


