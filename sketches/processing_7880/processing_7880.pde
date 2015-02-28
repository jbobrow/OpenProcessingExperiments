
//int x = 10;
int y = 0;
int pattern = 1;
int r = 0;


void setup() {
  size(640, 480);
  //background( 230, 224, 210);
  smooth();
  //noLoop();


}


void draw() {

  //grid map

  float gx = map( mouseX, 0, width, 0, 10);
  float ga = map( mouseX, 0, 255, 0, 600);

  //detail map

  float da = map( mouseX, 0, 255, 0, 350);
  float dx = map( mouseX, 0, width, 0, 2);

  //color 1 map

  float cx = map( mouseX, 0, width, 0, 10);
  float ca = map( mouseX, 0, 255, 0, 200);

  // color overlay map
  float ox = map( mouseX, 0, width, 0, 10);
  float oa = map( mouseX, 0, 255, 0, 160);

  // shadow map
  float sa = map( mouseX, 0, 255, 0, 250);
  float sx = map( mouseX, 0, width, 0, 2);

  // highlight map
  float hx = map( mouseX, 0, width, 0, 10);
  float ha = map( mouseX, 0, 255, 0, 180);

  //float random


  /*boolean (r < .5) = true;
   if (r == true) {
   plaidpatternSHADOW(sx -2, y, sa - 200);
   plaidpatternCOLOR1(cx -10, y, ca - 100);
   plaidpatternCOLOROVERLAY(ox -10, y, oa - 200);
   plaidpatternGRID(gx - 10, y, ga);
   plaidpatternDETAIL(dx -2, y, da);
   plaidpatternHIGHLIGHT(hx -10, y, ha - 200);
   return;
   }
   if (!r  == true) {
   crosshatchGRID(gx - 10, y, ga);
   crosshatchCOLOROVERLAY(ox -10, y, oa - 200);
   crosshatchSHADOW(cx -10, y, ca - 100);
   crosshatchHIGHLIGHT(hx -10, y, ha - 200);
   return;
   }
   
   
   
   
   */
  if (mouseX <= 0) {
    float fr = random(0,4);
    r = (int) fr;
  }

  //r = 0;

  println(r);
  if (r == 1) {
    plaidpatternSHADOW(sx -2, y, sa - 200);
    plaidpatternCOLOR1(cx -10, y, ca - 100);
    plaidpatternCOLOROVERLAY(ox -10, y, oa - 200);
    plaidpatternGRID(gx - 10, y, ga);
    plaidpatternDETAIL(dx -2, y, da);
    plaidpatternHIGHLIGHT(hx -10, y, ha - 200);

  }

  else if (r == 2) {
    crosshatchGRID(gx - 10, y, ga);
    crosshatchCOLOROVERLAY(ox -10, y, oa - 200);
    crosshatchSHADOW(cx -10, y, ca - 100);
    crosshatchHIGHLIGHT(hx -10, y, ha - 200);

  } 
  else if (r == 3) {
    pixelCOLOR1(gx - 10, y, ga);
    pixelCOLOR2(dx -2, y, da);
    pixelCOLOR3(ox -10, y, oa - 100);
    pixelCOLOR4(hx -10, y, ha - 200);
    pixelGRID(gx - 10, y, ga);

  }
  // }
}


//r = 0;


//  pixelCOLOR1(gx - 10, y, ga);
//  pixelCOLOR2(dx -2, y, da);
//  pixelCOLOR3(ox -10, y, oa - 100);
//  pixelCOLOR4(hx -10, y, ha - 200);
//  pixelGRID(gx - 10, y, ga);





//   plaidpatternSHADOW(sx -2, y, sa - 200);
//   plaidpatternCOLOR1(cx -10, y, ca - 100);
//   plaidpatternCOLOROVERLAY(ox -10, y, oa - 200);
//   plaidpatternGRID(gx - 10, y, ga);
//   plaidpatternDETAIL(dx -2, y, da);
//   plaidpatternHIGHLIGHT(hx -10, y, ha - 200);

//   crosshatchGRID(gx - 10, y, ga);
//   crosshatchCOLOROVERLAY(ox -10, y, oa - 200);
//   crosshatchSHADOW(cx -10, y, ca - 100);
//   crosshatchHIGHLIGHT(hx -10, y, ha - 200);

//}


