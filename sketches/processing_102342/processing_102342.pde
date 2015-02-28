
Maxim maxim;
AudioPlayer birdPlayer, popPlayer;

Garden garden;
float co2 = 0.0;
float co2Increment = 0.002;

SodaWater soda;

void setup()
{
  size(640, 960);

  maxim = new Maxim(this);
  birdPlayer = maxim.loadFile("blackbird.wav");
  birdPlayer.setLooping(true);

  //----------------
  birdPlayer.volume(0.0);
  //----------------

  popPlayer = maxim.loadFile("pop2.wav");
  popPlayer.setLooping(false);

  frameRate(25);

  background(0);

  garden = new Garden(width, height/2, 100, 100);

  soda = new SodaWater(0, height/2, width, height/2);
}

void draw()
{
  birdPlayer.play();
  background(0);
  soda.draw();
  garden.setCO2(soda.co2Concentration());
  garden.show();
}

void mouseDragged()
{
  soda.onDrag();
}

void mousePressed()
{
  soda.onPress();
}

void mouseReleased()
{
  soda.onRelease();
}

class SodaWater {

  private int x, y, w, h;
  private HashMap bubbles;
  private ArrayList popped; 
  private Bubble inflatingBubble = null;

  private CO2Meter meter;

  private float co2 = 0.0;   // Level of CO2 - range from 0.0 to 1.0
  private static final float CO2_DISPERSION = 0.001; // Rate at which CO2 levels diminish naturally
  private static final float BUBBLE_CONCENTRATION = 0.0005;

  SodaWater(int x, int y, int w, int h) {
    this.x = x;
    this.y = y + 10;
    this.w = w;
    this.h = h;

    bubbles = new HashMap(100);
    popped = new ArrayList(100);

    meter = new CO2Meter(x, y, w, 10);
  }

  float co2Concentration() {
    return co2;
  }

  void draw()
  {
    // blank out canvas
    noStroke();
    fill(0);
    rect(x, y, w, h);

    // .js version only: non-looping audio player must be
    // stopped before it can be played again
    popPlayer.stop();

    // Allow for natural decline in CO2 levels
    co2 = max(0.0, co2 - CO2_DISPERSION);

    meter.showLevel(co2);

    // Redraw and raise all bubbles
    for (Object o : bubbles.keySet()) {
      Bubble bubble = (Bubble)o;
      paintBubble(bubble);
      bubble.rise();
      if (bubble.y - bubble.radius < y) {
        // add popped bubbles to 'popped' list
        // to be cleaned up later
        popped.add(bubble);

        // add new CO2 from popped bubbles
        co2 = min(1.0, co2 +  bubble.radius * BUBBLE_CONCENTRATION);
      }
    }

    if (!popped.isEmpty()) {
      // remove all popped bubbles from 'bubbles'
      for (Object b: popped) {
        bubbles.remove(b);
      }
      popped.clear();

      // POP!!!!
      popPlayer.cue(0);
      popPlayer.play();
    }

    if (inflatingBubble != null) {
      paintBubble(inflatingBubble);
      inflatingBubble.inflate();
    }
  }

  void onDrag() {
    if (mouseY > y) {
      if (inflatingBubble != null 
        && dist(inflatingBubble.x, inflatingBubble.y, mouseX, mouseY) > inflatingBubble.radius) {
        bubbles.put(inflatingBubble, null);
        bubbles.put(inflatingBubble, null);
        inflatingBubble = null;
      }  

      if (inflatingBubble == null)
        inflatingBubble = new Bubble(20, mouseX, mouseY);
    }
  }

  void onPress() {
    if (mouseY > Y)
      inflatingBubble = new Bubble(20, mouseX, mouseY);
  }

  void onRelease() {
    if (inflatingBubble != null) {
      bubbles.put(inflatingBubble, null);
      inflatingBubble = null;
    }
  }

