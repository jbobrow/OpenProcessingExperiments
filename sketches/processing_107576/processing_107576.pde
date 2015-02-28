
// import gifAnimation.GifMaker;
 
 // dots or lines...
  int      numDots    = 256;
  float    totalPhase  = 5 * TWO_PI + PI;
  float    phase[]    = new float[numDots];
  float    speed    = PI / 30;
  float    maxR    = 300;
  
//  GifMaker  gifExport;
  

  public void setup() {
    size(600, 600);
    background(0);
    createInitPhases();
    colorMode(HSB, numDots);
    strokeWeight(2);
 //   gifExport = new GifMaker(this, "giffi.gif");
 //   gifExport.setRepeat(0);
  }
  
  private void createInitPhases() {
    float phDiv = totalPhase / numDots;
    for (int i = 0; i < numDots; i++)
      phase[i] = phDiv * i;
  }
  

  public void draw() {
    fill(0, 60);
    rect(-2, -2, width + 5, height + 5);
    // background(0);
    translate(width / 2, height / 2);
    float angleDiv = TWO_PI / numDots;
    for (int i = 0; i < numDots; i++) {
      stroke(i, numDots, numDots);
      line(cos(angleDiv * i) * 6, sin(angleDiv * i) * 6, cos(angleDiv * i) * maxR
          * abs(sin(phase[i])), sin(angleDiv * i) * maxR * abs(sin(phase[i])));
      // fill(i, numDots, numDots);
      // ellipse(cos(angleDiv * i) * maxR * abs(sin(phase[i])), sin(angleDiv * i) * maxR
      // * abs(sin(phase[i])), 5, 5);
      phase[i] = phase[i] += speed;
    }
  /*  
    if (frameCount > 30) {
      gifExport.setDelay(1);
      gifExport.addFrame();
      if (frameCount == 60) {
        gifExport.finish();
        exit();
      }
    } */
  }
