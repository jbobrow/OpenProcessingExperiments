
Page b1, b12, b13, b14, e1, e2, q1, e3, a1, e4, e5, e6;
Tool b2, b3, b4, b5, b6, b7, b8, b9, b10, b11;
font f1, f2, f3;
gameTool welder, plus, minus, wrench;
finish n1, n2, n29, n3, n32, n37, n4, n42, n5, n51, n6, n61, n7, n71, n8, n81, n9, g1, g2, n10, n101;
brobot c1, c2, c3, c4, c5, c6;


//INT
int x = 480;
int page = 1;
int startTime = 0;

//FONT
PFont f, o;

//SHAPE
PShape s, h, a, p, e, ss, hh, aa, pp, ee, sh, sa, sp, se, hs, ha, ha1, ha2, ha3, hp, hp1, he, as, as1, as2, as3, ah, ap, ah2, ap2, fan, narr, narr2, quote, chunk1, chunk2, chunk3, chunk4, chunk5, chunk6, arm, go;


//IMAGE
PImage image1, image2, image3, image4;

void setup () {
  background (0);
  smooth ();
  noStroke ();
  size (640, 480);

  //SHAPE
  s = loadShape ("title screen.svg");
  h = loadShape ("small gear.svg");
  a = loadShape ("med gear.svg");
  p = loadShape ("big gear.svg");
  e = loadShape ("screwdriver.svg");
  ss = loadShape ("black.svg");
  hh = loadShape ("screwdriver1.svg");
  aa = loadShape ("narration.svg");
  pp = loadShape ("instruction.svg");
  ee = loadShape ("inside.svg");
  sa = loadShape ("welder.svg");
  sp = loadShape ("phillips.svg");
  se = loadShape ("negative.svg");
  hs = loadShape ("wrench.svg");
  ha = loadShape ("fredwire.svg");
  ha1 = loadShape ("fbluewire.svg");
  ha2 = loadShape ("redwire.svg");
  ha3 = loadShape ("bluewire.svg");
  hp = loadShape ("screw0.svg");
  hp1 = loadShape ("screw00.svg");
  he = loadShape ("screw3.svg");
  as = loadShape ("bolt0.svg");
  as1 = loadShape ("bolt1.svg");
  as2 = loadShape ("bolt2.svg");
  as3 = loadShape ("bolt3.svg");
  ah = loadShape ("inside big.svg");
  ap = loadShape ("inside small.svg");
  ah2 = loadShape ("inside big.svg");
  ap2 = loadShape ("inside small.svg");
  fan = loadShape ("fan.svg");
  narr = loadShape ("narration2.svg");
  quote = loadShape ("narration21.svg");
  narr2 = loadShape ("narration3.svg");
  chunk1 = loadShape ("chunk.svg");
  chunk2 = loadShape ("chunk2.svg");
  chunk3 = loadShape ("chunk3.svg");
  chunk4 = loadShape ("chunk4.svg");
  chunk5 = loadShape ("chunk5.svg");
  chunk6 = loadShape ("finalchunk.svg");
  arm = loadShape ("inside arm.svg");
  go = loadShape ("gameover.svg");

  //IMAGE
  image1 = loadImage ("negative.png");
  image2 = loadImage ("welder.png");
  image3 = loadImage ("wrench.png");
  image4 = loadImage ("phillips.png");

  //FONT
  f = loadFont ("ArialMT-24.vlw");
  o = loadFont ("ArialMT-18.vlw");

  f1 = new font (293, x - 60);
  f2 = new font (243, x - 30);
  f3 = new font (518, x - 40);

  //TITLE PAGE
  b1 = new Page (0, 0);
  e1 = new Page (282, x - 362); //GLOWY EYES LEFT
  e2 = new Page (360, x - 362); //GLOWY EYES RIGHT
  q1 = new Page (380, x - 268);
  b12 = new Page (0, 0);
  e3 = new Page (148, x - 304);

  //NARRATION
  c1 = new brobot (204, x - 410);
  c2 = new brobot (144, x - 350);
  c3 = new brobot (194, x - 280);
  c4 = new brobot (144, x - 250);
  c5 = new brobot (174, x - 130);
  c6 = new brobot (145, x - 332);

  //PLAY PAGE
  a1 = new Page (97, x - 479);
  b2 = new Tool (195, x - 236);
  b3 = new Tool (115, x - 192);
  b4 = new Tool (80, x - 149);
  b5 = new Tool (276, x - 69);
  b6 = new Tool (459, x - 236);
  b7 = new Tool (535, x - 192);
  b8 = new Tool (572, x - 149);
  b9 = new Tool (386, x - 69);
  b10 = new Tool (230, x - 35);
  b11 = new Tool (435, x - 35);

  welder = new gameTool (0, 0);
  plus = new gameTool (0, 0);
  minus = new gameTool (0, 0);
  wrench = new gameTool (0, 0);

  n1 = new finish (435, x - 408);
  n2 = new finish (255, x - 370);
  n3 = new finish (309, x - 354); // BIG GEAR MOVE
  n32 = new finish (259, x - 404); // BIG GEAR STABLE
  n4 = new finish (284.5, x - 277.5); // SMALL GEAR MOVE
  n42 = new finish (257, x - 305); // SMALL GEAR STABLE
  n5 = new finish (411, x - 406);
  n6 = new finish (562, x - 402);
  n7 = new finish (414, x - 220);
  n8 = new finish (563, x - 215);
  n9 = new finish (508, x - 310);
  g1 = new finish (359, x - 252);
  g2 = new finish (309, x - 305);
  n10 = new finish (501, x - 385);

  //BOLT HEAD SMALL
  n37 = new finish (284, x - 278);

  //BOLT HEAD BIG
  n29 = new finish (304, x - 358);

  //SCREWDRIVER PLUS
  n51 = new finish (416, x - 404);
  n61 = new finish (564, x - 402);
  n71 = new finish (418, x - 217);
  n81 = new finish (566, x - 213);

  //SCREWDRIVER MINUS
  n101 = new finish (506, x - 382);
  e4 = new Page (544, x - 379);
  e5 = new Page (558, x - 379);
  e6 = new Page (532, x - 379);
}

