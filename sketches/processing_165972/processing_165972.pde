
// VARIABLE INITIALIZING

// canvas
int width = 1520;
int height = 440;
// drawing
int oldX = -1;
int oldY = -1;
int weightValue = 20;
int strokeSizeByKey = 5;
// colors
int R = 242;
int G = 7;
int B = 7;
int historyLength = 0;
int [] historyR = new int[0];
int [] historyG = new int[0];
int [] historyB = new int[0];
int [] historyX = new int[0];
int [] historyY = new int[0];






void setup() {
  size(width, height);
  smooth ();
  background(#ffffff);
}






void draw() {


  /////// fence blocking /////// 

  noStroke();
  fill(#000000);
  rect(220, 0, 1080, 80);
  rect(220, 200, 1080, 50);
  rect(220, 390, 1080, 50); 



  /////// color picking /////////


  // Changes to  a random color / changes size
  if (keyPressed) {
    if (keyCode == UP) {
      if (strokeSizeByKey < 50) {
        strokeSizeByKey += 1;
        println (strokeSizeByKey);
      }
    } else if (keyCode == DOWN) {
      if (strokeSizeByKey > 1) {
        strokeSizeByKey -= 1;
        println (strokeSizeByKey);
      }
    } else {
      R = int(random(0, 255));
      G = int(random(0, 255));
      B = int(random(0, 255));
    }
  }


  ///////  mouse drawing /////// 

  strokeWeight(strokeSizeByKey);
  stroke(R, G, B);
  if (mousePressed == true) {
    if (oldX == -1) {
      oldX = mouseX;
      oldY = mouseY;
    } else if (oldX != 0) {
      line(oldX, oldY, mouseX, mouseY);
      oldX = mouseX;
      oldY = mouseY;
    } else {
      oldX = mouseX;
      oldY = mouseY;
    }
  }
  if (mousePressed != true) {
    oldX = mouseX;
    oldY = mouseY;
  }

  // keyboard functions
  if (key == 'e') {
    R = 255;
    G = 255;
    B = 255;
  }




  //////// display current settings //////////
  
  fill(R,G,B);
  ellipse(500,25,strokeSizeByKey,strokeSizeByKey);
  fill(#ffffff);
  text("current size & color", 300, 25);
}









