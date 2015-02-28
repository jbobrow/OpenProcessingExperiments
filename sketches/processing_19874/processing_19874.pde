
//face stuff
PImage selectedImagea;
PImage selectedImageb;
PImage selectedImagec;
PImage selectedImaged;
float m;
float e;
float n;
float r;
float g;
float b;
PImage[] mouths = new PImage[4]; 
PImage[] eyes = new PImage[4];
PImage[] nose = new PImage[3];
PImage[] head = new PImage[3];
//Name stuff
String[] boyNames;
String[] girlNames;
String[] surNames;
String firstName = "";
String lastName = "";
boolean sex;
PFont fontA;

void setup() {
  size(500,600);
  smooth();
  fontA = loadFont("Moderna-32.vlw");
  boyNames = loadStrings("boynames.txt");
  girlNames = loadStrings("girlnames.txt");
  surNames = loadStrings("surnames.txt");
  sex = ( random(1.0f) < 0.5f ? true : false );
  firstName = makeName( sex );
  lastName = makeLastname();
  mouths[0] = loadImage("mouth1.png");
mouths[1] = loadImage("mouth2.png");
mouths[2] = loadImage("mouth3.png");
mouths[3] = loadImage("mouth4.png");

eyes[0] = loadImage("eyes1.png");
eyes[1] = loadImage("eyes2.png");
eyes[2] = loadImage("eyes3.png");
eyes[3] = loadImage("eyes4.png");

nose[0] = loadImage("nose1.png");
nose[1] = loadImage("nose2.png");
nose[2] = loadImage("nose3.png");

head[0] = loadImage("head1.png");
head[1] = loadImage("head2.png");
head[2] = loadImage("head3.png");
  generateFace();
}

void draw() {
  background(#666666);
  fill(255);
  textFont(fontA, 32);
  textAlign(CENTER);
  text( firstName + " " + lastName, width/2, height/1.1);
  image( selectedImaged, width/2 - 200,50 );
   image( selectedImagea, width/2 - 95, m + 50 );
   image( selectedImageb, width/2 - 140, e + 50 );
   image( selectedImagec, width/2 - 150, n + 50 );
   tint(r,r-g,r-b);
}

void generateFace(){
  selectedImaged = head[ (int)random(0, head.length) ];
selectedImagea = mouths[ (int)random(0, mouths.length) ];
selectedImageb = eyes[ (int)random(0, eyes.length) ];
selectedImagec = nose[ (int)random(0, nose.length) ];
m = random (130,270);
e = random (50, 78);
n = random (90, 110);
r = random (60, 200);
g = random (30, 60);
b = random (50, 50);
}


String makeName( boolean isMale ) {
  String aName = "";

  if ( isMale ) {
    int index = (int)random( boyNames.length - 1);
    aName = boyNames[index];
  }

  else {
    int index = (int)random( girlNames.length - 1 );
    aName = girlNames[index];
  }
  return aName;
}

String makeLastname() {
  String bName = "";
  int index = (int)random( surNames.length - 1 );
    bName = surNames[index];
    return bName;
}

void mousePressed() {
  sex = ( random(1.0f) < 0.5f ? true : false );
  firstName = makeName(sex);
  lastName = makeLastname();
  generateFace();
}


