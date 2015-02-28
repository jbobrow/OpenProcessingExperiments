
PImage blanktemp;

PImage Blue;
PImage Red;
PImage Green;
PImage Yellow;
PImage Purple;

PImage Tweed;
PImage Foil;
PImage Sequin;
PImage Plaid;
PImage Cheetah;
PImage Snow;
PImage Riisa;

PImage FoilP;
PImage SequinP;
PImage CheetahP;
PImage PlaidP;
PImage RiisaP;
PImage SnowP;

PImage BlueB;
PImage RedB;
PImage GreenB;
PImage YellowB;
PImage PurpleB;

void setup () {
  size (640, 480);
  smooth ();
  noStroke ();
  background (255);
  
  blanktemp = loadImage ("Temp.png");
  image (blanktemp, 0, 0);
  
  Blue = loadImage ("BlueS.png");
  Red = loadImage ("Red.png");
  Green = loadImage ("Green.png");
  Yellow = loadImage ("Yellow.png");
  Purple = loadImage ("Purple.png");

  Foil = loadImage ("Foil.png");
  Sequin = loadImage ("Sequin.png");
  Plaid = loadImage ("Plaid.png");
  Cheetah = loadImage ("Cheetah.png");
  Snow = loadImage ("Snow.png");
  Riisa = loadImage ("Riisa.png");
  
  FoilP = loadImage ("FoilP.png");
  CheetahP = loadImage ("CheetahP.png");
  SequinP = loadImage ("SequinP.png");
  PlaidP = loadImage ("PlaidP.png");
  RiisaP = loadImage ("RiisaP.png");
  SnowP = loadImage ("SnowP.png");
  
  BlueB = loadImage ("BlueB.png");
  RedB = loadImage ("RedB.png");
  GreenB = loadImage ("GreenB.png");
  YellowB = loadImage ("YellowB.png");
  PurpleB = loadImage ("PurpleB.png");
  
  noLoop();
  
}

void draw () {
  background(255);
  image (blanktemp, 0, 0);
  
  PImage shirt [] = {Blue, Red, Green, Yellow, Purple};
  PImage shirtc = shirt[int(random(0, shirt.length))];
  image (shirtc, 0, 0);
  
  PImage shoulder [] = {Sequin, Foil, Plaid, Cheetah, Riisa, Snow};
  PImage shoulderp = shoulder [int(random(0, shoulder.length))];
  image (shoulderp, 0, 0);
  
  PImage pocket [] = {FoilP, SequinP, CheetahP, RiisaP, SnowP, PlaidP};
  PImage pocketp = pocket [int(random(0, pocket.length))];
  image (pocketp, 0, 0);
  
  PImage button [] = {BlueB, RedB, GreenB, YellowB, PurpleB};
  PImage buttonc = button [int(random(0, button.length))];
  image (buttonc, 0, 0);
}

void mousePressed() {
  redraw();
  
}



