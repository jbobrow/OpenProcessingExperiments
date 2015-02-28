
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/41173*@* */
// animated image processing from a still image

PImage img1, img2;

void setup()
{ size(800, 600);
  background(255);
  smooth();
  noStroke();
  img1 = loadImage("oasis1.jpg");
  img2 = loadImage("oasis2.jpg");
}

int x,y = 0;

void draw()
{ blend(0, 0, width, height, -1, 0, width+2, height, BLEND);  
//  blend(0, 0, width, height, -2, -2, width+3, height+2, BLEND); 

  // Draw a bunch of little circles
  for (int y = 0; y < height; y++) 
  {
    // Select a random location
    x = round(random(width-1));

    // use pixel color at x,y position
    if ((frameCount / 150) % 2 == 0)
         fill (img1.pixels[y*img1.width+x]);
    else fill (img2.pixels[y*img2.width+x]);

    // Draw a randomly rotated,scaled equilateral triangle at this position
    pushMatrix();
    translate(x, y);
    ellipse(0, 0, 6, 6);
    popMatrix();
  }
}