void plaidpatternGRID(float x, int y, float a) {
  translate(x, y);
  //grid horizontal
  stroke(0, a);
  strokeWeight(5);
  strokeCap(SQUARE);
  line(-3, 82 ,  width * 2, 82);
  line(-3, 235, width * 2,235);
  line(-3, 394, width * 2,394);
  //grid virtical
  line(121, -5, 121 ,height);
  line(258, -5, 258 ,height);
  line(394, -5, 394 ,height);
  line(524, -5, 524 ,height);

}

void plaidpatternDETAIL(float x, int y, float a) {
  translate(x, y);
  //detail horizontal
  stroke(0, a);
  strokeWeight(1);
  strokeCap(SQUARE);
  line(-3, 77 ,  width * 2, 77);
  line(-3, 87 ,  width * 2, 87);
  line(-3, 230, width * 2, 230);
  line(-3, 240, width * 2 ,240);
  line(-3, 389, width * 2,389);
  line(-3, 399, width * 2,399);
  //detail virtical
  line(116, -5, 116 ,height);
  line(126, -5, 126 ,height);
  line(253, -5, 253 ,height);
  line(263, -5, 263 ,height);
  line(389, -5, 389 ,height);
  line(399, -5, 399 ,height);
  line(519, -5, 519 ,height);
  line(529, -5, 529 ,height);

}

void plaidpatternCOLOR1(float x, int y, float a) {
  translate(x, y);
  //orange bands
  stroke(0, 0);
  strokeWeight(0);
  fill(242, 201, 73, a);
  //fill(random(239, 242), random(100,300), random(73,99), a);
  rect(132, -3, 39, height + 10);
  rect(-10, -3, 39, height + 10);
  rect(269, -3, 39, height + 10);
  rect(404, -3, 39, height + 10);
  rect(535, -3, 39, height + 10);

}

void plaidpatternCOLOROVERLAY(float x, int y, float a) {
  translate(x, y);
  //red bands
  stroke(0, 0);
  strokeWeight(0);
  fill(171, 78, 58, a);
  rect(-3, 25, width * 2, 47);
  rect(-3, 176, width * 2, 47);
  rect(-3, 335, width * 2, 47);


}

void plaidpatternSHADOW(float x, int y, float a) {
  background( 230, 224, 210);
  translate(x, y);
  //shadow bands
  stroke(0, 0);
  strokeWeight(0);
  fill(202, 197, 184, a);
  rect(-3, 90, width * 2, 6);
  rect(-3, 243, width * 2, 6);
  rect(-3, 404, width * 2, 6);


}

void plaidpatternHIGHLIGHT(float x, int y, float a) {
  translate(x, y);
  //orange bands
  stroke(0, 0);
  strokeWeight(0);
  fill(252, 243, 183, a);
  rect(101, -3, 10, height + 10);
  rect(240, -3, 10, height + 10);
  rect(376, -3, 10, height + 10);
  rect(508, -3, 10, height + 10);

}

void crosshatchGRID(float x, int y, float a) {
  translate(x, y);
  background(245, 248, 212);
  //grid
  stroke(0, 0);
  strokeWeight(0);
  fill(89, 149, 174, a);
  rect(50, 29, width * 2, 40);
  rect(50, 106, width * 2, 40);
  rect(50, 190, width * 2, 40);
  rect(50, 274, width * 2, 40);
  rect(50, 358, width * 2, 40);
  rect(50, 440, width * 2, 40);

}

void crosshatchCOLOROVERLAY(float x, int y, float a) {
  translate(x, y);
  //grid
  stroke(0, 0);
  strokeWeight(0);
  fill(117, 94, 125, a);
  rect(81, -3, 40, height + 10);
  rect(162, -3, 40, height + 10);
  rect(242, -3, 40, height + 10);
  rect(324, -3, 40, height + 10);
  rect(406, -3, 40, height + 10);
  rect(486, -3, 40, height + 10);
  rect(566, -3, 40, height + 10);

}

void crosshatchSHADOW(float x, int y, float a) {
  translate(x, y);
  //grid
  stroke(170, 54, 110, a);
  strokeWeight(2);
  //fill(170, 54, 110, a);
  line(50, 42 , 105, -3);
  line(50, 90 , 160, -3);
  line(50, 133 , 214, -3);
  line(50, 181 , 272, -3);
  line(50, 227 , 329, -3);
  line(50, 275 , 388, -3);
  line(50, 321 , 443, -3);
  line(50, 359 , 491, -3);
  line(50, 399 , 541, -3);
  line(50, 440 , 592, -3);
  line(54, 479 , 639, -3);
  line(100, height + 10 , 640, 38);
  line(147, height + 10 , 640, 77);
  line(190, height + 10 , 640, 113);
  line(241, height + 10 , 640, 154);
  line(291, height + 10 , 640, 195);
  line(342, height + 10 , 640, 236);
  line(398, height + 10 , 640, 282);
  line(447, height + 10 , 640, 322);
  line(503, height + 10 , 640, 367);
  line(559, height + 10 , 640, 413);
  line(612, height + 10 , 640, 457);

}