  private void paintBubble(Bubble bubble) {
    stroke(180, 180, 255, 255);
    strokeWeight(2);
    noFill();
    ellipse(bubble.x, bubble.y, bubble.radius, bubble.radius);
    arc(bubble.x, bubble.y, 
    bubble.radius * 0.7, bubble.radius * 0.7, 
    radians(300), radians(315));
  }
}


class Bubble {

  float radius, x, y, sinkRate;

  Bubble(float radius, float x, float y, float sinkRate) {
    this.radius = radius;
    this.x = x;
    this.y = y;
    this.sinkRate = sinkRate;
  } 

  Bubble(float radius, float x, float y) {
    this(radius, x, y, 0.1f);
  }

  void inflate() {
    radius += 4;
  }

  void rise() {
    y -= radius*sinkRate;
  }
}

class CO2Meter {
  private static final int margin = 4;
  private int x, y, w, h;

  CO2Meter(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void showLevel(float co2) {
    fill(100);
    noStroke();
    rect(x, y, w, h);
    colorMode(HSB);
    //fill(255, 0, 0);
    fill(map(abs(co2 - 0.5), 0, 0.5, 100, 0), 255, 255);
    rect(x + margin, y + margin, map(co2, 0.0, 1.0, 0.0, w - 2*margin), h - 2*margin);
    colorMode(RGB);
  }
}

class Garden {
  private int width, height;
  private PImage movieBF[], movieSF[];
  private Flower [] flowers;
  private int imgWidth, imgHeight;

  private float co2Level = 0; // current CO2 level in range 0.0 to 1.0
  private FlowerList liveList, deadList;


  Garden(int width, int height, int imgWidth, int imgHeight) {
    this.width = width;
    this.height = height;
    this.imgWidth = imgWidth;
    this.imgHeight = imgHeight;

    movieBF = loadImages("movie/movieBF", ".png", 38);
    movieSF = loadImages("movie/movieSF", ".png", 38);

    arrangeFlowers();
  }

  public void setCO2(float co2) {
    co2Level = co2;
    int numFlowers = (int)round(map(abs(co2Level - 0.5), 0, 0.5, flowers.length, 0));
    int flowerDelta = numFlowers - liveList.count();

    for (int i = 0; i < flowerDelta; i++) {
      Flower flower = deadList.removeFlower();
      flower.grow();
      liveList.addFlower(flower);
    }

    for (int i = 0; i > flowerDelta; i--) {
      Flower flower = liveList.removeFlower();
      flower.die();
      deadList.addFlower(flower);
    }

    //----------------
    birdPlayer.volume(map(abs(co2Level - 0.5),0, 0.5, 1.0, 0.0));
    //----------------
  }

  public void show() {
    for (int i = 0; i < flowers.length; i++) { //Flower f : flowers) {
      Flower flower = flowers[i];
      /*      int status = flower.getStatus();
       if (status == Flower.DEAD)
       flower.grow();
       else if (status == Flower.GROWN)
       flower.die();
       */
      flower.draw();
      flower.tick();
    }
    liveList.updateStatus();
    deadList.updateStatus();
  }

  private void arrangeFlowers() {
    int numX = (int)(width / imgWidth);
    int numY = (int)(height / imgHeight);
    flowers = new Flower[numX * numY];
    liveList = new FlowerList(numX * numY, Flower.GROWING, Flower.GROWN);
    deadList = new FlowerList(numX * numY, Flower.DIEING, Flower.DEAD);

    // fill with random flowers
    for (int i = 0; i < flowers.length; i++) {
      float selector =  random(0, 1);
      Flower flower = new Flower(selector > 0.5 ? movieBF : movieSF, imgWidth, imgHeight);
      flowers[i] = flower;
      deadList.addFlower(flower);
    } 

    // set up sequence of positions
    int pos[] = new int[flowers.length];
    for (int i = 0; i < pos.length; i++)
      pos[i] = i;

    // randomize that sequence
    for (int i = pos.length - 1; i > 0; i--) {
      int idx = (int)floor(random(0, i));
      int temp = pos[idx];
      pos[idx] = pos[i];
      pos[i] = temp;
    }

    // arrange flowers using randomised sequence
    int xSpacing = (int)(width / numX);
    int ySpacing = (int)(height / numY);

    for (int i = 0; i < flowers.length; i++) {
      flowers[i].setLocation((int)(pos[i]/numY) * xSpacing, (int)(pos[i] % numY) * ySpacing);
    }
  }
}

class Flower {
  private static final int DEATH_FADE = 20; // number of frames over which dead flower fades 

