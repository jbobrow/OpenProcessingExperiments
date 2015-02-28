
ArrayList<Link> links;

int fSize= 650;
int symbolDist = 160;
int symbolSize = 50;
int mouseDistThresh = 50;

int maxFreq=360;
float maxMod=fSize/3f;

float circleDiv;

float ap = TWO_PI / 360;
float systemAngle;

int minDist = 100;
int numWaves = 2;

int mode = 2; 
// 1: cursor imitates last icon
// 2: icons evade cursor
int cursorP;
PImage cursorImg;

int opacity =255;

PVector mouse;

void setup() {
  size(350, 350); 
  colorMode(HSB, 6000, 100, 100, 255);
  links = new ArrayList<Link>();
  // twitter
  links.add(new Link("https://twitter.com/ramin__", "twitter.png"));
  // tumblr
  links.add(new Link("http://www.tumblr.com/blog/diskordier", "tumblr.png"));
  // g+
  links.add(new Link("https://plus.google.com/u/0/117844135250190324271/posts", "google_plus.png"));
  // fb
  links.add(new Link("https://www.facebook.com/hans.efak", "facebook.png"));
  // soundcloud
  links.add(new Link("http://soundcloud.com/ra-saite", "soundcloud.png"));
  // gmail
  links.add(new Link("mailto:diskordier@gmail.com", "gmail.png"));
  // myspace
  links.add(new Link("http://www.myspace.com/soniceonice", "myspace.png"));
  // flickr
  links.add(new Link("http://www.flickr.com/photos/9230782@N05/", "flickr.png"));
  circleDiv = TWO_PI / links.size();
  for (int i=0; i < links.size(); i++)
    links.get(i).setPos( circleDiv*i);

  imageMode(CENTER);
  smooth();
  if (mode==1)
    cursor(links.get(1).img, 0, 0);
}


void draw() {
  fill(frameCount%4000, 100, 100, opacity);
  rect(-2, -2, width+2, height+2);
  // background(255);
  mouse = new PVector(mouseX, mouseY);
  systemAngle = frameCount*ap;
  for (int i=0; i < links.size();i++) {
    Link l = links.get(i);
    l.setPos(systemAngle+ circleDiv*i);
    if (mode==2)
      l.evade();
    l.hover=mouse.dist(l.pos)<mouseDistThresh;
    l.adjust();
    l.draw();
    if (mode==1 && l.hover)
      cursorP = i;
  }
  if (mode==1 ) {
    try {
      cursorImg = (PImage) links.get(cursorP).img.clone();
    } 
    catch(CloneNotSupportedException cnse) {
    }
    cursorImg.filter(INVERT);
    cursor(cursorImg, 3, 3);
  }
  //  println(frameCount);
}

void mousePressed() {
  for (Link l : links) 
    if (l.hover) {
      l.stop();
      link(l.url, "_new");
      return;
    }
}


public class Link {

  //  URL url;
  String url;
  public PImage img;
  boolean hover;
  PVector pos;
  float angle;
  // float scale;
  int w, h;
  float scale=-1;
  Wave[] waves;
  int evading;


  public Link(String url, String imgAdr) {
    this.url = url;
    img = loadImage(imgAdr);
    waves = new Wave[numWaves];
    for (int i=0; i < waves.length;i++)
      waves[i] = new Wave();
  }

  public void setScaleSize() {
    float  scale =(float) symbolSize/ (float) max(img.width, img.height) ;
    //  println(img.width+","+img.height+"> "+scale);
    w = (int)(img.width* scale);
    h = (int)(img.height*scale);
  }

  void evade() {
    PVector v =new PVector(pos.x, pos.y);
    v.sub(mouse);
    // println(v);
    float le = v.mag();
    if (le<100) {
      evading+=3;
    }
    else
      evading-=5;
      evading = constrain(evading,0,100 );
      v.normalize();
      v.mult(evading);
      pos.add(v);
  }

  void setPos(float angle) {
    float distT=0;
    for (int i=0; i < waves.length;i++)
      distT = waves[i].getVal(systemAngle);
    distT += minDist;
    //    pos = new PVector(width/2+cos(angle)*symbolDist, height/2+sin(angle)*symbolDist);
    pos = new PVector(width/2+cos(angle)*distT, height/2+sin(angle)*distT);
  }

  void  adjust() {
    if (hover) {
      angle= (angle + 0.1) % TWO_PI;
      scale+=0.1;
    }
    else {
      angle=max((angle-0.3), 0);
      scale= 1;
    }
  }

  void stop() {
    hover = false;
    angle = 0;
    scale = 1;
  }


  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    pushMatrix();
    rotate(angle);
    // image(img, 0, 0, symbolSize, symbolSize); 
    //   println(img.width);
    image(img, 0, 0, w*sin(scale), h*sin(scale)); 
    popMatrix();
    popMatrix();
    if (w==0) {// because img.width is 0 in the constructor???
      setScaleSize();
    }
  }
}

public class Wave {

  int num;
  float phase;
  float freq;
  float mod;
  float momentum;

  public Wave() {
    phase =random(TWO_PI);
    freq  =  random(60, maxFreq);
    mod = random(20, 50);
    momentum = TWO_PI /  freq;
  }

  float getVal(float f) {
    return sin(phase+frameCount*momentum)*mod;
  }
}



