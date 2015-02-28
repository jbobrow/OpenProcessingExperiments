
// Here is my weekly assignment. I came to this finally but 
// unsatisfied with it for two reasons;
// 1, I had to get help from the processing forums, and they 
// helped me achieve it with things I haven't learned yet,
// like final static and update(), and 
// 2 I still haven't been able to replicate the circles seen on 
// the test in question 4, so I am still frustrated with that 
// problem.

    final static int DIAM = 40, RAD = DIAM>>1;
    final static int GAP = 10, LEN = DIAM + GAP;
    final static int SX = 12, SY = 9, FPS = 50;

    int x = RAD, y = RAD;

    void setup() {
      size(LEN*SX - GAP, LEN*SY - GAP);

      frameRate(FPS);
      smooth();

      ellipseMode(CENTER);
      noStroke();
      background(-1);
    }

    void draw() {
      fill((color) random(#000000));
      ellipse(x, y, DIAM, DIAM);
      update();
    }

    void update() {
      if ( (x += LEN) >= width ) {
        x = RAD;
        if ( (y += LEN) >= height )   y = RAD;
      }
    }




