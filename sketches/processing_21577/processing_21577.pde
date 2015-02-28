
/* Project 3B: Transformation for DMA 28 Winter 11 by Faustine Chia 
 
 Juraffe Clock
 Hello Kitty meets Pokemon: Giraffe Clock 
 
 Rotate = Seconds
 Hair = Hours (0=AM, 12=PM)
 Spots = Minutes
 
 */

PShape giraffe, hair;



void setup() {
  size(640, 480);
  smooth();

  giraffe = loadShape("giraffe_clock.svg");
  hair = loadShape("hair.svg");
}



void draw() {
  background(213,49,90);

  float h = hour();
  float hModulo = h%12;
//  if (h==0 && hModulo==0) {
//  }

  if (h==12 && hModulo==0) {
    hModulo = 12;
  }

  float m = minute();

  float s = second();
  float sMapped = map(s, 0, 60, 0, TWO_PI) - HALF_PI;

  // rotate = seconds
  translate(width/2, height/2);
  rotate(sMapped);
  pushMatrix();
  translate(-width/2, -height/2);


  // hour = hair 
  if (hModulo > 0) { // 1-2h
    pushMatrix();
    // rotate(radians(-1.5));
    shape(hair, 320, 98);
    // shape(hair, 320, 100);
    popMatrix();
  } 
  if (hModulo > 1) { // 2-3h
    pushMatrix();
    rotate(radians(-1.5));
    shape(hair, 319, 118);
    popMatrix();
  }
  if (hModulo > 2) { // 3-4h
    pushMatrix();
    rotate(radians(-1.5));
    shape(hair, 320, 130);
    popMatrix();
  }
  if (hModulo > 3) { // 4-5h
    pushMatrix();
    rotate(radians(-1.5));
    shape(hair, 321, 145);
    popMatrix();
  }
  if (hModulo > 4) { // 5-6h
    pushMatrix();
    rotate(radians(-1.5));
    shape(hair, 322, 160);
    popMatrix();
  }
  if (hModulo > 5) { // 6-7h
    pushMatrix();
    rotate(radians(-1.5));
    shape(hair, 322, 175);
    popMatrix();
  }
  if (hModulo > 6) { // 7-8h
    pushMatrix();
    rotate(radians(-1.5));
    shape(hair, 322, 190);
    popMatrix();
  }
  if (hModulo > 7) { // 8-9h
    pushMatrix();
    rotate(radians(-1.5));
    shape(hair, 322, 202.5);
    popMatrix();
  }
  if (hModulo > 8) { // 9-10h
    pushMatrix();
    rotate(radians(-1.5));
    shape(hair, 322, 217.5);
    popMatrix();
  }
  if (hModulo > 9) { // 10-11h
    pushMatrix();
    rotate(radians(-1.5));
    shape(hair, 322, 230);
    popMatrix();
  }
  if (hModulo > 10) { // 11-12h
    pushMatrix();
    rotate(radians(-1.5));
    shape(hair, 322, 242.5);
    popMatrix();
  }
  if (hModulo == 12) {//12-1h
    pushMatrix();
    rotate(radians(-1.5));
    shape(hair, 322, 255);
    popMatrix();
  }

  // giraffe 
  shape(giraffe, 190, 50);


  // minute = spots 
  fill(#D44812);
  // strokeWeight(.25);
  noStroke();

  // 1-10m
  if (m > -1) { // 0-1m DONE
    float w = 15; 
    if (m == 0) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(258, 313);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 0) { // 1-2m DONE
    float w = 15; 
    if (m == 1) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(316, 268);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 1) { // 2-3m DONE
    float w = 15; 
    if (m == 2) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(260, 234);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 2) { // 3-4m DONE
    float w = 15; 
    if (m == 3) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(256, 330);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 3) { // 4-5m DONE
    float w = 15; 
    if (m == 4) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(318, 287); // y: 272
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 4) { // 5-6m DONE
    float w = 15; 
    if (m == 5) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(293, 358);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 5) { // 6-7m DONE
    float w = 15; 
    if (m == 6) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(301, 317);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 6) { // 7-8m DONE
    float w = 15; 
    if (m == 7) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(271, 124);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 7) { // 8-9m DONE
    float w = 15; 
    if (m == 8) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(342, 283);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 8) { // 9-10m DONE
    float w = 15; 
    if (m == 9) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(279, 177);
    ellipse(30, 30, w, w);
    popMatrix();
  }



  // 11-20m
  if (m > 9) { // 10-11m DONE
    float w = 15; 
    if (m == 10) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(290, 90);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 10) { // 11-12m DONE
    float w = 15; 
    if (m == 11) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(354, 310);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 11) { // 12-13m DONE
    float w = 15; 
    if (m == 12) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(342, 355);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 12) { // 13-14m DONE
    float w = 15; 
    if (m == 13) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(296, 167);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 13) { // 14-15m DONE
    float w = 15; 
    if (m == 14) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(272, 273); 
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 14) { // 15-16m DONE
    float w = 15; 
    if (m == 15) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(301, 282);
    // translate(314, 270);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 15) { // 16-17m DONE
    float w = 15; 
    if (m == 16) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(280, 248);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 16) { // 17-18m DONE
    float w = 15; 
    if (m == 17) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    // translate(292, 352);
    translate(308, 364);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 17) { // 18-19m DONE
    float w = 15; 
    if (m == 18) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(354, 259);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 18) { // 19-20m DONE
    float w = 15; 
    if (m == 19) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(292, 106);
    ellipse(30, 30, w, w);
    popMatrix();
  }



  // 21-30m
  if (m > 19) { // 20-21m DONE
    float w = 15; 
    if (m == 20) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(293, 199);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 20 ) { // 21-22m DONE
    float w = 15; 
    if (m == 21) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    // translate(296, 355);
    translate(252, 348);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 21 ) { // 22-23m DONE
    float w = 15; 
    if (m == 22) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(290, 226);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 22 ) { // 23-24m DONE 
    float w = 15; 
    if (m == 23) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(272, 203);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 23 ) { // 24-25m DONE
    float w = 15; 
    if (m == 24) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(335, 262);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 24 ) { // 25-26m DONE
    float w = 15; 
    if (m == 25) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(284, 329);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 25 ) { // 26-27m DONE
    float w = 15; 
    if (m == 26) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(304, 248);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 26 ) { // 27-28m DONE 
    float w = 15; 
    if (m == 27) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(294, 145);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 27 ) { // 28-29m DONE
    float w = 15; 
    if (m == 28) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(322, 245);
    // translate(324, 289);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 28 ) { // 29-30m DONE  
    float w = 15; 
    if (m == 29) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(357, 276);
    // translate(326, 242);
    ellipse(30, 30, w, w);
    popMatrix();
  }



  // 31-40m
  if (m > 29 ) { // 30-31m DONE
    float w = 15; 
    if (m == 30) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(277, 307);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 30 ) { // 31-32m DONE
    float w = 15; 
    if (m == 31) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(262, 255);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 31 ) { // 32-33m DONE 
    float w = 15; 
    if (m == 32) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(344, 330);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 32 ) { // 33-34m DONE  
    float w = 15; 
    if (m == 33) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(306, 337);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 33 ) { // 34-35m DONE 
    float w = 15; 
    if (m == 34) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(296, 303);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 34 ) { // 35-36m DONE  
    float w = 15; 
    if (m == 35) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(327, 318);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 35 ) { // 36-37m DONE 
    float w = 15; 
    if (m == 36) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(281, 288);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 36 ) { // 37-38m DONE 
    float w = 15; 
    if (m == 37) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(303, 296);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 37 ) { // 38-39m DONE  
    float w = 15; 
    if (m == 38) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(353, 343);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 38 ) { // 39-40m DONE 
    float w = 15; 
    if (m == 39) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(290, 342);
    ellipse(30, 30, w, w);
    popMatrix();
  }



  // 41-50m
  if (m > 40 ) { // 41-42m DONE 
    float w = 15; 
    if (m == 41) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(330, 340);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 41 ) { // 42-43m DONE
    float w = 15; 
    if (m == 42) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(273, 220);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 42 ) { // 43-44m DONE
    float w = 15; 
    if (m == 43) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(309, 350);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 43 ) { // 44-45m DONE
    float w = 15; 
    if (m == 44) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(275, 99);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 44 ) { // 45-46m DONE 
    float w = 15; 
    if (m == 45) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(330, 357);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 45 ) { // 46-47m DONE 
    float w = 15; 
    if (m == 46) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(274, 341);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 46 ) { // 47-48m DONE 
    float w = 15; 
    if (m == 47) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(341, 246);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 47 ) { // 48-49m DONE
    float w = 15; 
    if (m == 48) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(274, 359);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 48 ) { // 49-50m DONE
    float w = 15; 
    if (m == 49) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(290, 120+50+50+50);
    ellipse(30, 30, w, w);
    popMatrix();
  }



  // 51-60m
  if (m > 49 ) { // 50-51m DONE
    float w = 15; 
    if (m == 50) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(279, 110);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 50 ) { // 51-52m DONE
    float w = 15; 
    if (m == 51) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(292, 180);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 51 ) { // 52-53m DONE
    float w = 15; 
    if (m == 52) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(291, 240);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 52 ) { // 53-54m DONE
    float w = 15; 
    if (m == 53) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(314, 256);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 53 ) { // 54-55m DONE
    float w = 15; 
    if (m == 54) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(263, 186);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 54 ) { // 55-56m DONE
    float w = 15; 
    if (m == 55) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    // translate(273, 231);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 55 ) { // 56-57m DONE
    float w = 15; 
    if (m == 56) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(282, 158);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 56 ) { // 57-58m DONE
    float w = 15; 
    if (m == 57) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(297, 124);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 57 ) { // 58-59m DONE 
    float w = 15; 
    if (m == 58) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(268, 167);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  if (m > 58 ) { // 59-60m DONE 
    float w = 15; 
    if (m == 59) { 
      w = map(s, 0, 60, 0, 15);
    }
    pushMatrix();
    translate(262, 214);
    ellipse(30, 30, w, w);
    popMatrix();
  }
  popMatrix();

  //// spot as cursor
  //  pushMatrix();
  //  translate(mouseX, mouseY);
  //  shape(hair, 0, 0);
  //  ellipse(0, 0, 15, 15);
  //  popMatrix();
}



//// plot dots
//void mousePressed() {
//  println("translate("+ mouseX +", "+ mouseY +");");
//}


