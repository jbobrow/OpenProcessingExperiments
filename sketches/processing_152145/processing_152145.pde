
  
  private int frameSize = 500;
  private int t = 0;
  
  private float x0 = frameSize / 2;
  private float y0 = frameSize / 2;
  
  private float x1 = frameSize / 2;
  private float y1 = frameSize / 2;
  private double radius = frameSize/2;
  
  // /play with these
  private float numRev = 25;
  private float density = (float)132.51;
  private int speed = 1;
  private float amp = (float)1;

  private float freq = (float) ((float)density/numRev);


  public void setup() {
    // original setup code here ...
    
    size(frameSize, frameSize);
    background(128);
    smooth();
//    drawGrid();

    frameRate(8888888);
   

  

  }

  public void draw() {
    // drawing code goes here
    t = t + speed;
    stroke(0);
    strokeWeight(1);
//     randomColor();
//    paramColor(radians(t));
    traceRosace(t);
    
    if(t%(360*speed*numRev) == 0 ){
      noLoop();
    }
    
    redraw();

  }


  public void traceRosace(float t) {
    t = radians(t);
    float delta = (float) Math.cos(amp * Math.cos((t * freq)));
    x1 = (float) ((float) frameSize/2 + (delta * radius * Math.sin(t)));
    y1 = (float) ((float) frameSize/2 + (delta * radius * Math.cos(t)));
//    line(x0, y0, x1, y1);
    point(x1,y1);
    x0 = x1;
    y0 = y1;
  }

  public void paramColor(float in) {
    stroke(
    /* R */(float) (Math.cos(1 * in) * 255),
    /* V */(float) (Math.cos(1 * in) * 255),
    /* B */(float) (Math.cos(1 * in) * 255));
  }

  public void randomColor() {
    stroke(
    /* R */(float) (Math.random() * 255),
    /* V */(float) (Math.random() * 255),
    /* B */(float) (Math.random() * 255));
  }

  public void drawGrid() {
    stroke(128);
    for (int i = 0; i < height / 10; i++) {
      line(i * 10, 0, i * 10, height);
    }
    for (int i = 0; i < width / 10; i++) {
      line(0, i * 10, width, i * 10);
    }
  }