void crosshatchHIGHLIGHT(float x, int y, float a) {
  translate(x, y);
  //grid
  stroke(250, 206, 245, a);
  strokeWeight(2);
  //fill(170, 54, 110, a);
  line(50, 42 - 3 , 105 - 3, -3);
  line(50, 90 - 3, 160 - 3, -3);
  line(50, 133 - 3, 214 - 3, -3);
  line(50, 181 - 3, 272 - 3, -3);
  line(50, 227 - 3, 329 - 3, -3);
  line(50, 275 - 3, 388 - 3, -3);
  line(50, 321 - 3, 443 - 3, -3);
  line(50, 359 - 3, 491 - 3, -3);
  line(50, 399 - 3, 541 - 3, -3);
  line(50, 440 - 3, 592 - 3, -3);
  line(54, 479 - 3, 639 - 3, -3);
  line(100 - 3, height + 10 , 640, 38 - 3);
  line(147 - 3, height + 10 , 640, 77 - 3);
  line(190 - 3, height + 10 , 640, 113 - 3);
  line(241 - 3, height + 10 , 640, 154 - 3);
  line(291 - 3, height + 10 , 640, 195 - 3);
  line(342 - 3, height + 10 , 640, 236 - 3);
  line(398 - 3, height + 10 , 640, 282 - 3);
  line(447 - 3, height + 10 , 640, 322 - 3);
  line(503 - 3, height + 10 , 640, 367 - 3);
  line(559 - 3, height + 10 , 640, 413 - 3);
  line(612 - 3, height + 10 , 640, 457 - 3);

}

void pixelGRID(float x, int y, float a) {
  translate(x, y);
  //grid horizontal
  stroke(255, a);
  strokeWeight(2);
  strokeCap(SQUARE);
  line(-3, 88 ,  width * 2, 88);
  line(-3, 182, width * 2,182);
  line(-3, 283, width * 2,283);
  line(-3, 377, width * 2,377);
  //grid virtical
  line(86, -5, 86 ,height);
  line(182, -5, 182 ,height);
  line(276, -5, 276 ,height);
  line(368, -5, 368 ,height);
  line(368, -5, 368 ,height);
  line(461, -5, 461 ,height);
  line(550, -5, 550 ,height);

}

void pixelCOLOR1(float x, int y, float a) {
  translate(x, y);
  background(183, 212, 166);
  //orange bands
  stroke(0, 0);
  strokeWeight(0);
  fill(66, 110, 112, a);
  //fill(random(239, 242), random(100,300), random(73,99), a);
  rect(-3, 283, 183, 197);
  rect(-3, 182, 87, 102);
  rect(178, 377, 94, 105);

}

void pixelCOLOR2(float x, int y, float a) {
  translate(x, y);
  //orange bands
  stroke(0, 0);
  strokeWeight(0);
  fill(107, 143, 122, a);
  //fill(random(239, 242), random(100,300), random(73,99), a);
  rect(-3, 89, 86, 94);
  rect(87, 183, 96, 101);
  rect(182, 284, 94, 94);
  rect(276, 377, 93, 103);

}

void pixelCOLOR3(float x, int y, float a) {
  translate(x, y);
  //orange bands
  stroke(0, 0);
  strokeWeight(0);
  fill(223, 235, 195, a);
  //fill(random(239, 242), random(100,300), random(73,99), a);
  rect(182, 0, 186, 89);
  rect(277, 87, 185, 96);
  rect(369, 183, 182, 100);
  rect(462, 283, 178, 95);
  rect(552, 378, 88, 102);


}

void pixelCOLOR4(float x, int y, float a) {
  translate(x, y);
  //orange bands
  stroke(0, 0);
  strokeWeight(0);
  fill(245, 244, 214, a);
  //fill(random(239, 242), random(100,300), random(73,99), a);
  rect(368, 0, 96, 89);
  rect(460, 0, 188, 183);
  rect(550, 182, 90, 102);


}









