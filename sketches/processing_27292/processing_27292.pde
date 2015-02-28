
float a;
float b;
float c;
float d;

float e= random(0,200);
float f= random(0,200);
float g= random(0,200);
float h= random(0,200);

float c1;
float c2;
float c3;
float c4; 

PFont MaturaMT;
String Line1 = "To see a world in a grain of sand,";
String Line2 = "And a heaven in a wild fllower,";
String Line3 = "Hold infinity in the palm of your hand,";
String Line4 = "And eternity in an hour.";

void setup() {
  size(700, 600);
  colorMode(HSB,400,400,400);
  MaturaMT = loadFont("MaturaMTScriptCapitals-24.vlw");
  smooth();
  frameRate(15);
}

void draw() {

  background(0);
  textFont(MaturaMT);
  fill(400);

  textSize(24);
  textAlign(CENTER);

 // if (mousePressed) {
    if ((mouseX > 170) && (mouseX < 530) && (mouseY>200) && (mouseY<400)){
    a = random(0,600);
    b = random(0,600);
    c = random(0,600);
    d = random(0,600);
    
    c1 = random(0,400);
    c2 = random(0,400);
    c3 = random(0,400);
    c4 = random(0,400);


    fill(c1,400,400);
    text(Line1, mouseX-e, a);
    fill(c2,400,400);
    text(Line2, mouseX-f, b);
    fill(c3,400,400);
    text(Line3, mouseX-g, c);
    fill(c4,400,400);
    text(Line4, mouseX-h, d);
  } 
  else {
      text(Line1, width/2, 200);
      text(Line2, width/2, 250);
      text(Line3, width/2, 300);
      text(Line4, width/2, 350);
    }
  }



