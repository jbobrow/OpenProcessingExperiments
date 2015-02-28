
int[] x; // x coordinate
int[] y; // y coordinate
boolean isOn = false;
int[] backgroundColour = {
  255, 255, 255};

public final int SIZE = 10;

void setup () {
  size (800, 600);
  background (255);
  smooth();
  strokeWeight (5);
  frameRate (60);
  x = new int[SIZE];
  y = new int[SIZE];
  //backgroundColour = new int[3];
  //backgroundColour = {255, 255, 255};
  isOn = false;
}

void draw () {
  //println (mouseX + ", " + mouseY);
  background (backgroundColour[0], backgroundColour[1], backgroundColour[2]);
  for (int i = 0; i < x.length-1; i++) {
    x[i] = x[i+1];
    y[i] = y[i+1];
  }
  x[x.length - 1] = mouseX;
  y[y.length - 1] = mouseY;
  if (x.length == SIZE && isOn == false) {
    for (int i=0; i<SIZE; i++) {
      fill (167, 97, 25, i*25+5);
      stroke(0, i*25+5);
      beginShape ();
      // general shape, body and ears
      ellipse (x[i], y[i], 200, 250);
      ellipse (322 - 400 + x[i], 189 - 300 + y[i], 40, 40);
      ellipse (478 - 400 + x[i], 189 - 300 + y[i], 40, 40);
      // 'snout'
      fill (255, 251, 138, i*25+5);
      arc (400 - 400 + x[i], 264 - 300 + y[i], 70, 60, PI, TWO_PI);
      arc (400 - 400 + x[i], 291 - 300 + y[i], 70, 80, 0, PI);
      // eyes and nose
      fill (0, i*25+5);
      ellipse (335 - 400 + x[i], 242 - 300 + y[i], 20, 20);
      ellipse (457 - 400 + x[i], 242 - 300 + y[i], 20, 20);
      ellipse (400 - 400 + x[i], 249 - 300 + y[i], 20, 10);

      // teeth and mouth
      fill (255, i*25+5);
      quad(305 - 400 + x[i], 264 - 300 + y[i], 
      300 - 400 + x[i], 291 - 300 + y[i], 
      500 - 400 + x[i], 291 - 300 + y[i], 
      496 - 400 + x[i], 264 - 300 + y[i]);
      arc (325 - 400 + x[i], 264 - 300 + y[i], 30, 54, 0, PI);
      arc (355 - 400 + x[i], 264 - 300 + y[i], 30, 54, 0, PI);
      arc (385 - 400 + x[i], 264 - 300 + y[i], 30, 54, 0, PI);
      arc (415 - 400 + x[i], 264 - 300 + y[i], 30, 54, 0, PI);
      arc (445 - 400 + x[i], 264 - 300 + y[i], 30, 54, 0, PI);
      arc (475 - 400 + x[i], 264 - 300 + y[i], 30, 54, 0, PI);
      line (305 - 400 + x[i], 264 - 300 + y[i], 
      496 - 400 + x[i], 264 - 300 + y[i]);
      line (300 - 400 + x[i], 291 - 300 + y[i], 
      500 - 400 + x[i], 291 - 300 + y[i]);

      //arms
      line (300 - 400 + x[i], 311 - 300 + y[i], 
      281, 347);
      line (500 - 400 + x[i], 311 - 300 + y[i], 
      516, 346);
      // right fingers
      line (281 , 347 , 
      262 , 349 );
      line (281 , 347 , 
      289, 363 );
      line (281, 347, 273, 362);
      // left fingers
      line (516 , 346 , 
      534, 348 );
      line (516 , 346 , 
      509, 365 );
      line (516, 346, 526, 364);
      // right leg
      line (370 - 400 + x[i], 419 - 300 + y[i], 
      370 , 462 );
      line (370 , 462 , 
      348 , 462 );
      // left leg
      line (430 - 400 + x[i], 419 - 300 + y[i], 
      430 , 462 );
      line (430 , 462 , 
      453 , 462 );
      endShape (CLOSE);
    }
  } 
  else if (x.length == SIZE && isOn == true) {
    for (int i = 0; i < SIZE; i++) {
      fill (0, i*25+5);
      ellipse (x[i], y[i], 200, 250); //main body
      strokeWeight(random(2));
      if ((int)random(2) == 1) { // then draw random circles
        ellipse (x[i] + random (500) - 250, y[i] + random(500) - 250, SIZE, SIZE);
      }
      strokeWeight(5);
      ellipse (322 - 400 + x[i], 189 - 300 + y[i], 40, 40);
      ellipse (478 - 400 + x[i], 189 - 300 + y[i], 40, 40);
    }
  }
}

void keyPressed () {
  backgroundColour[0] = int (random(255));
  backgroundColour[1] = int (random(255));
  backgroundColour[2] = int (random(255));
}

void mousePressed () {
  isOn = !isOn;
}



