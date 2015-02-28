
/**
 Glowing Sine Wave
 @author Group 12 (Paul, George, Jose).
 @version 02 Oct 2012
 */
Sine sine = new Sine(0, 300, 20);
Glow glow = new Glow(0, height/2, 20, 20);
List<Glow> GlowList = new ArrayList<Glow>();
long startTime = System.currentTimeMillis();
int appearanceTime = 2000;

void setup() {
  size(800, 600);
  frameRate(30);
  smooth();
  noStroke();
  background(0);
}

void draw() {
  background(0);
  sine.drawSine();
  for(int i = 0; i < GlowList.size(); i++) {
    GlowList.get(i).draw();
    GlowList.get(i).move();
  }
  
  if(System.currentTimeMillis() - startTime > appearanceTime) {
    GlowList.add(new Glow(0, height/2, 20, 20));
    appearanceTime += 500;
    startTime = System.currentTimeMillis();
  }
    
}

/**
 Sine
 @author Georgi Vutov
 @version 02 Oct 2012
 */
class Sine {
  private float x, y, wd;
  private float startAngle = 0, a = 0;
  
  public Sine(float x, float y, float wd) {
    this.x = x;
    this.y = y;
    this.wd = wd;
  }

  //DRAW SINE
  public void drawSine() {
    fill(255, 255, 255);
    this.x = 0;
    this.a = startAngle;
    for(int i = 0; i < 360; i++) {
      ellipse(this.x, this.y+height/2, this.wd, this.wd);
      this.y = sin(radians(this.a))*50;
      this.x += 5;
      this.a += 5;
    }
    this.startAngle += 5;
  }
}

/**
 Glow
 @author Jose Salvatierra
 @version 02 Oct 2012
 */
class Glow {
  //x goes from 0 to 360. This is the angle in degrees.
  private float x, y, wd, ht;
  private int magnitude;
  private PImage img = null;
  private int mid_y = height/2;
  private float startAngle = 0, a = 0;
  private int[] RGBColour = new int[3];

  public Glow(float x, float y, float wd, float ht) {
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    //this.magnitude = magnitude;
    this.magnitude = (int)random(3, 10);
    this.RGBColour[0] = (int)random(256);
    this.RGBColour[1] = (int)random(256);
    this.RGBColour[2] = (int)random(256);
  }

  public Glow(PImage img, int magnitude) {
    this.img = img;
    this.magnitude = magnitude;
  }

  //DRAW THE GLOW
  public void draw() {
    fill(RGBColour[0], RGBColour[1], RGBColour[2]);
    if(this.img != null) image(this.img, this.img.width, this.img.height);
    else ellipse(x, y+height/2, wd, ht);
  }

  //MOVE GLOW TOWARDS THE RIGHT
  //GET Y POSITION
  public void move() {
    this.x += magnitude;
    if(this.a >= 360) a += 5;
    this.y = sin(radians(this.a))*50;
    if (this.x > width) {
      this.x = 0;
    }
    this.a += 5;
  }
}

