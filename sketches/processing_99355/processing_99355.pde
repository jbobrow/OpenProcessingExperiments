
/*
* Processing script created using PDEGraphics2D which is part of
* Project Waterloo
*             http://sigtool.sourceforge.net
* Project Waterloo and Waterloo Scientific Graphics are King's College London projects
* Author: Malcolm Lidierth, Wolfson Centre for Age-Related Diseases
*
*
* This file was created: Fri May 17 11:26:29 BST 2013
*
* Display area size was 402 x 640 pixels when created but may be edited
* within the setup() function below.
*
* Coordinates are in pixels. To scale and move the drawing in the drawing area,
* alter the scaling and translate factors set in the draw() function below.
*
* All displayed co-ordinates will be derived as (original script value*scale)+translation offset.
* This for crisp lines:
* @pjs crisp="true";
*/

/**
* Title
*
* Description:
*/
// Font creation: the default font will be used if these are not available
PFont SansSerif = createFont("SansSerif", 48, true);

// User-definable function to set text sizes
float txtS(float sz) {return sz;}
// User-definable function so set line widths
float strkS(float w) {return w;}


void setup() {
size(402,640);
ellipseMode(CORNER);
}


void draw() {
smooth();
scale(1,1);
translate(0,0);
textAlign(LEFT,BOTTOM);
textFont(SansSerif, txtS(10.00));
fill(255,255,255,255);
stroke(255,255,255,255);
// Rendering class java.awt.Rectangle
fillShape_653681e7();
/* Painting class kcl.waterloo.graphics.GJGraphContainer : 3afa9e25 */
fill(255,255,255,255);
stroke(255,255,255,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_653681e7();
/* Painting class kcl.waterloo.graphics.GJGraph : 9f51be6 */
/* Painting class kcl.waterloo.graphics.GJGraph : 9f51be6 */
/* Painting grid */
strokeWeight(strkS(0.6));
strokeCap(SQUARE);
strokeJoin(MITER);
fill(100,149,237,255);
stroke(100,149,237,255);
// Rendering class java.awt.geom.Ellipse2D$Double
drawShape_5d8a989a();
// Rendering class java.awt.geom.Ellipse2D$Double
drawShape_3628d670();
// Rendering class java.awt.geom.Ellipse2D$Double
drawShape_33166ed7();
// Rendering class java.awt.geom.Ellipse2D$Double
drawShape_5c6ff75();
// Rendering class java.awt.geom.Ellipse2D$Double
drawShape_4bad5d49();
// Rendering class java.awt.geom.Ellipse2D$Double
drawShape_5d8a989a();
// Rendering class java.awt.geom.Ellipse2D$Double
drawShape_62c78a6f();
// Rendering class java.awt.geom.Ellipse2D$Double
drawShape_1a51b013();
// Rendering class java.awt.geom.Ellipse2D$Double
drawShape_68febce4();
// Rendering class java.awt.geom.Ellipse2D$Double
drawShape_2c235296();
strokeWeight(strkS(1.0));
strokeWeight(strkS(0.6));
// Rendering class java.awt.geom.Line2D$Double
line(200.50, 321.00, 372.00, 319.00);
// Rendering class java.awt.geom.Line2D$Double
line(200.32, 321.00, 350.00, 234.00);
// Rendering class java.awt.geom.Line2D$Double
line(200.32, 321.00, 287.00, 171.00);
// Rendering class java.awt.geom.Line2D$Double
line(200.49, 149.00, 202.00, 321.00);
// Rendering class java.awt.geom.Line2D$Double
line(115.08, 171.00, 202.00, 321.00);
// Rendering class java.awt.geom.Line2D$Double
line(52.62, 234.00, 202.00, 321.00);
// Rendering class java.awt.geom.Line2D$Double
line(30.00, 319.00, 202.00, 321.00);
// Rendering class java.awt.geom.Line2D$Double
line(52.62, 406.00, 202.00, 319.00);
// Rendering class java.awt.geom.Line2D$Double
line(115.08, 469.00, 202.00, 319.00);
// Rendering class java.awt.geom.Line2D$Double
line(200.41, 491.00, 202.00, 319.00);
// Rendering class java.awt.geom.Line2D$Double
line(200.32, 319.00, 287.00, 469.00);
// Rendering class java.awt.geom.Line2D$Double
line(200.32, 319.00, 350.00, 406.00);
strokeWeight(strkS(1.0));
/* Painting class kcl.waterloo.graphics.plots2D.GJPolarBar : 43030c7d */
fill(36,0,216,255);
stroke(36,0,216,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_10019d31(224.90, 320.00);
fill(24,28,247,255);
stroke(24,28,247,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_59f7042c(236.14, 315.37);
fill(40,87,255,255);
stroke(40,87,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_683312d8(242.29, 308.94);
fill(61,135,255,255);
stroke(61,135,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_6b17ecf4(248.35, 300.39);
fill(86,176,255,255);
stroke(86,176,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_6fc5be19(256.53, 287.94);
fill(117,211,255,255);
stroke(117,211,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_1f4394a3(265.57, 270.45);
fill(153,234,255,255);
stroke(153,234,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_dd3695e(241.70, 279.30);
fill(188,249,255,255);
stroke(188,249,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_32aaa169(230.10, 282.08);
fill(234,255,255,255);
stroke(234,255,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_604b0e7b(217.90, 290.73);
fill(255,255,234,255);
stroke(255,255,234,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_5fa3dea0(212.57, 292.07);
fill(255,241,188,255);
stroke(255,241,188,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_7f6d0b6d(205.79, 302.12);
fill(255,214,153,255);
stroke(255,214,153,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_50096276(201.00, 320.00);
fill(255,172,117,255);
stroke(255,172,117,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_50096276(201.00, 320.00);
fill(255,120,86,255);
stroke(255,120,86,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_181f5a07(199.03, 305.01);
fill(255,61,61,255);
stroke(255,61,61,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_324f8df0(191.83, 285.76);
fill(247,39,53,255);
stroke(247,39,53,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_4efa15e(179.75, 268.69);
fill(216,21,47,255);
stroke(216,21,47,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_104b24da(164.37, 256.55);
fill(165,0,33,255);
stroke(165,0,33,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_35606c91(149.36, 252.70);
fill(36,0,216,255);
stroke(36,0,216,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_4d77bef7(142.46, 261.46);
fill(24,28,247,255);
stroke(24,28,247,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_709a71dc(148.05, 279.37);
fill(40,87,255,255);
stroke(40,87,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_2ba95c45(152.02, 291.72);
fill(61,135,255,255);
stroke(61,135,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_7be8cc67(150.65, 299.15);
fill(86,176,255,255);
stroke(86,176,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_70c3bdbe(152.58, 307.03);
fill(117,211,255,255);
stroke(117,211,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_42de3ec8(165.86, 315.37);
fill(153,234,255,255);
stroke(153,234,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_cebdec4(152.02, 320.00);
fill(188,249,255,255);
stroke(188,249,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_516e1c7c(133.98, 328.82);
fill(234,255,255,255);
stroke(234,255,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_14103aa8(109.83, 344.43);
fill(255,255,234,255);
stroke(255,255,234,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_357af5e2(91.94, 365.17);
fill(255,241,188,255);
stroke(255,241,188,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_1ba4e3dc(107.07, 374.23);
fill(255,214,153,255);
stroke(255,214,153,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_666b8eb1(128.56, 375.59);
fill(255,172,117,255);
stroke(255,172,117,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_1f653aff(149.19, 371.81);
fill(255,120,86,255);
stroke(255,120,86,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_2f044b73(162.51, 370.16);
fill(255,61,61,255);
stroke(255,61,61,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_42f58322(183.28, 350.70);
fill(247,39,53,255);
stroke(247,39,53,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_4744f86(191.85, 342.08);
fill(216,21,47,255);
stroke(216,21,47,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_7010e8b2(189.94, 361.29);
fill(165,0,33,255);
stroke(165,0,33,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_661d3798(192.87, 381.79);
fill(36,0,216,255);
stroke(36,0,216,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_82d1088(201.00, 409.42);
fill(24,28,247,255);
stroke(24,28,247,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_469854e9(213.55, 415.36);
fill(40,87,255,255);
stroke(40,87,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_3aeeb134(230.14, 428.76);
fill(61,135,255,255);
stroke(61,135,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_cb3eb26(242.10, 419.23);
fill(86,176,255,255);
stroke(86,176,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_7813124d(246.66, 399.08);
fill(117,211,255,255);
stroke(117,211,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_2c16bad1(242.15, 373.63);
fill(153,234,255,255);
stroke(153,234,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_84305f4(234.80, 353.80);
fill(188,249,255,255);
stroke(188,249,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_683bda68(234.92, 346.02);
fill(234,255,255,255);
stroke(234,255,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_3180174e(221.70, 331.95);
fill(255,255,234,255);
stroke(255,255,234,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_507a1b45(233.75, 333.56);
fill(255,241,188,255);
stroke(255,241,188,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_94784a(249.42, 332.97);
fill(255,214,153,255);
stroke(255,214,153,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_13654292(268.02, 328.82);
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(0.5));
strokeCap(PROJECT);
strokeJoin(BEVEL);
// Rendering class java.awt.geom.Arc2D$Double
drawShape_5cf58930();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_7c01ddfd();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_5e954ca5();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_1bdb1526();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_4c498013();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_6d778685();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_4220bde8();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_7393ec42();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_747c1c55();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_284c32();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_55a266b2();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_19045c0a();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_19045c0a();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_6d36a15a();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_1d9b53ba();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_4095e785();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_3192ede3();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_253feb82();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_77eb6e9();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_101a7ed7();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_3b7d5d83();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_238661f8();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_4b89f300();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_4db0abbe();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_9db6ecb();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_2546d67b();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_4dab385b();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_24010633();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_3f3e10bc();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_3bcc714();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_5eb1f3f6();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_7507cc0b();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_52e52233();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_41286cc9();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_44fe218a();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_84c0e69();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_394613c0();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_27babfa0();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_557ab5c0();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_6b327c17();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_3f7100fc();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_13f7c0ee();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_6e9b537f();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_1786ef94();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_1bdae99d();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_411f50b4();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_6eeb7ad2();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_25cca9e2();
fill(0,0,0,255);
stroke(0,0,0,255);
text("5", 251.00, 333.00);
text("10", 300.00, 333.00);
text("15", 354.00, 333.00);
text("-5", 141.00, 333.00);
text("-10", 84.00, 333.00);
text("-15", 30.00, 333.00);
text("5", 206.00, 271.00);
text("10", 206.00, 218.00);
text("15", 206.00, 164.00);
text("-5", 206.00, 378.00);
text("-10", 206.00, 431.00);
text("-15", 206.00, 485.00);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(3.0));
strokeCap(ROUND);
strokeJoin(ROUND);
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Ellipse2D$Double
drawShape_1fa547d1();
text("240°", 88.00, 477.42);
text("180°",  0.00, 320.00);
text("150°", 23.58, 232.00);
text(" 30°", 353.42, 232.00);
text("210°", 23.58, 413.00);
text("120°", 88.00, 167.58);
text(" 60°", 289.00, 167.58);
text("330°", 353.42, 413.00);
text("  0°", 377.00, 325.00);
text("300°", 289.00, 477.42);
text("270°", 188.50, 506.00);
text(" 90°", 190.50, 144.00);
strokeWeight(strkS(1.0));
strokeCap(SQUARE);
strokeJoin(MITER);
strokeWeight(strkS(0.5));
strokeCap(SQUARE);
strokeJoin(MITER);
noLoop();
}//EOF DRAW

void fillShape_653681e7() {
pushStyle();
noStroke();
rect( 0.00,  0.00, 402.00, 640.00);//from processShape

popStyle();
}
void drawShape_5d8a989a() {
pushStyle();
noFill();
ellipse(201.00, 320.00,  0.00,  0.00);

popStyle();
}
void drawShape_3628d670() {
pushStyle();
noFill();
ellipse(147.00, 266.00, 107.00, 107.00);

popStyle();
}
void drawShape_33166ed7() {
pushStyle();
noFill();
ellipse(94.00, 213.00, 213.00, 213.00);

popStyle();
}
void drawShape_5c6ff75() {
pushStyle();
noFill();
ellipse(40.00, 159.00, 321.00, 321.00);

popStyle();
}
void drawShape_4bad5d49() {
pushStyle();
noFill();
bezier(201.00, 149.00, 106.56, 149.00, 30.00, 225.56, 30.00, 320.00);
bezier(30.00, 320.00, 30.00, 414.44, 106.56, 491.00, 201.00, 491.00);
bezier(201.00, 491.00, 295.44, 491.00, 372.00, 414.44, 372.00, 320.00);
bezier(372.00, 320.00, 372.00, 225.56, 295.44, 149.00, 201.00, 149.00);
popStyle();
}

void drawShape_62c78a6f() {
pushStyle();
noFill();
ellipse(147.00, 266.00,  0.00,  0.00);

popStyle();
}
void drawShape_1a51b013() {
pushStyle();
noFill();
ellipse(94.00, 213.00,  0.00,  0.00);

popStyle();
}
void drawShape_68febce4() {
pushStyle();
noFill();
ellipse(40.00, 159.00,  0.00,  0.00);

popStyle();
}
void drawShape_2c235296() {
pushStyle();
noFill();
ellipse(-12.00, 107.00,  0.00,  0.00);

popStyle();
}
void fillShape_10019d31(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  0.00, yo - 1.04,xo - 0.07, yo - 2.09, xo - 0.20, yo - 3.12);
vertex(xo - 23.90, yo +  0.00);
endShape();
popStyle();
}

void fillShape_59f7042c(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 0.20, yo - 1.53,xo - 0.50, yo - 3.05, xo - 0.90, yo - 4.55);
vertex(xo - 35.14, yo +  4.63);
endShape();
popStyle();
}

void fillShape_683312d8(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 0.48, yo - 1.80,xo - 1.08, yo - 3.57, xo - 1.80, yo - 5.30);
vertex(xo - 41.29, yo + 11.06);
endShape();
popStyle();
}

void fillShape_6b17ecf4(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 0.86, yo - 2.07,xo - 1.85, yo - 4.08, xo - 2.97, yo - 6.01);
vertex(xo - 47.35, yo + 19.61);
endShape();
popStyle();
}

void fillShape_6fc5be19(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 1.40, yo - 2.42,xo - 2.96, yo - 4.75, xo - 4.66, yo - 6.97);
vertex(xo - 55.53, yo + 32.06);
endShape();
popStyle();
}

void fillShape_1f4394a3(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 2.16, yo - 2.82,xo - 4.51, yo - 5.49, xo - 7.02, yo - 8.00);
vertex(xo - 64.57, yo + 49.55);
endShape();
popStyle();
}

void fillShape_dd3695e(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 1.78, yo - 1.78,xo - 3.67, yo - 3.43, xo - 5.66, yo - 4.96);
vertex(xo - 40.70, yo + 40.70);
endShape();
popStyle();
}

void fillShape_32aaa169(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 1.66, yo - 1.27,xo - 3.39, yo - 2.43, xo - 5.20, yo - 3.47);
vertex(xo - 29.10, yo + 37.92);
endShape();
popStyle();
}

void fillShape_604b0e7b(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 1.28, yo - 0.74,xo - 2.60, yo - 1.39, xo - 3.96, yo - 1.96);
vertex(xo - 16.90, yo + 29.27);
endShape();
popStyle();
}

void fillShape_5fa3dea0(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 1.22, yo - 0.50,xo - 2.47, yo - 0.93, xo - 3.74, yo - 1.27);
vertex(xo - 11.57, yo + 27.93);
endShape();
popStyle();
}

void fillShape_7f6d0b6d(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 0.78, yo - 0.21,xo - 1.57, yo - 0.37, xo - 2.37, yo - 0.47);
vertex(xo - 4.79, yo + 17.88);
endShape();
popStyle();
}

void fillShape_50096276(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  0.00, yo +  0.00,xo +  0.00, yo +  0.00, xo +  0.00, yo +  0.00);
vertex(xo +  0.00, yo +  0.00);
endShape();
popStyle();
}

void fillShape_181f5a07(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 0.65, yo +  0.09,xo - 1.30, yo +  0.21, xo - 1.94, yo +  0.39);
vertex(xo +  1.97, yo + 14.99);
endShape();
popStyle();
}

void fillShape_324f8df0(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 1.49, yo +  0.40,xo - 2.96, yo +  0.90, xo - 4.39, yo +  1.49);
vertex(xo +  9.17, yo + 34.24);
endShape();
popStyle();
}

void fillShape_4efa15e(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 2.24, yo +  0.93,xo - 4.42, yo +  2.00, xo - 6.52, yo +  3.21);
vertex(xo + 21.25, yo + 51.31);
endShape();
popStyle();
}

void fillShape_104b24da(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 2.77, yo +  1.60,xo - 5.43, yo +  3.38, xo - 7.97, yo +  5.32);
vertex(xo + 36.63, yo + 63.45);
endShape();
popStyle();
}

void fillShape_35606c91(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 2.94, yo +  2.25,xo - 5.72, yo +  4.70, xo - 8.34, yo +  7.32);
vertex(xo + 51.64, yo + 67.30);
endShape();
popStyle();
}

void fillShape_4d77bef7(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 2.56, yo +  2.56,xo - 4.94, yo +  5.27, xo - 7.14, yo +  8.14);
vertex(xo + 58.54, yo + 58.54);
endShape();
popStyle();
}

void fillShape_709a71dc(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 1.77, yo +  2.31,xo - 3.39, yo +  4.74, xo - 4.85, yo +  7.26);
vertex(xo + 52.95, yo + 40.63);
endShape();
popStyle();
}

void fillShape_2ba95c45(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 1.23, yo +  2.14,xo - 2.33, yo +  4.35, xo - 3.27, yo +  6.63);
vertex(xo + 48.98, yo + 28.28);
endShape();
popStyle();
}

void fillShape_7be8cc67(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 0.91, yo +  2.20,xo - 1.68, yo +  4.45, xo - 2.29, yo +  6.75);
vertex(xo + 50.35, yo + 20.85);
endShape();
popStyle();
}

void fillShape_70c3bdbe(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 0.57, yo +  2.11,xo - 0.99, yo +  4.26, xo - 1.28, yo +  6.43);
vertex(xo + 48.42, yo + 12.97);
endShape();
popStyle();
}

void fillShape_42de3ec8(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 0.20, yo +  1.53,xo - 0.30, yo +  3.08, xo - 0.30, yo +  4.63);
vertex(xo + 35.14, yo +  4.63);
endShape();
popStyle();
}

void fillShape_cebdec4(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  0.00, yo +  2.14,xo +  0.14, yo +  4.27, xo +  0.42, yo +  6.39);
vertex(xo + 48.98, yo +  0.00);
endShape();
popStyle();
}

void fillShape_516e1c7c(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  0.39, yo +  2.93,xo +  0.96, yo +  5.82, xo +  1.72, yo +  8.67);
vertex(xo + 67.02, yo - 8.82);
endShape();
popStyle();
}

void fillShape_14103aa8(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  1.07, yo +  3.98,xo +  2.39, yo +  7.89, xo +  3.97, yo + 11.69);
vertex(xo + 91.17, yo - 24.43);
endShape();
popStyle();
}

void fillShape_357af5e2(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  1.97, yo +  4.76,xo +  4.25, yo +  9.39, xo +  6.83, yo + 13.85);
vertex(xo + 109.06, yo - 45.17);
endShape();
popStyle();
}

void fillShape_1ba4e3dc(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  2.37, yo +  4.10,xo +  5.00, yo +  8.04, xo +  7.88, yo + 11.80);
vertex(xo + 93.93, yo - 54.23);
endShape();
popStyle();
}

void fillShape_666b8eb1(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  2.43, yo +  3.16,xo +  5.06, yo +  6.16, xo +  7.88, yo +  8.98);
vertex(xo + 72.44, yo - 55.59);
endShape();
popStyle();
}

void fillShape_1f653aff(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  2.26, yo +  2.26,xo +  4.67, yo +  4.37, xo +  7.21, yo +  6.32);
vertex(xo + 51.81, yo - 51.81);
endShape();
popStyle();
}

void fillShape_2f044b73(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  2.19, yo +  1.68,xo +  4.49, yo +  3.22, xo +  6.88, yo +  4.59);
vertex(xo + 38.49, yo - 50.16);
endShape();
popStyle();
}

void fillShape_42f58322(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  1.34, yo +  0.77,xo +  2.73, yo +  1.46, xo +  4.16, yo +  2.05);
vertex(xo + 17.72, yo - 30.70);
endShape();
popStyle();
}

void fillShape_4744f86(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  0.96, yo +  0.40,xo +  1.95, yo +  0.73, xo +  2.96, yo +  1.00);
vertex(xo +  9.15, yo - 22.08);
endShape();
popStyle();
}

void fillShape_7010e8b2(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  1.80, yo +  0.48,xo +  3.63, yo +  0.85, xo +  5.48, yo +  1.09);
vertex(xo + 11.06, yo - 41.29);
endShape();
popStyle();
}

void fillShape_661d3798(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  2.70, yo +  0.36,xo +  5.41, yo +  0.53, xo +  8.13, yo +  0.53);
vertex(xo +  8.13, yo - 61.79);
endShape();
popStyle();
}

void fillShape_82d1088(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  3.90, yo +  0.00,xo +  7.80, yo - 0.26, xo + 11.67, yo - 0.76);
vertex(xo +  0.00, yo - 89.42);
endShape();
popStyle();
}

void fillShape_469854e9(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  4.16, yo - 0.55,xo +  8.28, yo - 1.37, xo + 12.34, yo - 2.45);
vertex(xo - 12.55, yo - 95.36);
endShape();
popStyle();
}

void fillShape_3aeeb134(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  4.75, yo - 1.27,xo +  9.41, yo - 2.85, xo + 13.95, yo - 4.73);
vertex(xo - 29.14, yo - 108.76);
endShape();
popStyle();
}

void fillShape_cb3eb26(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  4.33, yo - 1.79,xo +  8.54, yo - 3.87, xo + 12.60, yo - 6.21);
vertex(xo - 41.10, yo - 99.23);
endShape();
popStyle();
}

void fillShape_7813124d(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  3.45, yo - 1.99,xo +  6.77, yo - 4.21, xo +  9.93, yo - 6.64);
vertex(xo - 45.66, yo - 79.08);
endShape();
popStyle();
}

void fillShape_2c16bad1(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  2.34, yo - 1.80,xo +  4.56, yo - 3.74, xo +  6.65, yo - 5.83);
vertex(xo - 41.15, yo - 53.63);
endShape();
popStyle();
}

void fillShape_84305f4(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  1.48, yo - 1.48,xo +  2.85, yo - 3.05, xo +  4.12, yo - 4.70);
vertex(xo - 33.80, yo - 33.80);
endShape();
popStyle();
}

void fillShape_683bda68(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  1.14, yo - 1.48,xo +  2.17, yo - 3.03, xo +  3.11, yo - 4.65);
vertex(xo - 33.92, yo - 26.02);
endShape();
popStyle();
}

void fillShape_3180174e(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  0.52, yo - 0.90,xo +  0.98, yo - 1.84, xo +  1.38, yo - 2.80);
vertex(xo - 20.70, yo - 11.95);
endShape();
popStyle();
}

void fillShape_507a1b45(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  0.59, yo - 1.43,xo +  1.09, yo - 2.90, xo +  1.49, yo - 4.39);
vertex(xo - 32.75, yo - 13.56);
endShape();
popStyle();
}

void fillShape_94784a(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  0.57, yo - 2.11,xo +  0.99, yo - 4.26, xo +  1.28, yo - 6.43);
vertex(xo - 48.42, yo - 12.97);
endShape();
popStyle();
}

void fillShape_13654292(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  0.39, yo - 2.93,xo +  0.58, yo - 5.87, xo +  0.58, yo - 8.82);
vertex(xo - 67.02, yo - 8.82);
endShape();
popStyle();
}

