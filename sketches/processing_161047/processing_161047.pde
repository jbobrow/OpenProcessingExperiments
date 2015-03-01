
ArrayList<Mover> movers;
PVector axis;
int[] list;
PFont font;
int count, max;
float bright;
char typedKey = 'C';

void setup() {
  size(600, 800);

  colorMode(HSB, 360, 100, 100);
  background(5, 10, 100);
  strokeCap(ROUND);
  strokeWeight(11);
  frameRate(60);
  bright=100;
  movers=new ArrayList<Mover>();
  count=0;
  max=500;

  font = createFont("FreeSansBold.ttf", 450);
  textFont(font);
  fill(0);
  textAlign(CENTER, CENTER);
  text(typedKey, width/2, height/2-50);
  list = new int[width*height];
  loadPixels();
  for (int y = 0; y<=height-1; y++) {
    for (int x = 0; x<=width-1; x++) {
      color pb = pixels[y*width+x];
      if (red(pb)<5) {  
        list[y*width+x]=0;
      } else {  
        list[y*width+x]=1;
      }
    }
  }
  updatePixels();
  background(#FFFAF5);
}

void draw() {

  if (count<max) {  
    int i=0;  
    while (i<1) {
      axis = new PVector(int(random(100, width-100)), int(random(100, height-100)));
      if (list[int(axis.y*width+axis.x)]==0) {
        movers.add(new Mover(bright, axis.x, axis.y));
        if(bright>20)
        bright-=0.2;
        i++;
        count++;
      }
    }
  }

  background(#333333); 
  for (int i = movers.size()-1; i > 0; i--) {
    Mover m = movers.get(i);
    m.update();
    m.display();
  }
}

class Mover {
  PVector location;
  PVector initialPoint;
  PVector velocity;
  float brightness;
  float xx, yy;
  float hue;
  int strokeW;

  Mover(float br, float x, float y) {
    xx = x;
    yy = y;
    location = new PVector(x, y);
    initialPoint = new PVector(x, y);
    velocity = new PVector(2, -1);
    brightness = br;
    hue=29;
    strokeW=10;
  }

  void display() {
    strokeWeight(strokeW);
    stroke(hue, 3, brightness);
    line(initialPoint.x, initialPoint.y, location.x, location.y);
  }

  void update() {
    location.add(velocity);
    if ( list[int(location.y*width+location.x)]==1 && random(10)<5) {
      velocity = new PVector(0, 0);
    }
  }

  void reset() {
    int j=0;
    while (j< movers.size ()) {
      axis = new PVector(int(random(100, width-100)), int(random(100, height-100)));
      if (list[int(axis.y*width+axis.x)]==0) {
        location.set(axis);
        initialPoint.set(axis);
        j++;
      }
    }
  }
}

void keyReleased() {
      if (key != CODED && key != ' ' && key != TAB && key != ENTER && key != RETURN) {
    movers.clear();
    typedKey = key;
    setup();
  }
}



