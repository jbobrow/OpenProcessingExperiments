
PImage bg;
PImage HJG,HSH,JJW,KJC,KMH,MGH,PJS,PJY,SAS,SSJ;


void setup() {

  size(795,793);
  bg = loadImage("LOTTElineup.png");

  HJG = loadImage("HJG.png");
  HSH = loadImage("HSH.png");
  JJW = loadImage("JJW.png");
  KJC = loadImage("KJC.png");
  KMH = loadImage("KMH.png");
  MGH = loadImage("MGH.png");
  PJS = loadImage("PJS.png");
  PJY = loadImage("PJY.png");
  SAS = loadImage("SAS.png");
  SSJ = loadImage("SSJ.png");

  noStroke();
  smooth();
}



void draw() {
  background(bg);
 // text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY );


  if(mouseX >374 && mouseX < 422 && mouseY > 188 && mouseY <255) {
    image(JJW, 421,215);
  }
  if(mouseX >185 && mouseX < 237 && mouseY > 330 && mouseY <402) {
    image(KJC, 235,360);
  }
  if(mouseX >310 && mouseX < 360 && mouseY > 318 && mouseY <391) {
    image(MGH, 361,349);
  }
  if(mouseX >434 && mouseX < 484 && mouseY > 320 && mouseY <391) {
    image(PJS, 481,349);
  }
  if(mouseX >558 && mouseX < 609 && mouseY > 320 && mouseY <391) {
    image(SAS, 608,360);
  }
  if(mouseX >270 && mouseX < 322 && mouseY > 440 && mouseY <511) {
    image(HJG, 226,469);
  }
   if(mouseX >370 && mouseX < 422 && mouseY > 440 && mouseY <511) {
    image(SSJ, 423,489);
  }
  if(mouseX >470 && mouseX < 522 && mouseY > 440 && mouseY <511) {
    image(PJY, 519,469);
  }
  if(mouseX >370 && mouseX < 425 && mouseY > 555 && mouseY <626) {
    image(KMH, 421,590);
  }
   if(mouseX >568 && mouseX < 620 && mouseY > 550 && mouseY <620) {
    image(HSH, 619,580);
  }
}