  public static final int DEAD = 0, GROWING = 1, GROWN = 2, DIEING = 3;

  private int status = DEAD;

  private PImage [] stream;
  private int x = 0, y = 0;
  private int imgWidth, imgHeight;
  private int frame = -DEATH_FADE;
  private int direction = 0;

  public Flower(PImage [] stream, int imgWidth, int imgHeight) {
    this.stream = stream;
    this.imgWidth = imgWidth;
    this.imgHeight = imgHeight;
  }

  public void grow() {
    // Start the growing process
    frame = 0;
    direction = 1;
    status = GROWING;
  }

  public void die() {
    // start the un-growing process
    direction = -1;
    if (status != DEAD)
      status = DIEING;
  }

  public int getStatus() {
    return status;
  }

  public void draw() {
    if (frame <= -DEATH_FADE) {
      fill(0);
      noStroke();
      rect(x, y, imgWidth, imgHeight);
    }
    else {
      // display image[frame] or, if frame < 0, image[0]
      image(stream[max(frame, 0)], x, y, imgWidth, imgHeight);
      if (frame < 0) { // fade frame
        float alpha = map(frame, -1, -DEATH_FADE + 1, 0, 200);
        fill(0, 0, 0, alpha);
        noStroke();
        rect(x, y, imgWidth, imgHeight);
      }
    }
  }

  public void tick() {
    frame = max(min(frame + direction, stream.length - 1), -DEATH_FADE);
    if (frame >= stream.length - 1)
      status = GROWN;

    if (frame <= -DEATH_FADE)
      status = DEAD;
  }

  void setLocation(int x, int y) {
    this.x = x;
    this.y = y;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
}


// ------------------------------------------------
//
// Class FlowerList:
//  maintain collection of flowers 
//  flower's status is used to organize the contents so
//  that those that are in a static stage of their life-cycle
//  are recycled first.
//
class FlowerList {

  private Flower[] flowers;
  private int activeStatus, staticStatus;  // Flower status codes which designate active/static state
  private int activePtr = 0, staticPtr = 0; // insertion points into list

  FlowerList(int numFlowers, int activeStatus, int staticStatus) {
    flowers = new Flower[numFlowers];
    this.activeStatus = activeStatus;
    this.staticStatus = staticStatus;
  }

  int count() {
    // total number of flowers in list
    return staticPtr;
  }

  int activeCount() {
    // number of flowers in active state
    return activePtr;
  }

  void updateStatus() { 
    // check status of each active flower to check they haven't become static
    int updateCount = 0;
    for (int i = activePtr - 1; i >= 0; i--) {
      if (flowers[i].getStatus() != activeStatus) {
        // move flower to static area of list
        activePtr -= 1;
        Flower temp = flowers[activePtr];
        flowers[activePtr] = flowers[i];
        flowers[i] = temp;

        updateCount++;
      }
    }
  }

  void addFlower(Flower flower) {
    // put flower into approriate portion of lisy
    if (flower.getStatus() == activeStatus) {
      flowers[staticPtr] = flowers[activePtr];
      flowers[activePtr] = flower;
      staticPtr += 1;
      activePtr += 1;
    }
    else {
      flowers[staticPtr] = flower;
      staticPtr += 1;
    }
  }

  Flower removeFlower() {
    if (staticPtr == 0) { // empty
      return null;
    }

    // preferentially remove static flowers
    staticPtr -= 1;
    if (staticPtr < activePtr) // there were no static flowers
      activePtr -= 1;

    return flowers[staticPtr];
  }

}

//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}