void drawShape_5cf58930() {
pushStyle();
noFill();
bezier(224.90, 320.00, 224.90, 318.96, 224.83, 317.91, 224.69, 316.88);
line(224.69, 316.88, 201.00, 320.00);
popStyle();
}

void drawShape_7c01ddfd() {
pushStyle();
noFill();
bezier(236.14, 315.37, 235.94, 313.84, 235.64, 312.32, 235.24, 310.83);
line(235.24, 310.83, 201.00, 320.00);
popStyle();
}

void drawShape_5e954ca5() {
pushStyle();
noFill();
bezier(242.29, 308.94, 241.81, 307.13, 241.21, 305.36, 240.50, 303.64);
line(240.50, 303.64, 201.00, 320.00);
popStyle();
}

void drawShape_1bdb1526() {
pushStyle();
noFill();
bezier(248.35, 300.39, 247.50, 298.32, 246.51, 296.31, 245.39, 294.37);
line(245.39, 294.37, 201.00, 320.00);
popStyle();
}

void drawShape_4c498013() {
pushStyle();
noFill();
bezier(256.53, 287.94, 255.13, 285.51, 253.58, 283.18, 251.87, 280.96);
line(251.87, 280.96, 201.00, 320.00);
popStyle();
}

void drawShape_6d778685() {
pushStyle();
noFill();
bezier(265.57, 270.45, 263.41, 267.63, 261.07, 264.96, 258.55, 262.45);
line(258.55, 262.45, 201.00, 320.00);
popStyle();
}

