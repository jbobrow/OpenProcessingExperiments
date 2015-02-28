
//
// Vector Series
// Started: 28 November 2013
// Written by Izel Maras
// Date : 28 November 2013
// Name : Boxes;

color[] kenzozine = new color[17];


int papColor = 0;

void setup() {
  size(503, 360);
  background(255);
  frameRate(2);
  noFill();
  //noStroke();
  stroke(255);
  //stroke(5);
  colorMode(RGB, 280);

  kenzozine[0] = color(255); //White
  kenzozine[1] = color(0);   //Black
  kenzozine[2] = color(209, 78, 89); //Rose
  kenzozine[3] = color(207, 74, 142); //Dark Pink
  kenzozine[4] = color(218, 133, 172); //Light Pink
  kenzozine[5] = color(205, 53, 96);//Rouge Pink
  kenzozine[6] = color(25, 154, 220); //Blue
  kenzozine[7] = color(169, 212, 205);
  kenzozine[8] = color(22, 171, 189);
  kenzozine[9] = color(31, 51, 237);
  kenzozine[10] = color(1, 130, 66);
  kenzozine[11] = color(219, 129, 71);
  kenzozine[12] = color(221, 47, 54);
  kenzozine[13] = color(225, 213, 95);
  kenzozine[13] = color(214, 180, 16);
  kenzozine[14] = color(148, 46, 228);
  kenzozine[15] = color(245, 239, 213);
  kenzozine[16] = color(215, 7, 29);
}

void draw() {
  mainVec();
}

