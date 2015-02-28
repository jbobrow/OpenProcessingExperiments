
//BKGRND
//PImage[] bk = new PImage[(7)];
//
//PImage bigmach;
//PImage bighob;
//PImage biggall;
//PImage bigspin;
//PImage biglock;
//PImage bigruse;
//PImage bigvolt;

//HEADS
PImage volt;
PImage lock;
PImage mach;
PImage spin;
PImage ruse;
PImage hob;
PImage gall;

//VARIABLES
float r;
float x, y;
float s;

//WORDS
PFont font;

String[]words = {"you learned about twenty different synonyms for 'sovereign'.",
"you wipe your enemies out of existence by not believing in them.",
"you spell it 'Warre'.",
"After Reading Leviathan, Uncapitalized Words Look Unnatural.", 
"'Isaac and the Newtons' sounds like a pretty good band name.",
"pick up acorns, claim property",
"your point is not proven until you say 'Q.E.D.'.",
"it's not cheating, it's division of labour",
"blame France for making the Enlightenment",
"blame France for breaking the Enlightenment",
"there will never again be a bomb genius the way Newton was a bomb genius",
"cry under a tree, get enlightened",
"'Common Sense' was the most eloquent possible way Paine could have said 'STFU BURKE'",
"you'd pay good money to see Voltaire vs. Marx: The Sarcasm Showdown",
"you no longer have to think about how to spell bourgeoisie",
"Marx x Engels: best intellectual bromance ever",
"socially unacceptable? move to Holland."};


void setup() {
  size (640,480);
  background(255);
  smooth();
  
  //BKGRND
//  bk[0] = loadImage("huge1.png");
//  bk[1] = loadImage("huge2.png");
//  bk [2] = loadImage("huge3.png");
//  bk [3] = loadImage("huge4.png");
//  bk [4] = loadImage("huge5.png");
//  bk [5] = loadImage("huge6.png");
//  bk [6] = loadImage("huge7.png");
 
  //HEADS
  mach = loadImage ("phil1.png");
  hob = loadImage ("phil2.png");
  gall = loadImage ("phil3.png");
  spin = loadImage ("phil4.png");
  lock= loadImage ("phil5.png");
  ruse = loadImage ("phil6.png");
  volt = loadImage ("phil7.png");

  //WORDS
  font = loadFont("SynchroLET-48.vlw");
  textFont(font);
  

}

void draw() {
  background (255);
  noLoop();
  
  //RANDOM BKGRND
//  image(bk[int(random(0,7))], 0,0, width, height);

  //RANDOM POSITION
  x= random(mach.width/2, width-(mach.width/2));
  y= random(mach.height/2, height-(mach.height/2));
  r=random (0, radians(360));
  s=random(0.5,1.1);

  //RANDOM NUMBERS
  float num=random(4);
  float num2=random(4);
  float num3=random(50);

  //RANDOM SCALE
  float scl = random (2.5, 7.5); //bigass random scale
  float scl2 = random (0.5, 1.5); //normal random scale
  float sm = random (0.5, 1);

  //RANDOM ROTATION
  float rm = random (0, radians(360));
  float rh = random (0, radians(360));
  
  //BIGASS MACH
  pushMatrix();
  translate(x,y);
  rotate (rm);
  scale(scl);
  image(mach, 0, 0);
  if (num<=2){
    scale (sm/2);
    rotate (radians(40));
    image (mach, 50, 0); 
  }
  popMatrix();

  //BIGASS GALL
  pushMatrix();
  translate(x,y);
  rotate (rh);
  scale(scl);
  image(gall, 0, 0);
  popMatrix();

  //BIGASS HOB
  pushMatrix();
  translate(x,y);
  rotate (rm);
  scale(scl);
  image(hob, 0, 0);
  popMatrix();

  //BIGASS SPIN
  pushMatrix();
  translate(x,y);
  rotate (rm/4);
  scale(scl);
  image(spin, 0, 0);
  popMatrix();

  //BIGASS LOCK
  pushMatrix();
  translate(x,y);
  rotate (rm);
  scale(scl);
  image(lock, 0, 0);
  popMatrix();

  //BIGASS RUSE
  pushMatrix();
  translate(x,y);
  rotate (rm*4);
  scale(scl);
  image(ruse, 0, 0);
  popMatrix();

  //BIGASS VOLT
  pushMatrix();
  translate(x,y);
  rotate (rm*5);
  scale(scl);
  image(volt, 0, 0);
  popMatrix();

  //MACH
  pushMatrix();
  translate(x,y);
  rotate (rm);
  scale(scl2);
  image(mach, 0, 0);
  popMatrix();

  //HOB
  pushMatrix();
  translate(x,y);
  rotate (rm*10);
  scale(scl2);
  image(hob, 0, 0);
  popMatrix();

  //GALL
  pushMatrix();
  translate(x,y);
  rotate (rm*3);
  scale(scl2);
  image(gall, 0, 0);
  popMatrix();

  //SPIN
  pushMatrix();
  translate(x,y);
  rotate (rm*4);
  scale(scl2);
  image(spin, 0, 0);
  popMatrix();  

  //LOCK
  pushMatrix();
  translate(x,y);
  rotate (rm*5);
  scale(scl2);
  image(lock, 0, 0); 
  popMatrix();

  //RUSE
  pushMatrix();
  translate(x,y);
  rotate (rm*6);
  scale(scl2);
  image(ruse, 0, 0);
  popMatrix();

  //VOLT
  pushMatrix();
  translate(x,y);
  rotate (rm*7);
  scale(scl2);
  image(volt, 0, 0); 
  popMatrix();
  
  //SCREEN
  fill(0,0,0,20);
  quad(0,0,0,height,width,height,width,0);
  
  //TEXT  
  fill(89,232,14);
  textAlign(CENTER);
  String a = words[int(random(0, words.length))];
  text(a, 0, 190, 640, 480);
  
}



void mousePressed() {
  redraw();
  
   

}