void drawShape_4220bde8() {
pushStyle();
noFill();
bezier(241.70, 279.30, 239.92, 277.53, 238.03, 275.87, 236.04, 274.34);
line(236.04, 274.34, 201.00, 320.00);
popStyle();
}

void drawShape_7393ec42() {
pushStyle();
noFill();
bezier(230.10, 282.08, 228.44, 280.81, 226.70, 279.65, 224.90, 278.61);
line(224.90, 278.61, 201.00, 320.00);
popStyle();
}

void drawShape_747c1c55() {
pushStyle();
noFill();
bezier(217.90, 290.73, 216.62, 289.99, 215.30, 289.34, 213.93, 288.78);
line(213.93, 288.78, 201.00, 320.00);
popStyle();
}

void drawShape_284c32() {
pushStyle();
noFill();
bezier(212.57, 292.07, 211.35, 291.57, 210.10, 291.14, 208.82, 290.80);
line(208.82, 290.80, 201.00, 320.00);
popStyle();
}

void drawShape_55a266b2() {
pushStyle();
noFill();
bezier(205.79, 302.12, 205.01, 301.91, 204.22, 301.75, 203.42, 301.65);
line(203.42, 301.65, 201.00, 320.00);
popStyle();
}

void drawShape_19045c0a() {
pushStyle();
noFill();
bezier(201.00, 320.00, 201.00, 320.00, 201.00, 320.00, 201.00, 320.00);
line(201.00, 320.00, 201.00, 320.00);
popStyle();
}

