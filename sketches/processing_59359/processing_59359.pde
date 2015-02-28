
PImage img;
PGraphics g;
int[] tps;
color[] cols;
color b=color(0); 
int temps=0;
int next=0;
slider slider1, slider2;
float seuil=5;
int gy;
float longueurSlider = 280;

void setup() {
  img = loadImage("annakarina.jpg");
  size(400, 400); 
  PFont myFont = createFont("arial", 10, false);
  gy=img.height;
  g=createGraphics(width, 80, JAVA2D);
  g.beginDraw();
  g.background(255);
  g.textFont(myFont, 10);
  g.textAlign(RIGHT, CENTER);
  textFont(myFont, 10);
  g.fill(0);
  background(255);
  tps = new int[img.pixels.length]; 
  cols = new color[img.pixels.length];
  for (int a=0;a<img.pixels.length;a++) {
    int b = floor(brightness(img.pixels[a])/8);
    cols[a]=color(255);
    tps[a] = b;
  } 
  slider1 = new slider("speed", 36, 0, 1000, 1000);
  slider2 = new slider("threshold", 56, 0, 20, 10);
  g.endDraw();
  rectMode(CENTER);
  fill(0);
  noStroke();
  frameRate(150);
}

void draw() { 
  // println(frameRate);
  if (next<millis()) {
    next=millis()+temps;
    loadPixels();
    arrayCopy(cols, pixels);
    for (int a=0;a<tps.length;a++) {
      if (random(tps[a])<seuil) {
        pixels[a]=b;
      }
    }
    updatePixels();
  }
  image(g, 0, gy);
  slider1.dessine();
  slider2.dessine();
}

class slider {
  String name; 
  int y, x, endx;
  float mini, val, posx, total,postxt,maxi;
  boolean tenu=false;
  slider(String _name, int _y, float _mini, float _maxi, float _val) {
    maxi=_maxi;
    name=_name;
    y=_y;
    x=20; 
    val=_val;
    total =( _maxi-_mini)/longueurSlider;
    g.text(name, x+40, _y);
    y=_y+img.height+3;
    x=x+60;
    endx=int(x+longueurSlider);
    postxt = endx+5;
    posx=  map(val, _mini, _maxi, x, endx); 
    println(total+" "+posx);
    g.line(x, _y+3, endx, _y+3); 
  }
  void dessine() { 
    if (tenu) {
      posx=constrain(mouseX, x, endx);
      val=(posx-x)*total;
      if (name=="speed") {
        temps=floor(maxi-val);
      }
      if (name=="threshold") {
        seuil=val+mini;
      }
      text(nf(val, 3, 1), postxt,y);
    }
    rect(posx, y, 2, 10);
  }
  void check() {
    float disth=abs( mouseY-y);
    if (disth<6 && mouseX>(x-10) && mouseX<(endx+10)) {
      tenu=true;
    }
  }
}

void mousePressed() {
  slider1.check();
  slider2.check();
}

void mouseReleased() {
  slider1.tenu=false;
  slider2.tenu=false;
}


