
//Random Figures

void setup() {
  size (500, 500);

  //modify the following number to increase or decrease movement of rectangles to final composition.
  frameRate(12);
}
//The higher the float count, the more opportunites for a finished random composition.
float count = 30;
float rect;
float rectMode;

void draw() {

  //the following figures can be found in my previous Processing exercise.
  if (count > 0) {
    rectMode = random(50);
    if (rectMode > 25) {
      rectMode(RADIUS);
      fill(0, 50, 100);//blue figure
      rect(150, 160, 140, 130);
      fill(255, 204, 0);//yellow figure
      rect(10, 10, 100, 100);
    }
    else {
      background(100);
      fill(255, 204, 0); //yellow figure
      rect(10, 10, 100, 150); 
      fill(0, 50, 100); //blue figure
      rect(10, 160, 280, 130);
      fill(29, 203, 39);//green figure
      rect(10, 160, 100, 130);
    }

    // draw random rectangles
    rectMode(CENTER);
    //To set a consistent size within parameters.  Presently rectangles present as a random width between 30 and 90.  If one were to change (30, 90) to (30, 30), there would occur no variation in width. 
    rect = random(30, 90);
    rect(random(width), random(height), rect, rect+100);
    count--;
  }

  rectMode = random(width);
}



