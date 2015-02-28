
/* @pjs preload="incoming.jpg"; */
PImage cosbyMouth;
PImage noiseImage;
PImage cosby;
PImage scroller;
PImage call;
PImage incoming;
PImage bScroller;
float xoff = 0.0;
int splits=1;
float timer=0;
float dir=1.1;
int demoEnd = 30;
int count=0;
float a = 0.0;
float inc = TWO_PI/25.0;
float old_x = 0, old_y = 320, x, y;
void setup() {
  colorMode(HSB);

  size(640, 480);

  frameRate(1);
  for (int x=0;x<width;x+=12) {
    for (int y=0;y<height;y+=24) {
      float n = noise(xoff) * width;
      stroke(random(0, 255), random(0, 255), random(0, 255));
      strokeWeight(32);
      line(x, y, width, height);
    }
  }
  filter(POSTERIZE, 4);
  saveFrame("noise.png");
  incoming= requestImage("incoming.jpg");  
  noiseImage = requestImage("noise.png");
  cosby = requestImage("cosby.png");
  cosbyMouth = requestImage("cosbyMouth.png");
  scroller = requestImage("scroller.png");
  call = requestImage("call.png");
  size(640, 480);
  frameRate(10);
}
void draw() {
  timer+=2/frameRate;
  if (timer>0&&timer<.5) {
    image(scroller, 0, 0, width, height);
    filter(GRAY);
    saveFrame("bScroller.png");
    bScroller=requestImage("bScroller.png");
  }

  println(timer);
  if (timer>= 0&&timer<5) {
    fill(0);
    background(0);
  }
  if (timer<random(4, 7) && timer > 1) {
    int h = int(random(height));
    image(incoming, random(0, 8), random(0, 8), random(width-8, width), random(height-8, height));
    image(scroller, 0, h, width, h+random(0, 12));
    image(cosby, width/3, height/5, int(width/4), int( height/4));
    image(cosbyMouth, width/3, height/5+random(16), int(width/4), int( height/4));
  }
  if (timer>5&&timer<10) {
    image(call, 0, 0, width, height);
  }
  if (timer>10&&timer<12) {
    int Uy = int(random(height));
    image(scroller, 0,Uy , width, Uy+random(2, 12));
  }
  if (timer>12) {
    if (splits<16&&splits>=1) {
      splits=(splits+1);
      for (int w=0;w<width;w+=width/splits) {
        for (int h=0;h<height;h+=height/splits) {
          image(noiseImage, w, h, width/splits, height/splits);
          //  image(cosby, w, h, width/splits, height/splits);
          // image(cosbyMouth, w, h+random(12), width/splits, height/splits);
        }
        if (splits>7) {

          splits=1;
        }
      }
    }
  }
  if (timer>15) {
    image(cosby, int(width/4), int(height/4), int(width/2), int( height/2));
    image(cosbyMouth, int(width/4), int((height/3.7)+(splits*int(dir))), int(width/2), int( height/2));
  }
  if (count<width) { 

    count=count+16;
    x = count;
    y = width/2 + sin(a) * 50.0;
    // image(cosby, x-200, y, 258, 64);
    //  image(cosbyMouth, x-200, y+12, 258, 64);
    image(cosby, old_x, old_y, 128, 128);
    image(cosbyMouth, old_x, old_y, 128, 128);

    old_x = x;
    old_y = y;
    a = a + inc;
  }
  if (count>width) {
    count =0;
  }


  else if (timer>25) {
    timer=0;
    // count=0;
    splits=1;

    fill(0);
    //background(0);
  }
  //background(204);
  //xoff = xoff + .04;
}



