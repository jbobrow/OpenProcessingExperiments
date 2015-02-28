
/*
Pearlyn Lii
 ID3 - Spring 2013
 Boundaries
 02/07/13
 */

PImage bed;
PImage carrot_chimp;
PImage chimp_1;
PImage comp_chimp;
PImage eating_chimp;
PImage fridge;
PImage hanging_chimp;
PImage mib_chimps;
PImage non_chimp;
PImage pres_chimp;
PImage bg;

void setup() {
  size(800, 500);
  bg = loadImage("room.png");
  fridge = loadImage("fridge.png");
  carrot_chimp = loadImage("carrot_chimp.png");
  bed = loadImage("bed.png");
  chimp_1 = loadImage("chimp_1.png");
  mib_chimps = loadImage("mib_chimps.png");
  eating_chimp = loadImage("eating_chimp.png");
  pres_chimp = loadImage("pres_chimp.png");
  hanging_chimp = loadImage("hanging_chimp.png");
  non_chimp = loadImage("non_chimp.png");
  comp_chimp = loadImage("comp_chimp.png");

  frameRate(random(1,2.6));
  imageMode(CENTER);
}

void draw() {
  background(0);
  float ccx = random(405, 480);
  float c1x = random(20, 700);
  float c2x = random(300, 600);
  float mibx = random(600, 605);
  float ecx = random(300, 320);
  float ech = random(100, 140);
  float pcx = random(360, 460);
  float hcy = random(120, 130);
  float ncx = random(240, 242);
  image(bg, width/2, height/2, width, height);
  image(fridge, width/2, height/2);
  image(hanging_chimp, 380, hcy);
  image(carrot_chimp, ccx, height/2-50);
  image(eating_chimp, ecx, height/2-30, ech, ech);
  image(bed, width/2, height/2, width, height);
  image(mib_chimps, mibx, height/2+15);
  image(pres_chimp, pcx*2, height/2-80 );
  image(non_chimp, ncx, height/2-32);
  image(comp_chimp, 372, height/2-26, 108, 78);
  image(chimp_1, c1x, height/2);
}



