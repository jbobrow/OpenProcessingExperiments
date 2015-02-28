

/**
 * Peter de Jong attractor applet by Thor Froelich.<br>
 *  http://www.openprocessing.org/visuals/?visualID=2097
 * <br>
 * Hold mouse button and move mouse to adjust variables.<br>
 * Release mouse button to render attractor in high quality.
 */

deJongAttractor dj;
boolean stop;
int stepCounter;
float a,b,c,d;
int oldTime=0; 
final int timeToBuild = 10000; 

void setup() {
  size(800, 700, P2D);
  // CheckOnReset();
  // size(screen.width, screen.height,P2D);
  noFill();
  smooth();
  // noCursor();
  colorMode(HSB, 255);
  a = random(0,width); 
  b = random(0,height); 
  c = random(0,width); 
  d = random(0,height); 
  dj = new deJongAttractor();
  dj.reparam();
}

void draw() {
  CheckOnReset();
  if (!stop) {
    stepCounter++;
    if (stepCounter > 197) { // 127 
      println("done.");
      stop = true;
      return;
    }
    dj.incrementalupdate();
  }

  image(dj.pi, 0, 0, width, height);
}

void CheckOnReset () {
  if ((oldTime+timeToBuild) < millis()) {
    println("Time");

    a = random(0,width); 
    b = random(0,height); 
    c = random(0,width); 
    d = random(0,height); 

    dj = new deJongAttractor();
    dj.reparam();    

    // mouseDragged_Fake();  // comes here : 
    stop = true;
    dj.reparam();    
    // dj.reparam();
    //    // loop();
    //    println("r");
    //    stop = false;
    //    stepCounter = 0;
    //    dj.updateloop();
    mouseReleased_Fake() ; 
    oldTime=millis();
  }
}

void mouseDragged_Fake() {
  noLoop();
  stop = true;
  dj.reparam();
  redraw();
}

void mouseReleased_Fake() {
  loop();
  println("r");
  stop = false;
  stepCounter = 0;
  dj.updateloop();
}

void mousePressed () { 
  oldTime=-10000; 
}
















