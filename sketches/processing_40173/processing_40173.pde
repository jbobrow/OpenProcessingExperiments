
// Allison Etheredge
// Lab 6.2 
// 2 October 2011


int num = 10; // sets the size of the ellipse for img2 "else" statement
PImage img; 
PImage img2; 


void setup() { 
  size(300, 300); 
  img = loadImage("bike.jpg"); // can change images by adding a new file in sketch
  img2 = loadImage("sunset.jpg"); // can change images by adding a new file in sketch
  noStroke(); 
  smooth();
  frameRate(100); // sets the frameRate for the circles in img2, sunset
  background(50); // sets the initial background
} 


int cell = 8; // sets the pixel size of the 


void draw() {

  // creates a neat effect on an image using dotFilter
  // if mousePressed shows an example of dotFilter 
  // from class with img set to the background

  if (mousePressed) { 
    background(img); 
    for (int x = cell; x <= width; x += cell) { 
      for (int y = cell; y <= height; y += cell) { 

        // white dot size is pulled from the amount of white in the image
        fill(255);
        float radius = cell*(brightness(img.pixels[x + (y*width)]) / 255);
        ellipse (x, y, radius, radius);
      }
    }
  }


  else { 

    // creates an image with a 'painted' feel of a sunset
    // circle pulls the colors from the sunset to fill the screen
    // as the screen fills, the sunset becomes visible (img2)

    int x = int (random(img2.width)); 
    int y = int (random(img2.height)); 
    int Pixels = x + y*img2.width; 
    loadPixels(); 
    float r = red(img2.pixels[Pixels]); 
    float g = green(img2.pixels[Pixels]); 
    float b = blue(img2.pixels[Pixels]); 

    noStroke(); 
    fill(r, g, b); // pulls RGB colors from image - description set above 
    ellipse(x, y, num, num); // variables set above
  }
}


// important so that the image when pressed changes back
// to the original background color when released

void mouseReleased() { 
  background(50); // set to original background color - as set in "void setup"
}


// Notes: 
// this code uses two of my personal photos: bike and sunset
// the image automatically loads the sunset upon pressing play
// when the mouse is Pressed, the image shows a bike, an object of serenity
// when the mouse is Released, the code recreates the sunset

// interesting play on the pause of an object and the creation of a scene