void mainVec() {
  //Main Background
  fill(234, 10, 35);
  rect(0, 0, 503, 360);
  //Flat Layer
  fill(35, 60, 255);
  beginShape();
  vertex(0, 44);
  vertex(149, 0);
  vertex(361, 0);
  vertex(503, 147);
  vertex(503, 304);
  vertex(377, 362);
  vertex(0, 361);
  vertex(0, 44);
  endShape(CLOSE);
  //Tops
  fill(246, 246, 210);
  beginShape();
  vertex( 79, 36);
  vertex( 88, 87);
  vertex( 165, 73);
  vertex(152, 23);
  vertex(79, 36);
  endShape(CLOSE);

  beginShape();
  vertex( 209, 52);
  vertex( 232, 23);
  vertex(273, 36);
  vertex( 252, 67);
  vertex( 209, 52);
  endShape(CLOSE);

  beginShape();
  vertex(328, 71);
  vertex( 355, 27);
  vertex( 416, 49);
  vertex(392, 93);
  vertex(328, 71);
  endShape(CLOSE);

  beginShape();
  vertex(216, 144);
  vertex( 268, 174);
  vertex(308, 136);
  vertex( 256, 105);
  vertex( 216, 144);
  endShape(CLOSE);
  beginShape();
  vertex(252, 236);
  vertex( 262, 273);
  vertex( 306, 264);
  vertex( 294, 228);
  vertex( 252, 236);
  endShape(CLOSE);
  beginShape();
  vertex(115, 185);
  vertex( 160, 195);
  vertex( 176, 155);
  vertex( 131, 148);
  vertex(115, 185);
  endShape(CLOSE);
  beginShape();
  vertex(156, 296);
  vertex( 170, 265);
  vertex( 201, 275);
  vertex( 186, 306);
  vertex( 156, 296);
  endShape(CLOSE);
  beginShape();
  vertex(327, 160);
  vertex( 336, 143);
  vertex( 357, 151);
  vertex( 350, 168);
  vertex(327, 160);
  endShape(CLOSE);
  beginShape();
  vertex(372, 244);
  vertex( 378, 249);
  vertex( 384, 244);
  vertex( 379, 239);
  vertex( 372, 244);
  endShape(CLOSE);
  beginShape();
  vertex(435, 191);
  vertex(439, 205);
  vertex( 455, 202);
  vertex(451, 189);
  vertex(435, 191);
  endShape(CLOSE);

  //Shadows
  fill(12, 11, 13);
  noFill();
  beginShape();
  vertex(172, 124);
  vertex( 89, 100);
  vertex( 99, 144);
  vertex( 174, 128);
  vertex( 172, 124);
  endShape(CLOSE);
  beginShape();
  vertex(211, 89);
  vertex( 256, 105);
  vertex( 277, 75);
  vertex( 269, 71);
  vertex( 211, 89);
  endShape(CLOSE);
  beginShape();
  vertex(120, 220);
  vertex( 167, 230);
  vertex(184, 186);
  vertex( 178, 186);
  vertex( 124, 212);
  vertex( 120, 220);
  endShape(CLOSE);
  beginShape();
  vertex(219, 180);
  vertex(219, 189);
  vertex(271, 222);
  vertex( 309, 181);
  vertex( 300, 171);
  vertex( 230, 184);
  vertex( 219, 180);
  endShape(CLOSE);
  beginShape();
  vertex(260, 292);
  vertex( 263, 304);
  vertex( 306, 296);
  vertex( 304, 282);
  vertex( 260, 292);
  endShape(CLOSE);
  beginShape();
  vertex(328, 118);
  vertex( 393, 144);
  vertex( 416, 100);
  vertex( 400, 95);
  vertex( 379, 114);
  vertex( 328, 118);
  endShape(CLOSE);
  beginShape();
  vertex(328, 174);
  vertex( 328, 176);
  vertex( 349, 185);
  vertex( 358, 169);
  vertex( 354, 165);
  vertex( 345, 178);
  vertex( 328, 174);
  endShape(CLOSE);
  beginShape();
  vertex(160, 311);
  vertex( 156, 318);
  vertex( 189, 330);
  vertex( 205, 299);
  vertex(203, 293);
  vertex( 192, 312);
  vertex( 160, 311);
  endShape(CLOSE);
  beginShape();
  vertex(378, 249);
  vertex(384, 244);
  vertex( 382, 249);
  vertex( 376, 253);
  vertex( 378, 249);
  endShape(CLOSE);
  beginShape();
  vertex(440, 205);
  vertex(437, 212);
  vertex( 453, 211);
  vertex( 455, 202);
  vertex( 440, 205);
  endShape(CLOSE);
  //Sides
  fill(224, 106, 48);
  fill(kenzozine[4]);
  beginShape();
  vertex(88, 87);
  vertex( 104, 139);
  vertex( 172, 124);
  vertex( 165, 73);
  vertex( 88, 87);
  endShape(CLOSE);

  beginShape();
  vertex(216, 144);
  vertex(269, 174);
  vertex( 266, 212);
  vertex(219, 189);
  vertex( 216, 144);
  endShape(CLOSE);

  //Pink Sides
  fill(212, 16, 131);
   fill(kenzozine[int(random(4, 10))]);
  // fill(random(200, 240));
  beginShape();
  vertex(115, 185);
  vertex(162, 194);
  vertex( 168, 223);
  vertex( 124, 214);
  vertex (115, 185);
  endShape(CLOSE);
  beginShape();
  vertex(209, 52);
  vertex( 252, 67);
  vertex( 252, 102);
  vertex(210, 89);
  vertex(209, 52);
  endShape(CLOSE);
  beginShape();
  vertex(186, 306);
  vertex(190, 321);
  vertex( 204, 297);
  vertex( 201, 275);
  vertex( 186, 306);
  endShape(CLOSE);
  beginShape();
  vertex(115, 185);
  vertex(162, 194);
  vertex( 168, 223);
  vertex( 124, 214);
  vertex( 115, 185);
  endShape(CLOSE);
  beginShape();
  vertex(209, 52);
  vertex(252, 67);
  vertex( 252, 102);
  vertex( 210, 89);
  vertex( 209, 52);
  endShape(CLOSE);
  beginShape();
  vertex(186, 306);
  vertex( 190, 321);
  vertex(204, 297);
  vertex(201, 275);
  vertex( 186, 306);
  endShape(CLOSE);
  //
  fill(63, 227, 192);
  fill(kenzozine[int(random(0, 10))]);
  beginShape();
  vertex(268, 174);
  vertex(308, 136);
  vertex( 304, 172);
  vertex( 266, 212);
  vertex( 268, 174);
  endShape(CLOSE);
  beginShape();
  vertex(161, 195);
  vertex(176, 155);
  vertex( 181, 186);
  vertex( 167, 221);
  vertex( 161, 195);
  endShape(CLOSE);
  //Y Side
  fill(208, 191, 2);
  fill(kenzozine[int(random(0, 10))]);
  beginShape();
  vertex(372, 244);
  vertex( 372, 249);
  vertex( 376, 253);
  vertex( 378, 249);
  vertex( 372, 244);
  endShape(CLOSE);
  beginShape();
  vertex(262, 273);
  vertex( 260, 292);
  vertex( 302, 286);
  vertex( 306, 264);
  vertex( 262, 273);
  endShape(CLOSE);
  beginShape();
  vertex(252, 236);
  vertex( 262, 273);
  vertex( 260, 292);
  vertex(250, 258);
  vertex(252, 236);
  endShape(CLOSE);
  beginShape();
  vertex(156, 296);
  vertex(186, 306);
  vertex( 190, 321);
  vertex( 159, 315);
  vertex( 156, 296);
  endShape(CLOSE);
  fill(26, 171, 1);
   fill(kenzozine[int(random(0, 10))]);
  beginShape();
  vertex(392, 93);
  vertex( 380, 140);
  vertex( 400, 95);
  vertex( 416, 49);
  vertex(392, 93);
  endShape(CLOSE);
  fill(170, 246, 202);
  fill(kenzozine[int(random(0, 10))]);
  beginShape();
  vertex(328, 71);
  vertex( 392, 93);
  vertex( 380, 140);
  vertex( 320, 116);
  vertex( 328, 71);
  endShape(CLOSE);
  fill(6, 8, 8);
  fill(kenzozine[int(random(0, 10))]);
  beginShape();
  vertex(252, 67);
  vertex( 252, 102);
  vertex( 273, 71);
  vertex( 273, 36);
  vertex( 252, 67);
  endShape(CLOSE);
  fill(227, 0, 0);
  beginShape();
  vertex(435, 191);
  vertex(440, 205);
  vertex( 437, 212);
  vertex(433, 201);
  vertex(435, 191);
  endShape(CLOSE);
  fill(170, 246, 202);
  fill(kenzozine[int(random(0, 10))]);
  beginShape();
  vertex(327, 160);
  vertex( 325, 175);
  vertex( 345, 181);
  vertex(350, 168);
  vertex( 329, 161);
  endShape(CLOSE);

  fill(169, 246, 201);
  fill(kenzozine[int(random(0, 10))]);
//  noFill();
  beginShape();
  vertex(345, 181);
  vertex( 354, 165);
  vertex( 357, 151);
  vertex(350, 168);
  vertex( 345, 181);
  endShape(CLOSE);
}

