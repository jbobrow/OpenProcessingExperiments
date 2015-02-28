

int posX;
int posY;
int tock;
PFont font1;
PFont font2;
PFont font3;
PFont font4;
PFont font5;
PFont font6;
PFont font7;
PFont font8;

void setup() {
  size(600, 600);
  background(255);
  smooth();
  font1 = loadFont("SansSerif.plain-34.vlw");
  font2 = loadFont("SansSerif.plain-29.vlw");
  font3 = loadFont("SansSerif.plain-20.vlw");
  font4 = loadFont("SansSerif.plain-10.vlw");
  font5 = loadFont("SansSerif.plain-25.vlw");
  font6 = loadFont("SansSerif.plain-37.vlw");
  font7 = loadFont("SansSerif.plain-42.vlw");
  font8 = loadFont("SansSerif.plain-46.vlw");
  posX = 0;
  posY = 0;
  tock = 0;
}

void draw() {
  // draw textbodies and legs
  if (tock <= 1000) {
    posX=0;
    posY=0;
    background(255);
    fill(100, 20, 0);
    smooth();
    tock ++;
    //textbodies move with mouse
    posX = mouseX-300;
    posY = mouseY-300;
    textFont(font1);
    text("It's", 64 + posX, 37 + posY);
    text("funny", 38 - posX, 112 - posY);
    text("How", 241 - posX, 117 + posY);
    text("How", 236 - posY, 245 - posX);
    text("trying", 235 + posY, 328 + posX);
    text("how", 57 + posY, 140 + posX);
    text("are", 77 + posX, 207 - posY);
    text("stand", 47 - posX, 267 + posY);
    textFont(font2);
    text("which", 484 - posX, 250 - posY);
    text("is", 496 + posX, 271 - posY);
    text("at", 535 + posX + posY, 271 + posY);
    text("same", 493 + posX, 294 + posX);
    text("soinnate", 484 + posY, 338 - posX);
    text("initsmost", 480 + posY, 359 + posX);
    text("works", 226 - posY, 214 - posX);
    text("hard", 63 - posX, 161 + posY);
    text("we", 81 + posY, 184 + posX + posY);
    text("hard", 240 + posX, 264 - posY);
    textFont(font3);
    text("working", 57 + posX, 221 + posY);
    text("comprehend", 475 + posX, 190 - posY);
    textFont(font4);
    text("to", 89 + posX, 228 + posY);
    text("the", 517 - posY, 276 + posX);
    text("the", 524 - posY, 197 + posX);
    textFont(font5);
    text("our", 253 + posX, 138 - posY);
    text("under", 58 + posX, 243 - posY);
    text("system", 479 + posX, 230 + posY);
    text("complex", 477 + posY, 212 + posX);
    textFont(font6);
    text("body", 234 + posY, 193 - posX);
    text("we", 247 + posY, 287 + posX);
    text("are", 247 - posY, 306 + posX);
    text("to", 516 - posX, 135 - posY);
    text("time", 490 + posY, 321 - posX);
    text("Intimate Sense", 172 + posX, 529 + posY);
    stroke(0);
    strokeWeight(6);
    line(65, 270, 90, 400);
    line(90, 400, 60, 550);
    line(60, 550, 25, 590);
    line(25, 590, 70, 590);
    line(70, 590, 60, 550);
    line(115, 275, 105, 410);
    line(105, 410, 95, 560);
    line(95, 560, 80, 590);
    line(80, 590, 110, 590);
    line(110, 590, 95, 560);
    line(260, 340, 260, 465);
    line(260, 465, 270, 570);
    line(270, 570, 220, 590);
    line(220, 590, 270, 590);
    line(270, 590, 270, 570);
    line(310, 340, 335, 430);
    line(335, 430, 345, 555);
    line(345, 555, 340, 590);
    line(340, 590, 375, 590);
    line(375, 590, 345, 555);
    line(490, 370, 425, 550);
    line(425, 550, 375, 590);
    line(375, 590, 425, 590);
    line(425, 590, 425, 550);
    line(575, 375, 545, 565);
    line(545, 565, 520, 595);
    line(520, 595, 550, 590);
    line(550, 590, 545, 565);
  }
  // fade out after few seconds. Should wait long enough to read text
  else if (tock<=1100) {
    fill(255, 255, 255, 10);
    noStroke();
    rect(0, 0, 600, 600);
    tock ++;
    posX = 0;
    posY = 0;
  }
  // draw texthands
  else if (tock<=2000) {
      tock ++;
      fill(0);
      background(255);
      smooth();
      stroke(0);
      strokeWeight(6);
      line(57, 205, 70, 275);
      line(117, 180, 115, 260);
      line(193, 205, 145, 270);
      line(225, 275, 160, 310);
      line(55, 280, 95, 270);
      line(95, 270, 120, 275);
      line(120, 275, 165, 320);
      line(45, 360, 80, 385);
      line(130, 385, 185, 385);
      fill(100, 20, 0);
      if (tock < 1400) {
        posX ++;
      }
      if (tock >= 1400) {
        posX --;
      }
      textFont(font1);
      text("human", 120 + posX, 383);
      text("y", 512 - posX, 272);
      text("o", 522 - posX, 217);
      text("d", 391 - posX, 309);
      text("n", 368 - posX, 293);
      text("It", 40 + posX, 194);
      text("mind", 25 + posX, 394);
      textFont(font2);
      text("scious", 88 + posX, 357);
      text("a", 350 - posX, 276);
      text("b", 522 - posX, 193);
      textFont(font3);
      text("phy", 456 - posX, 165);
      text("most", 183 + posX, 192);
      text("al", 207 + posX, 179);
      textFont(font5);
      text("func", 359 - posX, 202);
      text("tion", 390 - posX, 233);
      text("ing", 415 - posX, 266);
      text("si", 466 - posX, 186);
      text("o", 472 - posX, 205);
      text("lo", 467 - posX, 225);
      text("gi", 467 - posX, 250);
      text("cal", 459 - posX, 277);
      textFont(font6);
      text("as", 225 + posX, 263);
      text("entities", 445 - posX, 400);
      text("rate", 482 - posX, 358);
      text("sepa", 405 - posX, 336);
      text("two", 445 - posX, 309);
      text("E", 407 - posX, 391);
      text("R", 378 - posX, 389);
      text("A", 347 - posX, 396);
      text("d", 515 - posX, 246);
      text("is", 103 + posX, 164);
      text("con", 26 + posX, 364);
      textFont(font7);
      text("though", 51 + posX, 309);
      textFont(font8);
      text("our", 64 + posX, 341);
    }
    //scrolling text.
    if (tock > 2000) {
      posX ++;
      tock ++;
      if ((posX > 600)||(posX < -40)) {
        posX = -35;
        posY +=80;
      }
      if (posY > 600) {
        posY = 40;
      }
      fill(0);
      background(255);
      smooth();
      stroke(0);
      strokeWeight(6);
      line(57, 205, 70, 275);
      line(117, 180, 115, 260);
      line(193, 205, 145, 270);
      line(225, 275, 160, 310);
      line(55, 280, 95, 270);
      line(95, 270, 120, 275);
      line(120, 275, 165, 320);
      line(45, 360, 80, 385);
      line(130, 385, 185, 385);
      fill(100, 20, 0);
      textFont(font6);
      text("We are just our frontal", posX, 140 + 1.5*posY);
      text("+ parietal lobes trying", posX+25, 215 + posY);
      text("to understand the rest of us", 2*posX+45, 290 + posY);
      text("- and the thought", posX+25, 365 + posY);
      text("makes one feel somewhat", 3*posX-30, 430 + 0.75*posY);
      textFont(font7);
      text("lonely",55,345);
    }
  }