void drawShape_6d36a15a() {
pushStyle();
noFill();
bezier(199.03, 305.01, 198.37, 305.10, 197.73, 305.23, 197.09, 305.40);
line(197.09, 305.40, 201.00, 320.00);
popStyle();
}

void drawShape_1d9b53ba() {
pushStyle();
noFill();
bezier(191.83, 285.76, 190.33, 286.16, 188.86, 286.66, 187.44, 287.25);
line(187.44, 287.25, 201.00, 320.00);
popStyle();
}

void drawShape_4095e785() {
pushStyle();
noFill();
bezier(179.75, 268.69, 177.51, 269.62, 175.33, 270.69, 173.23, 271.91);
line(173.23, 271.91, 201.00, 320.00);
popStyle();
}

void drawShape_3192ede3() {
pushStyle();
noFill();
bezier(164.37, 256.55, 161.60, 258.15, 158.93, 259.92, 156.40, 261.87);
line(156.40, 261.87, 201.00, 320.00);
popStyle();
}

void drawShape_253feb82() {
pushStyle();
noFill();
bezier(149.36, 252.70, 146.42, 254.95, 143.63, 257.40, 141.02, 260.02);
line(141.02, 260.02, 201.00, 320.00);
popStyle();
}

void drawShape_77eb6e9() {
pushStyle();
noFill();
bezier(142.46, 261.46, 139.91, 264.02, 137.52, 266.74, 135.32, 269.60);
line(135.32, 269.60, 201.00, 320.00);
popStyle();
}

