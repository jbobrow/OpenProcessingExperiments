
//uses get() to grab random colors from an image and make a grid of them
//The background is always the abstracted colors until the mouse
//is pressed which reveals the original image
//modified code from examples


PImage bridge;

void setup() {
  size(300, 300);
  bridge = loadImage("bridge.jpg");
  noStroke();
  smooth();
  set(0, 0, bridge);
}

int cellSize =30;

void draw() {
}
void mousePressed() {
  //if (mousePressed==true) {
  //background(255);
  set(0, 0, bridge);
    for (int y=0; y <= width; y+=cellSize) {
      for (int x=0; x <= height; x+=cellSize) {

        int a = int(random(0, bridge.width));    // take a random x coordinate from the image
        int b = int(random(0, bridge.height));   // take a random y coordinate from the image

        color myColor = bridge.get(a, b);        // grab the color from myPic at (a,b)
        fill(myColor);                         // set fill to use this new color
        strokeWeight(3);
        stroke(255);
        rect(x,y, cellSize, cellSize);
        //noLoop();
      }
    }



  //background(bridge); //doesnt work.  set command needed instead
  // set(0, 0, bridge);
}


//else {
//background(bridge); //doesnt work.  set command needed instead
//set(0, 0, bridge);
//}




//noLoop(); //turn this on and the image doesn't come up for mousepressed
//how would I change the speed of the screen so that the rectangles still cycle through the random colors
// but doesnt make it hurt to look at?

//}


