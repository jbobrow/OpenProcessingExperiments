


void setup() {
  size (800,800);
  frameRate(1);
}

void draw() {

  //current time values
  int mySecond = second();
  int myHour = hour();


  //AM-PM
  if (myHour < 12) {
    background (85, 188, 21);
    float bright = random(0,255);
  }
  else { 
    background (229, 25, 66);
    float bright = random(0,255);
  }

  //seconds visualized
  noStroke();
  fill(75, 120);
  if (mySecond < 60) {
    bezier (random(-800, 800), random(-800, 800), random(-800, 800), random(-800, 800), random(-800, 800), random(-800, 800), random(-800, 800), random(-800, 800));
    if (mySecond < 55) {
      bezier (random(-700, 700), random(-700, 700), random(-700, 700), random(-700, 700), random(-700, 700), random(-700, 700), random(-700, 700), random(-700, 700));
      if (mySecond < 50) {
        bezier (random(-600, 600), random(-600, 600), random(-600, 600), random(-600, 600), random(-600, 600), random(-600, 600), random(-600, 600), random(-600, 600));
        if (mySecond < 45) {
          bezier (random(-500, 500), random(-500, 500), random(-500, 500), random(-500, 500), random(-500, 500), random(-500, 500), random(-500, 500), random(-500, 500));
          if (mySecond < 40) {
            bezier (random(-400, 400), random(-400, 400), random(-400, 400), random(-400, 400), random(-400, 400), random(-400, 400), random(-400, 400), random(-400, 400));
            if (mySecond < 30) {
              bezier (random(-300, 300), random(-300, 300), random(-300, 300), random(-300, 300), random(-300, 300), random(-300, 300), random(-300, 300), random(-300, 300));
              if (mySecond < 25) {
                bezier (random(-200, 200), random(-200, 200), random(-200, 200), random(-200, 200), random(-200, 200), random(-200, 200), random(-200, 200), random(-200, 200));
                if (mySecond < 20) {
                  bezier (random(-100, 100), random(-100, 100), random(-100, 100), random(-100, 100), random(-100, 100), random(-100, 100), random(-100, 100), random(-100, 100));
                }
              }
            }
          }
        }
      }
    }
  }
}


