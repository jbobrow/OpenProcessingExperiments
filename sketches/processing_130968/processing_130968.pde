
void setup() {
 //establish murky purple color
    background(10,0,10);
    size (500, 500);
//limit the framerate so the lines don't over spawn and clutter
    frameRate(12);
  }


void draw() {
  //create random values each calculation to move lines erraticly
  int ex1 = int(random(-50, 0));
  int ex2 = int(random(500, 550));
  int wy1 = int(random(400,550));
  int wy2 = int(random(-50, 0));
  //generates values based on various measurements of time since the program was opened
  int m = millis()/25;
  int n = millis()/75;
  int f = (millis()/1000)*4;
  //green line
  stroke(250 - m, 250, 250 - n, 100 - f);
  line( ex1, wy1, 500 + m, 300);
  //purple line
  stroke(250 - n, 250 - m, 250, 100);
  line( ex2, wy2, 500 - m , 400);
  
}

//creates a minimalistic representation of a sunset, after 30 or so seconds have passed.
  


