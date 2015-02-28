
int value;
PImage a;
PImage b;
PImage c;
PImage d;
PImage hand;


void setup() {
  size (800, 600);

  a= loadImage("001.jpg");
  b= loadImage("002.jpg");
  c= loadImage("003.jpg");
  d= loadImage("004.jpg");
  hand= loadImage("hand.png");
  imageMode(CENTER);
  noCursor();
}


  
void draw () {
  image(a, 400, 300, a. width/4, a. height/4);
  if (mousePressed){
    image(c, 400, 300, c. width/4, c. height/4);
  }
    image(hand, mouseX, mouseY, hand.width/5, hand.height/5);
  }
  
 



