
myThread mt;
float ang;
int curr;
PImage frame[];
boolean bLoadDone;

void setup() {
  size(305,395);
  background(0);
  smooth();
  noStroke();
  textAlign(CENTER, CENTER);
  frame = new PImage[116];
  bLoadDone = false;
  mt = new myThread(this);
  mt.start();
  ang = 0.0;
}

void draw() {
  float x, y;
  if (!bLoadDone) {
    ang += .1;
    x = cos(ang)*8;
    y = sin(ang)*8;
    fill(0, 8);
    rect(50,150, 100,100);
    fill(32,32,255);
    ellipse(x + 100, y + 200, 8, 8);
    fill(0);
    rect(120,150,170,100);
    fill(128);
    text("loading frame ("+curr+" of 115)", 200, 200);
  }
  else {
    background(0);
    image(frame[curr++], 0,0);
    if (curr > 115) curr = 0;
  }
}

public class myThread implements Runnable {
  Thread thread;
  public myThread(PApplet parent) { parent.registerDispose(this); }
  public void start() {
    thread = new Thread(this);
    thread.start();
  }
  public void dispose() { stop(); }
  public void stop() { thread = null; }
  
  public void run() {
    for (curr = 0; curr < 116; curr++) {
      frame[curr] = loadImage("a"+nf(curr,3)+" copy.jpg");
      delay(75); //just slows down this thread - the main draw() cycle is unaffected...
    }
    curr = 0;
    frameRate(30);
    bLoadDone = true;
  }
} 