void draw () {
  //Page 1: Title Page
  if (page == 1) {
    //BACKGROUND
    b1.black();
    //GEAR
    b4.small();
    b8.small();
    b3.med();
    b7.med();
    b2.large();
    b6.large();
    //EMBLEM
    b1.title();
    //COMMAND
    if ((mouseX > 293) && (mouseX < 375) &&
      (mouseY < x - 53) && (mouseY > x - 80)) {
      f1.play();
      b5.screwdriver();
      b9.screwdriver();
    } 
    else {
      textFont(f);
      fill(255);
      text("P L A Y", 293, x - 60);
    }
    if ((mouseX > 251) && (mouseX < 415) &&
      (mouseY < x - 27) && (mouseY > x - 40)) {
      f2.instructions();
      b10.screwdriver1();
      b11.screwdriver1();
    } 
    else {
      textFont(o);
      fill(255);
      text("I N S T R U C T I O N S", 243, x - 30);
    }
  }

  //Page 2: Narration 
  else if (page == 2) {
    b1.narration();
    if (millis() > startTime + 4000) { 
      page = 21;
    }
  }

  //Page 2.1: Narration 2
  else if (page == 21) {
    b1.narration2();
    e1.eye();
    e2.eye();
    if ((millis() > startTime + 6000) && (millis() < startTime + 8000)) { 
      q1.quote();
    } 
    else {
    }
    if (millis() > startTime + 8000) {
      page = 22;
    }
  }

  //Page 2.2: Narration 3
  else if (page == 22) {
    pushMatrix();
    b12.narration3();
    popMatrix();
    if ((mouseX > 130) && (mouseX < 288) &&
      (mouseY < x - 22) && (mouseY > x - 450)) {
      c6.chunksix();
    } 
    else {
      c1.chunkone();
      c2.chunktwo();
      c3.chunkthree();
      c4.chunkfour();
      c5.chunkfive();
    }
  }

  //Page 3: Instructions
  else if (page == 3) {
    b1.instruction();
    e3.eye();
    if ((mouseX > 512) && (mouseX < 603) &&
      (mouseY < x - 20) && (mouseY > x - 57)) {
      f3.play();
    } 
    else {
      textFont (f);
      fill (255);
      text ("P L A Y", 518, x - 40);
    }
  }

  //Page 4: Game
  else if (page == 4) {
    b1.game();
    if (welder.selected == true) {
      cursor (image2, 0, 30);
    } 
    else if (plus.selected == true) {
      cursor (image4, 5, 28);
    } 
    else if (minus.selected == true) {
      cursor (image1, 5, 28);
    } 
    else if (wrench.selected == true) {
      cursor (image3, 0, 30);
    }

    //INSIDE
    //WELDING
    if (n1.product == true) {
      n1.weld();
    } 
    else {
      n1.weld3();
    }
    if (n2.product == true) {
      n2.weld2();
    } 
    else {
      n2.weld4();
    }
    //WELD ARM
    if ((n1.product == true) && (n2.product == true)) {
      a1.arm1();
    } 
    else {
      a1.arm();
    }

    //WRENCH BIG WHEEL
    if (n3.product == true) {
      n3.bstable();
    } 
    else {
      n32.bmove();
    }
    if (n29.product == true) {
      n29.bolt1();
    }
    else {
      n29.bolt2();
    }
    //BIG WHEEL BOT
    if ((n4.product == true) && (n3.product == true)) {
      g1.bstable();
    } 
    else {
      g2.bmove();
    }

    //WRENCH SMALL WHEEL
    if (n4.product == true) {
      n4.sstable();
    } 
    else {
      n42.smove();
    }
    if (n37.product == true) {
      n37.bolt0();
    } 
    else {
      n37.bolt3();
    }

    //SCREWDRIVER PLUS
    if (n5.product == true) {
      n51.screw0();
    } 
    else {
      n5.screw3();
    }
    if (n6.product == true) {
      n61.screw0();
    } 
    else {
      n6.screw3();
    }
    if (n7.product == true) {
      n71.screw0();
    } 
    else {
      n7.screw3();
    }    
    if (n8.product == true) {
      n81.screw0();
    } 
    else {
      n8.screw3();
    }

    //CIRCUIT BOARD
    if ((n5.product == true) && (n6.product == true) && (n7.product == true) && (n8.product == true)) {
      n9.fan();
    } 
    else {
      n9.fan1();
    }

    //SCREWDRIVER MINUS
    if (n10.product == true) {
      n101.screw00();   
      e4.eye1();
      e5.eye1();
      e6.eye1();
    }
    else {
      n10.screw3();
    }

    //END OF GAME 
    if ((n5.product == true) && (n6.product == true) && (n7.product == true) && (n8.product == true) && (n10.product == true) && (n3.product == true) && (n4.product == true) && (n2.product == true) && (n1.product == true)) {
      page = 5;
    } 
    else {
      page = 4;
    } 
  }

  //PAGE 5: END
  else if (page == 5) {
    b1.end();
    cursor (ARROW);
    if (key == 'y') {
      page = 2;
      startTime = millis();
      n1.product = false;
      n2.product = false;
      n3.product = false;
      n4.product = false;
      n5.product = false;
      n6.product = false;
      n7.product = false;
      n8.product = false;
      n10.product = false;
      n29.product = false;
      n37.product = false;
    } 
    else if (key == 'n') {
      page = 1;
      n1.product = false;
      n2.product = false;
      n3.product = false;
      n4.product = false;
      n5.product = false;
      n6.product = false;
      n7.product = false;
      n8.product = false;
      n10.product = false;
      n29.product = false;
      n37.product = false;
    }
  }
}