void drawShape_101a7ed7() {
pushStyle();
noFill();
bezier(148.05, 279.37, 146.28, 281.68, 144.66, 284.11, 143.20, 286.63);
line(143.20, 286.63, 201.00, 320.00);
popStyle();
}

void drawShape_3b7d5d83() {
pushStyle();
noFill();
bezier(152.02, 291.72, 150.79, 293.86, 149.70, 296.08, 148.75, 298.36);
line(148.75, 298.36, 201.00, 320.00);
popStyle();
}

void drawShape_238661f8() {
pushStyle();
noFill();
bezier(150.65, 299.15, 149.74, 301.34, 148.98, 303.60, 148.36, 305.90);
line(148.36, 305.90, 201.00, 320.00);
popStyle();
}

void drawShape_4b89f300() {
pushStyle();
noFill();
bezier(152.58, 307.03, 152.01, 309.14, 151.59, 311.29, 151.30, 313.46);
line(151.30, 313.46, 201.00, 320.00);
popStyle();
}

void drawShape_4db0abbe() {
pushStyle();
noFill();
bezier(165.86, 315.37, 165.65, 316.91, 165.55, 318.45, 165.55, 320.00);
line(165.55, 320.00, 201.00, 320.00);
popStyle();
}

void drawShape_9db6ecb() {
pushStyle();
noFill();
bezier(152.02, 320.00, 152.02, 322.14, 152.16, 324.27, 152.44, 326.39);
line(152.44, 326.39, 201.00, 320.00);
popStyle();
}

