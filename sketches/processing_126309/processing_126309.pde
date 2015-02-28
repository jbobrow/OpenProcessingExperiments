
Card[] cards;
int nCards;
PShape cardImage;
int start;
boolean recording;

// Playing card image from
// https://code.google.com/p/vector-playing-cards/
// Byron Knoll

void setup() {
  size(500,727);
  smooth();
  
  cardImage = loadShape("2_of_clubs3.svg");
  cards = new Card[400];
  nCards = 400;
  for (int i=0; i<nCards; i+=1) {
    float x = random(0,width);
    float y = random(0,height);
    cards[i] = new Card(x,y,random(-PI,PI),cardImage);
  }
  
  // recording stuff
  start = 0;
  //recording = true;
}

void draw() {
  background(0);
  
  // draw small cards as background
  for (int i=start; i<nCards; i+=1) {
    cards[i].show();
  }
  for (int i=0; i<start; i+=1) {
    cards[i].show();
  }
  
  // big card over top
  pushMatrix();
  scale(2.98);
  shape(cardImage, 0, 0);
  popMatrix();
  
  // recording stuff
  //if (recording) { saveFrame("image-####.gif"); }
  start += 10;
  if (start >= nCards) { 
    start = start % nCards;
    //recording = false;
  }
}

class Card {
  float x,y,r;
  PShape img;
  boolean selected;
  
  public Card(float x,float y,float r,PShape img) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.img = img;
  }
  public void show() {
    pushMatrix();
    translate(x,y);
    rotate(r);
    scale(0.5);
    translate(-80,-120);
    stroke(255); 
    fill(255);
    rect(-1,-1,168,244,8);
    shape(img, 0, 0);
    popMatrix();
  }
  public void updatePosition(float x,float y) {
    this.x = x;
    this.y = y;
  }
  public void updateAngle(float delta) {
    this.r += radians(delta);
  }
}


