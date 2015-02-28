
Card[] cards;
int nCards;
int WIDTH = 20;
int HEIGHT = 20;
float noiseScale = 0.0275;
boolean recording = false;
int start = 0;

void setup() {
  size(500,500);
  smooth();
  
  cards = new Card[WIDTH*HEIGHT];
  nCards = WIDTH*HEIGHT;
  for (int x=0; x<WIDTH; x+=1) {
    for (int y=0; y<HEIGHT; y+=1) {
      cards[y*WIDTH+x] = new Card(40+x*16+40*int(x/5),40+y*16+40*int(y/5),-PI*2*PI*noise(x*noiseScale,y*noiseScale),1);
    }
  }
}

void draw() {
  background(200);

  for (int i=0; i<nCards; i+=1) {
    cards[i].step();
    cards[i].show();
  }
  
  if (recording) { saveFrame("image-####.gif"); }
  start += 1;
  if (start >= 90) {
    recording = false;
  }
}

class Card {
  float x,y,r,offset;
  PShape img;
  
  public Card(float x,float y,float r,float offset) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  public void show() {
    pushMatrix();
    translate(x,y);
    rotate(r);
    noStroke();
    fill(0);
    float radius = 22;
    ellipse(0,-9,radius,radius);
    fill(255);
    ellipse(0,9,radius,radius);
    popMatrix();
  }
  public void step() {
    this.r += radians(4);
  }
}


