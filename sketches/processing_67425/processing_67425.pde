
PImage bg;
PImage PYT,JIY,OJH,SDW,LJY,KTH,LBG,LLBG,KTG,KGS;
/*boolean showIt = false;
 int A=mouseX;
 int B=mouseY;*/

void setup() {

  size(795,793);
  bg = loadImage("LGlineup.png");

  PYT = loadImage("parkyoongtaek.png");
  JIY = loadImage("JIY.png");
  OJH = loadImage("OJH.png");
  SDW = loadImage("SDW.png");
  LJY = loadImage("LJY.png");
  KTH = loadImage("KTH.png");
  LBG = loadImage("LBG.png");
  LLBG = loadImage("LLBG.png");
  KTG = loadImage("KTG.png");
  KGS = loadImage("KGS.png");

  noStroke();
  smooth();
}


//312 322
void draw() {
  background(bg);
  //text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY );


  if(mouseX >374 && mouseX < 422 && mouseY > 188 && mouseY <255) {
    image(JIY, 420,215);
  }
  if(mouseX >185 && mouseX < 237 && mouseY > 330 && mouseY <402) {
    image(PYT, 233,360);
  }
  if(mouseX >310 && mouseX < 360 && mouseY > 318 && mouseY <391) {
    image(OJH, 356,349);
  }
  if(mouseX >434 && mouseX < 484 && mouseY > 320 && mouseY <391) {
    image(SDW, 480,349);
  }
  if(mouseX >558 && mouseX < 609 && mouseY > 320 && mouseY <391) {
    image(LJY, 605,360);
  }
  if(mouseX >270 && mouseX < 322 && mouseY > 440 && mouseY <511) {
    image(KTH, 220,469);
  }
   if(mouseX >370 && mouseX < 422 && mouseY > 440 && mouseY <511) {
    image(KGS, 422,489);
  }
  if(mouseX >470 && mouseX < 522 && mouseY > 440 && mouseY <511) {
    image(LBG, 519,469);
  }
  if(mouseX >175 && mouseX < 232 && mouseY > 550 && mouseY <624) {
    image(LLBG, 127,580);
  }
  if(mouseX >370 && mouseX < 425 && mouseY > 555 && mouseY <626) {
    image(KTG, 420,584);
  }
}