void mousePressed () {
  //Page 1: Title Page
  if (page == 1) {
    if ((mouseX > 293) && (mouseX < 375) &&
      (mouseY < x - 53) && (mouseY > x - 80)) {
      page = 2; 
      startTime = millis();
    }
    else if ((mouseX > 251) && (mouseX < 415) &&
      (mouseY < x - 27) && (mouseY > x - 40)) {
      page = 3;
    }
  }

  //Page 2: Narration
  //Page 2.2: Narration 3
  if (page == 22) {
    b12.narration3();
    if ((mouseX > 130) && (mouseX < 288) &&
      (mouseY < x - 22) && (mouseY > x - 450)) {
      page = 4;
      startTime = millis();
    } 
    else {
      page = 22;
    }
  }

  //Page 3: Instructions
  if (page == 3) {
    if ((mouseX > 518) && (mouseX < 600) &&
      (mouseY < x - 30) && (mouseY > x - 55)) {
      page = 2;
      startTime = millis();
    } 
    else {
      page = 3;
    }
  }

  //Page 4: Game
  //TOOLS
  if (page == 4) {
    if ((mouseX > 9) && (mouseX < 110) &&
      (mouseY < x - 150) && (mouseY > x - 246)) {
      welder.selected = true;
      plus.selected = false;
      minus.selected = false;
      wrench.selected = false;
    }
    else if ((mouseX > 111) && (mouseX < 215) &&
      (mouseY < x - 48) && (mouseY > x - 149)) {
      welder.selected = false;
      plus.selected = true;
      minus.selected = false;
      wrench.selected = false;
    }
    else if ((mouseX > 9) && (mouseX < 110) &&
      (mouseY < x - 48) && (mouseY > x - 149)) {
      welder.selected = false;
      plus.selected = false;
      minus.selected = true;
      wrench.selected = false;
    }
    else if ((mouseX > 111) && (mouseX < 215) &&
      (mouseY < x - 150) && (mouseY > x - 246)) {
      welder.selected = false;
      plus.selected = false;
      minus.selected = false;
      wrench.selected = true;
    } 

    //INSIDE THE ROBOT
    //WELDER
    if (welder.selected == true) {
      if ((mouseX > 432) && (mouseX < 473) &&
        (mouseY < x - 353) && (mouseY > x - 391)) {
        n1.product = true;
      }
      if ((mouseX > 497) && (mouseX < 539) &&
        (mouseY < x - 353) && (mouseY > x - 391)) {
        n2.product = true;
      }
    }
    //WRENCH
    if (wrench.selected == true) {
      //BIG GEAR BOLT
      if ((mouseX > 349) && (mouseX < 397) &&
        (mouseY < x - 330) && (mouseY > x - 367)) {
        n29.product = true;
      }
      if ((mouseX > 299) && (mouseX < 332) &&
        (mouseY < x - 338) && (mouseY > x - 362)) {
        n3.product = true;
      }
      //SMALL GEAR BOLT
      if ((mouseX > 307) && (mouseX < 321) &&
        (mouseY < x - 266) && (mouseY > x - 283)) {
        n37.product = true;
      }
      if ((mouseX > 273) && (mouseX < 294) &&
        (mouseY < x - 271) && (mouseY > x - 285)) {
        n4.product = true;
      }
    }
    //SCREWDRIVER PLUS
    if (plus.selected == true) {
      //TOP LEFT
      if ((mouseX > 420) && (mouseX < 460) &&
        (mouseY < x - 395) && (mouseY > x - 415)) {
        n5.product = true;
      }

      //TOP RIGHT
      if ((mouseX > 591) && (mouseX < 621) &&
        (mouseY < x - 395) && (mouseY > x - 415)) {
        n6.product = true;
      }

      //BOTTOM LEFT
      if ((mouseX > 432) && (mouseX < 467) &&
        (mouseY < x - 205) && (mouseY > x - 229)) {
        n7.product = true;
      }

      //BOTTOM RIGHT
      if ((mouseX > 582) && (mouseX < 617) &&
        (mouseY < x - 195) && (mouseY > x - 215)) {
        n8.product = true;
      }
    }
    //SCREWDRIVER MINUS
    if (minus.selected == true) {
      if ((mouseX > 509) && (mouseX < 545) &&
        (mouseY < x - 365) && (mouseY > x - 385)) {
        n10.product = true;
      }
    }
  }
}


























