
// for defining arcs
float east = 0;
float south = PI/2;
float west = PI;
float north = TWO_PI-PI/2;

// 22 pixel width for figures

// Bottom arcs
void drawRROuter() {
  fill(rrOuter, 95, 66);
  arc(594, 396, 396, 396, north, TWO_PI);
}
void drawRB1() {
  fill(rb1, 78, 48);
  arc(594, 396, 352, 352, north, TWO_PI);
  noStroke();
  rect(506, 220, 88, 176);
  stroke(0, 0, 100);
}
void drawRB2() {
  fill(rb2, 55, 54);
  arc(594, 396, 308, 308, west, TWO_PI);
}
void drawRB3() {
  fill(rb3, 93, 74);
  arc(594, 396, 264, 264, west, TWO_PI);
}
void drawRB4() {
  fill(rb4, 60, 24);
  arc(594, 396, 220, 220, west, TWO_PI);
}
void drawRB5() {
  fill(rb5, 85, 63);
  arc(594, 396, 176, 176, west, TWO_PI);
}
void drawRB6() {
  fill(rb6, 38, 46);
  arc(594, 396, 132, 132, west, TWO_PI);
}
void drawRB7() {
  fill(rb7, 255, 0);
  arc(594, 396, 88, 88, west, TWO_PI);
}

// Right center arcs
void drawRTOuter() {
  fill(rtOuter, 55, 24);
  arc(396, 198, 396, 396, north, TWO_PI);
}
void drawRC1() {
  fill(rc1, 22, 37);
  arc(396, 198, 352, 352, north, TWO_PI);
  noStroke();
  rect(396, 198, 176, 198);
  stroke(0, 0, 100);
}
void drawRC2() {
  fill(rc2, 86, 78);
  arc(396, 198, 308, 308, north, TWO_PI+(PI/2));
}
void drawRC3() {
  fill(rc3, 42, 70);
  arc(396, 198, 264, 264, north, TWO_PI+(PI/2));
}
void drawRC4() {
  fill(rc4, 71, 47);
  arc(396, 198, 220, 220, north, TWO_PI+(PI/2));
}
void drawRC5() {
  fill(rc5, 64, 58);
  arc(396, 198, 176, 176, north, TWO_PI+(PI/2));
}
void drawRC6() {
  fill(rc6, 45, 52);
  arc(396, 198, 132, 132, north, TWO_PI+(PI/2));
}
void drawRC7() {
  fill(rc7, 87, 73);
  arc(396, 198, 88, 88, north, TWO_PI+(PI/2));
}

// Left center arcs
void drawLBOuter() {
  fill(lbOuter, 63, 38);
  arc(396, 198, 396, 396, south, west);
}
void drawLC1() {
  fill(lc1, 74, 76);
  arc(396, 198, 352, 352, south, west);
  noStroke();
  rect(220, 110, 176, 88);
  stroke(0, 0, 100);
}
void drawLC2() {
  fill(lc2, 59, 24);
  arc(396, 198, 308, 308, south, north);
}
void drawLC3() {
  fill(lc3, 43, 54);
  arc(396, 198, 264, 264, south, north);
}
void drawLC4() {
  fill(lc4, 26, 48);
  arc(396, 198, 220, 220, south, north);
}
void drawLC5() {
  fill(lc5, 67, 62);
  arc(396, 198, 176, 176, south, north);
}
void drawLC6() {
  fill(lc6, 100, 89);
  arc(396, 198, 132, 132, south, north);
}
void drawLC7() {
  fill(lc7, 56, 67);
  arc(396, 198, 88, 88, south, north);
}

// Top arcs
void drawLLOuter() {
  fill(llOuter, 19, 74);
  arc(198, 0, 396, 396, south, west);
}
void drawLT1() {
  fill(lt1, 33, 95);
  arc(198, 0, 352, 352, south, west);
  noStroke();
  rect(198, 0, 198, 176);
  stroke(0, 0, 100);
}
void drawLT2() {
  fill(lt2, 76, 54);
  arc(198, 0, 308, 308, east, west);
}
void drawLT3() {
  fill(lt3, 59, 76);
  arc(198, 0, 264, 264, east, west);
}
void drawLT4() {
  fill(lt4, 93, 71);
  arc(198, 0, 220, 220, east, west);
}
void drawLT5() {
  fill(lt5, 65, 57);
  arc(198, 0, 176, 176, east, west);
}
void drawLT6() {
  fill(lt6, 72, 78);
  arc(198, 0, 132, 132, east, west);
}
void drawLT7() {
  fill(lt7, 20, 56);
  arc(198, 0, 88, 88, east, west);
}

// Rectangular figures
void completeRROuter() {
  noStroke();
  fill(rrOuter, 95, 66);
  rect(594, 200, 22, 196);
  rect(594, 374, 196, 22);
  stroke(0, 0, 100);
}

void completeRTOuter() {
  noStroke();
  fill(rtOuter, 49, 25);
  rect(396, 2, 22, 196);
  rect(396, 176, 196, 22);
  stroke(0, 0, 100);
}

void drawRSquare() {
  noStroke();
  fill(rSquare, 36, 60);
  rect(396, 198, 198, 22);
  rect(396, 220, 22, 176);
  rect(418, 374, 176, 22);
  rect(572, 220, 22, 154);
  stroke(0, 0, 100);
}

void completeLBOuter() {
  noStroke();
  fill(lbOuter, 63, 38);
  rect(200, 198, 196, 22);
  rect(374, 220, 22, 174);
  stroke(0, 0, 100);
}

void completeLLOuter() {
  noStroke();
  fill(llOuter, 19, 74);
  rect(2, 0, 196, 22);
  rect(176, 22, 22, 174);
  stroke(0, 0, 100);
}

void drawLSquare() {
  noStroke();
  fill(lSquare, 99, 85);
  rect(198, 0, 198, 22);
  rect(198, 22, 22, 176);
  rect(220, 176, 176, 22);
  rect(374, 22, 22, 154);
  stroke(0, 0, 100);
}

void drawLines() {
  line(23, 22, 176, 22); // left top arc
  line(176, 22, 176, 175);
  line(198, 0, 198, 198); // left square
  line(198, 198, 594, 198);
  line(220, 22, 220, 176);
  line(220, 22, 374, 22);
  line(220, 176, 374, 176);
  line(374, 22, 374, 176);
  line(221, 220, 374, 220); // left bottom arc
  line(374, 220, 374, 373);
  line(396, 0, 396, 396);
  line(418, 23, 418, 175); // right top arc
  line(418, 175, 571, 175);
  line(418, 220, 418, 374); // right square
  line(418, 220, 572, 220);
  line(418, 374, 572, 374);
  line(572, 374, 572, 220);
  line(594, 198, 594, 396);
  line(616, 221, 616, 374); // right bottom arc
  line(616, 374, 769, 374);
  line(0, 0, width, 0); // top
  line(0, height-1, width, height-1); // bottom
}


