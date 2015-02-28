
//Image of "For the Love of God" (Damien Hirst)

PImage img;                            //declare variables
color c;
float rectSize;
float maxSize1;
float maxSize2;

void setup() {                          //initialize
  size (500, 730);
  img = loadImage ("love.jpeg");       
  maxSize1 = 0;
  maxSize2 = 17;
  
}

void draw () {
  image(img, 0, 0);                    //load image


  for (int x = 0; x < width; x = x+6) {          
    for (int y = 0; y < height; y = y+6) {            //nested for loops to get color of every 6th pixel

      color c = get (x, y);
      float d = dist(mouseX, mouseY, x, y);              //get distance from mouse to pixel
      float newSize = map(d, 0, width*2, maxSize1, maxSize2);      //map value of d to rect sizes
      fill (c);
      noStroke();
      rectMode(CENTER);
      rect (x, y, newSize, newSize);                      //draw the rects
    }
  }
}