void drawShape_2546d67b() {
pushStyle();
noFill();
bezier(133.98, 328.82, 134.37, 331.75, 134.95, 334.64, 135.71, 337.49);
line(135.71, 337.49, 201.00, 320.00);
popStyle();
}

void drawShape_4dab385b() {
pushStyle();
noFill();
bezier(109.83, 344.43, 110.89, 348.41, 112.22, 352.31, 113.80, 356.12);
line(113.80, 356.12, 201.00, 320.00);
popStyle();
}

void drawShape_24010633() {
pushStyle();
noFill();
bezier(91.94, 365.17, 93.91, 369.94, 96.19, 374.56, 98.77, 379.02);
line(98.77, 379.02, 201.00, 320.00);
popStyle();
}

void drawShape_3f3e10bc() {
pushStyle();
noFill();
bezier(107.07, 374.23, 109.43, 378.33, 112.07, 382.27, 114.95, 386.03);
line(114.95, 386.03, 201.00, 320.00);
popStyle();
}

void drawShape_3bcc714() {
pushStyle();
noFill();
bezier(128.56, 375.59, 130.98, 378.75, 133.61, 381.75, 136.43, 384.57);
line(136.43, 384.57, 201.00, 320.00);
popStyle();
}

void drawShape_5eb1f3f6() {
pushStyle();
noFill();
bezier(149.19, 371.81, 151.45, 374.07, 153.86, 376.18, 156.40, 378.13);
line(156.40, 378.13, 201.00, 320.00);
popStyle();
}

