
/*
  @pjs preload="0.png,1.png,2.png,3.png,4.png,5.png,6.png,7.png,8.png,v.png"
*/

/*
 Andor Salga
 Feb 2015
 Planet Generator
*/

PlanetGenerator planetGen;
int lastTime = 0;
float speed = 100; // px/sec
PImage v;

public class Body {
  PVector pos;
  PImage img;
  int index;
  int d;
  boolean r;

  Body() {
    pos = new PVector(0, 0);
    planetGen.radius(100);
    img = planetGen.create();
    index = 0;
    d = 0;
    r = false;
  }

  void update(int delta) {
    d += delta;
    pos.x = ((int(d/10) + (index*100)+100) % (width+100)) - 100;
    
    if(pos.x >= width -10 && r == false){
        img = planetGen.create();
        r = true;
    }
    
    if(pos.x  < 0){
        r = false;
    }
  }

  void draw() {
    image(img, pos.x, 0);
  }
}

ArrayList <Body> bodies;

void setup() {
  size(500, 100);
  smooth();

  v = loadImage("v.png");

  planetGen = new PlanetGenerator();

  bodies = new ArrayList < Body > ();

  for (int i = 0; i < 6; i++) {
    Body b = new Body();
    b.index = i;

    bodies.add(b);

    b.pos.x = i * 100;
  }
}

void draw() {
  background(0);

  int delta = (millis() - lastTime);// / 1000.0;

  for (int i = 0; i < bodies.size(); i++) {
    bodies.get(i).update(delta);
    bodies.get(i).draw();
  }
  image(v, 0, 0);

  lastTime = millis();
}
/*
*/
class PlanetGenerator {

  private int s;
  private PImage gradientMap;
  private float xNoiseOffset;
  private float yNoiseOffset;
  private int noiseSeedVal;

  public PlanetGenerator() {
    xNoiseOffset = 0;
    yNoiseOffset = 0;
    noiseSeedVal = 0;
  }

  public void radius(int s) {
    this.s = s;
  }
  
  public void gradientMap(String str){
    gradientMap = loadImage(str);
  }

  void softenEdge(PImage img) {
    float max = 1;
    float min = 0.9;
 
    for (int y = 0; y < s; y++) {
      for (int x = 0; x < s; x++) {
        float d = dist(s/2.0, s/2.0, x + 0.5, y + 0.5);
        
        if ((d/s) * 2 >= min && (d/s) * 2 <= max){

          float darken = map((d/s) * 2, min, max, 1, 0);

          color col = img.pixels[y * s + x];
          float r = red(col) * darken;
          float g = green(col) * darken;
          float b = blue(col) * darken;

          img.pixels[y * s + x] = color(r, g, b);
          img.updatePixels();
        }
      }
    }
  }

  PImage create() {
    PImage img = new PImage(s, s, ARGB);
    img.loadPixels();

    xNoiseOffset = random(0, 10);
    yNoiseOffset = random(0, 10);
    noiseSeedVal = (int)random(0, 100);

    gradientMap = loadImage( ((int)random(0,8)) + ".png");

    noiseDetail(20, 0.6);
    noiseSeed(noiseSeedVal);

    for (int x = 0; x < s; x++) {
      for (int y = 0; y < s; y++) {

        float xNoise = xNoiseOffset + (x * 0.01);
        float yNoise = yNoiseOffset + (y * 0.01);

        float n = noise(xNoise, yNoise);

        int v = (int)map(n, 0.0, 1.0, 0.0, gradientMap.width-2);

        if (dist(s/2.0, s/2.0, x + 0.5, y + 0.5) <= s/2.0) {

          img.pixels[(y * s) + x] = gradientMap.get(v, 0);

        }
      }
    }

    softenEdge(img);
    img.updatePixels();
    return img;
  }
}

