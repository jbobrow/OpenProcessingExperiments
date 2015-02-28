
PImage pic;
Boolean drawpic;

void setup() {
  size (300, 300);
  noStroke();
  smooth();
  drawpic = false;                    //used a boolean command to set up the
  pic = loadImage("Flowers.png");     //switch to change between the two states
}                                     //of the sketch.

int gridSize = 1;
int pixelSize = 10;


void draw() {                                  //this sets up the grid of rectangles
  for (int x = 0; x < width; x+=pixelSize) {   //that appears to pixelate the picture.
    for (int y = 0; y < width; y+=pixelSize) {
      color myGridColor = color(pic.pixels[x + (y * height)]);
      fill(myGridColor);
      rect (x, y, 10, 10);
    }
  }
  if (drawpic) {
    background(pic);
  }
}

void keyPressed() {        //the key commands determine whether the actual
  if (key == '1') {        //picture is showing or the pixelated image. press
    drawpic = true;        //"1" for the real image and "2" for the pixelated 
  }                        //image. 
  else {
    drawpic = false;
  }
  if (key == '2') {
    drawpic = false;
  }
}

//I also tried to set up commands that incorporated "3" and "4" that would
//invert the color of the original image and then show the inverted pixelated 
//image. However, something was wrong with the ordering of commands or something
//and it would only flash the inverted image then get covered up by the pixelated
//image, so I omitted those two commands for now.  