void drawShape_7507cc0b() {
pushStyle();
noFill();
bezier(162.51, 370.16, 164.70, 371.84, 167.00, 373.38, 169.39, 374.76);
line(169.39, 374.76, 201.00, 320.00);
popStyle();
}

void drawShape_52e52233() {
pushStyle();
noFill();
bezier(183.28, 350.70, 184.62, 351.47, 186.01, 352.16, 187.44, 352.75);
line(187.44, 352.75, 201.00, 320.00);
popStyle();
}

void drawShape_41286cc9() {
pushStyle();
noFill();
bezier(191.85, 342.08, 192.82, 342.48, 193.81, 342.81, 194.81, 343.08);
line(194.81, 343.08, 201.00, 320.00);
popStyle();
}

void drawShape_44fe218a() {
pushStyle();
noFill();
bezier(189.94, 361.29, 191.74, 361.78, 193.57, 362.14, 195.42, 362.38);
line(195.42, 362.38, 201.00, 320.00);
popStyle();
}

void drawShape_84c0e69() {
pushStyle();
noFill();
bezier(192.87, 381.79, 195.56, 382.14, 198.28, 382.32, 201.00, 382.32);
line(201.00, 382.32, 201.00, 320.00);
popStyle();
}

void drawShape_394613c0() {
pushStyle();
noFill();
bezier(201.00, 409.42, 204.90, 409.42, 208.80, 409.16, 212.67, 408.65);
line(212.67, 408.65, 201.00, 320.00);
popStyle();
}

void drawShape_27babfa0() {
pushStyle();
noFill();
bezier(213.55, 415.36, 217.72, 414.82, 221.84, 414.00, 225.90, 412.91);
line(225.90, 412.91, 201.00, 320.00);
popStyle();
}

void drawShape_557ab5c0() {
pushStyle();
noFill();
bezier(230.14, 428.76, 234.89, 427.49, 239.55, 425.91, 244.09, 424.03);
line(244.09, 424.03, 201.00, 320.00);
popStyle();
}

void drawShape_6b327c17() {
pushStyle();
noFill();
bezier(242.10, 419.23, 246.43, 417.44, 250.64, 415.36, 254.70, 413.02);
line(254.70, 413.02, 201.00, 320.00);
popStyle();
}

void drawShape_3f7100fc() {
pushStyle();
noFill();
bezier(246.66, 399.08, 250.11, 397.09, 253.43, 394.87, 256.59, 392.44);
line(256.59, 392.44, 201.00, 320.00);
popStyle();
}

void drawShape_13f7c0ee() {
pushStyle();
noFill();
bezier(242.15, 373.63, 244.49, 371.83, 246.71, 369.88, 248.80, 367.80);
line(248.80, 367.80, 201.00, 320.00);
popStyle();
}

void drawShape_6e9b537f() {
pushStyle();
noFill();
bezier(234.80, 353.80, 236.27, 352.32, 237.65, 350.75, 238.92, 349.10);
line(238.92, 349.10, 201.00, 320.00);
popStyle();
}

void drawShape_1786ef94() {
pushStyle();
noFill();
bezier(234.92, 346.02, 236.05, 344.54, 237.09, 342.99, 238.02, 341.38);
line(238.02, 341.38, 201.00, 320.00);
popStyle();
}

void drawShape_1bdae99d() {
pushStyle();
noFill();
bezier(221.70, 331.95, 222.22, 331.05, 222.68, 330.11, 223.08, 329.15);
line(223.08, 329.15, 201.00, 320.00);
popStyle();
}

void drawShape_411f50b4() {
pushStyle();
noFill();
bezier(233.75, 333.56, 234.34, 332.14, 234.84, 330.67, 235.24, 329.17);
line(235.24, 329.17, 201.00, 320.00);
popStyle();
}

void drawShape_6eeb7ad2() {
pushStyle();
noFill();
bezier(249.42, 332.97, 249.99, 330.86, 250.41, 328.71, 250.70, 326.54);
line(250.70, 326.54, 201.00, 320.00);
popStyle();
}

void drawShape_25cca9e2() {
pushStyle();
noFill();
bezier(268.02, 328.82, 268.40, 325.90, 268.59, 322.95, 268.59, 320.00);
line(268.59, 320.00, 201.00, 320.00);
popStyle();
}

void drawShape_1fa547d1() {
pushStyle();
noFill();
ellipse(30.00, 149.00, 342.00, 342.00);

popStyle();
}
