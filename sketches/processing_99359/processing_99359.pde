
/*
* Processing script created using PDEGraphics2D which is part of
* Project Waterloo
*             http://sigtool.sourceforge.net
* Project Waterloo and Waterloo Scientific Graphics are King's College London projects
* Author: Malcolm Lidierth, Wolfson Centre for Age-Related Diseases
*
*
* This file was created: Fri May 17 11:37:30 BST 2013
*
* Display area size was 420 x 259 pixels when created but may be edited
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
size(420,259);
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
fillShape_4c384df6();
/* Painting class kcl.waterloo.graphics.GJGraphContainer : 2ed35cfe */
fill(255,255,255,255);
stroke(255,255,255,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_4c384df6();
/* Painting class kcl.waterloo.graphics.GJGraph : eff91d4 */
/* Painting class kcl.waterloo.graphics.GJGraph : eff91d4 */
/* Painting grid */
strokeWeight(strkS(0.6));
strokeCap(SQUARE);
strokeJoin(MITER);
fill(100,149,237,255);
stroke(100,149,237,255);
// Rendering class java.awt.geom.Path2D$Double
drawShape_4867892();
strokeWeight(strkS(1.0));
// Rendering class java.awt.geom.Path2D$Double
drawShape_1855bb90();
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(1.5));
// Rendering class java.awt.geom.Path2D$Double
drawShape_248cf76b();
strokeWeight(strkS(1.0));
/* Painting class kcl.waterloo.graphics.plots2D.GJScatter : 4e3ceb07 */
/* Painting class kcl.waterloo.graphics.plots2D.GJLine : 66bd66d7 */
strokeWeight(strkS(1.8));
strokeCap(PROJECT);
strokeJoin(BEVEL);
fill(0,178,0,255);
stroke(0,178,0,255);
// Rendering class java.awt.geom.Path2D$Double
drawShape_22c7a48c();
fill(0,255,0,128);
stroke(0,255,0,128);
// Rendering class java.awt.geom.Area
fillShape_6103f52a(98.00, 64.90);
fillShape_4ad4ca28(293.00, 65.22);
/* Painting class kcl.waterloo.graphics.plots2D.GJLine : 66bd66d7 */
fill(0,178,0,255);
stroke(0,178,0,255);
// Rendering class java.awt.geom.Path2D$Double
drawShape_22c7a48c();
fill(0,255,0,255);
stroke(0,255,0,255);
// Rendering class java.awt.geom.Path2D$Double
fillShape_58242e79(68.00, 85.52);
fillShape_58242e79(83.00, 71.11);
fillShape_58242e79(98.00, 64.90);
fillShape_58242e79(113.00, 68.41);
fillShape_58242e79(128.00, 80.78);
fillShape_58242e79(143.00, 98.98);
fillShape_58242e79(158.00, 118.56);
fillShape_58242e79(173.00, 134.72);
fillShape_58242e79(188.00, 143.51);
fillShape_58242e79(203.00, 142.77);
fillShape_58242e79(218.00, 132.68);
fillShape_58242e79(233.00, 115.72);
fillShape_58242e79(248.00, 96.04);
fillShape_58242e79(263.00, 78.45);
fillShape_58242e79(278.00, 67.27);
fillShape_58242e79(293.00, 65.22);
fillShape_58242e79(308.00, 72.82);
fillShape_58242e79(323.00, 88.20);
fillShape_58242e79(338.00, 107.59);
fillShape_58242e79(353.00, 126.25);
strokeWeight(strkS(1.5));
strokeCap(SQUARE);
strokeJoin(MITER);
fill(0,178,0,255);
stroke(0,178,0,255);
// Rendering class java.awt.geom.Path2D$Double
drawShape_2f673724();
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(3.0));
strokeCap(ROUND);
strokeJoin(ROUND);
fill(0,0,0,255);
stroke(0,0,0,255);
/* Painting class kcl.waterloo.graphics.GJAxisPanel : 367e3fb6 */
fill(0,0,0,255);
stroke(0,0,0,255);
text("0", 18.00, 235.00);
text("1", 18.00, 195.00);
text("2", 18.00, 155.00);
text("3", 18.00, 115.00);
text("4", 18.00, 75.00);
text("5", 18.00, 36.00);
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(1.5));
strokeCap(SQUARE);
strokeJoin(MITER);
// Rendering class java.awt.geom.Path2D$Double
drawShape_215534cc();
/* Painting class kcl.waterloo.graphics.GJAxisPanel : 1a88e1ad */
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Path2D$Double
drawShape_57b68d59();
/* Painting class kcl.waterloo.graphics.GJAxisPanel : 78192b23 */
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Path2D$Double
drawShape_5221fe3d();
/* Painting class kcl.waterloo.graphics.GJAxisPanel : 1285b0b9 */
fill(0,0,0,255);
stroke(0,0,0,255);
text("2", 84.00, 244.00);
text("4", 144.00, 244.00);
text("6", 204.00, 244.00);
text("8", 264.00, 244.00);
text("10", 321.00, 244.00);
text("12", 381.00, 244.00);
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Path2D$Double
drawShape_35ba80eb();
strokeWeight(strkS(1.0));
strokeWeight(strkS(0.5));
strokeCap(SQUARE);
strokeJoin(MITER);
noLoop();
}//EOF DRAW

void fillShape_4c384df6() {
pushStyle();
noStroke();
rect( 0.00,  0.00, 420.00, 259.00);//from processShape

popStyle();
}
void drawShape_4867892() {
pushStyle();
noFill();
line(43.00, 30.00, 43.00, 229.00);
line(58.00, 30.00, 58.00, 229.00);
line(73.00, 30.00, 73.00, 229.00);
line(88.00, 30.00, 88.00, 229.00);
line(103.00, 30.00, 103.00, 229.00);
line(118.00, 30.00, 118.00, 229.00);
line(133.00, 30.00, 133.00, 229.00);
line(148.00, 30.00, 148.00, 229.00);
line(163.00, 30.00, 163.00, 229.00);
line(178.00, 30.00, 178.00, 229.00);
line(193.00, 30.00, 193.00, 229.00);
line(208.00, 30.00, 208.00, 229.00);
line(223.00, 30.00, 223.00, 229.00);
line(238.00, 30.00, 238.00, 229.00);
line(253.00, 30.00, 253.00, 229.00);
line(268.00, 30.00, 268.00, 229.00);
line(283.00, 30.00, 283.00, 229.00);
line(298.00, 30.00, 298.00, 229.00);
line(313.00, 30.00, 313.00, 229.00);
line(328.00, 30.00, 328.00, 229.00);
line(343.00, 30.00, 343.00, 229.00);
line(358.00, 30.00, 358.00, 229.00);
line(373.00, 30.00, 373.00, 229.00);
line(388.00, 30.00, 388.00, 229.00);
line(30.00, 229.00, 390.00, 229.00);
line(30.00, 219.00, 390.00, 219.00);
line(30.00, 209.00, 390.00, 209.00);
line(30.00, 199.00, 390.00, 199.00);
line(30.00, 189.00, 390.00, 189.00);
line(30.00, 179.00, 390.00, 179.00);
line(30.00, 169.00, 390.00, 169.00);
line(30.00, 159.00, 390.00, 159.00);
line(30.00, 149.00, 390.00, 149.00);
line(30.00, 139.00, 390.00, 139.00);
line(30.00, 129.00, 390.00, 129.00);
line(30.00, 119.00, 390.00, 119.00);
line(30.00, 109.00, 390.00, 109.00);
line(30.00, 99.00, 390.00, 99.00);
line(30.00, 89.00, 390.00, 89.00);
line(30.00, 79.00, 390.00, 79.00);
line(30.00, 69.00, 390.00, 69.00);
line(30.00, 59.00, 390.00, 59.00);
line(30.00, 49.00, 390.00, 49.00);
line(30.00, 39.00, 390.00, 39.00);
line(30.00, 30.00, 390.00, 30.00);
popStyle();
}

void drawShape_1855bb90() {
pushStyle();
noFill();
line(88.00, 30.00, 88.00, 229.00);
line(148.00, 30.00, 148.00, 229.00);
line(208.00, 30.00, 208.00, 229.00);
line(268.00, 30.00, 268.00, 229.00);
line(328.00, 30.00, 328.00, 229.00);
line(388.00, 30.00, 388.00, 229.00);
line(30.00, 229.00, 390.00, 229.00);
line(30.00, 189.00, 390.00, 189.00);
line(30.00, 149.00, 390.00, 149.00);
line(30.00, 109.00, 390.00, 109.00);
line(30.00, 69.00, 390.00, 69.00);
line(30.00, 30.00, 390.00, 30.00);
popStyle();
}

void drawShape_248cf76b() {
pushStyle();
noFill();
popStyle();
}

void drawShape_22c7a48c() {
pushStyle();
noFill();
line(73.00, 90.52, 73.00, 90.52);
line(73.00, 90.52, 88.00, 76.11);
line(88.00, 76.11, 103.00, 69.90);
line(103.00, 69.90, 118.00, 73.41);
line(118.00, 73.41, 133.00, 85.78);
line(133.00, 85.78, 148.00, 103.98);
line(148.00, 103.98, 163.00, 123.56);
line(163.00, 123.56, 178.00, 139.72);
line(178.00, 139.72, 193.00, 148.51);
line(193.00, 148.51, 208.00, 147.77);
line(208.00, 147.77, 223.00, 137.68);
line(223.00, 137.68, 238.00, 120.72);
line(238.00, 120.72, 253.00, 101.04);
line(253.00, 101.04, 268.00, 83.45);
line(268.00, 83.45, 283.00, 72.27);
line(283.00, 72.27, 298.00, 70.22);
line(298.00, 70.22, 313.00, 77.82);
line(313.00, 77.82, 328.00, 93.20);
line(328.00, 93.20, 343.00, 112.59);
line(343.00, 112.59, 358.00, 131.25);
popStyle();
}

void fillShape_6103f52a(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
vertex(xo +  0.00, yo +  7.07);
vertex(xo +  0.00, yo +  7.07);
vertex(xo - 5.00, yo +  9.14);
vertex(xo - 5.00, yo +  9.14);
vertex(xo - 5.00, yo +  6.21);
vertex(xo - 15.00, yo +  6.21);
vertex(xo - 15.00, yo + 16.01);
vertex(xo - 20.00, yo + 20.82);
vertex(xo - 20.00, yo + 20.62);
vertex(xo - 30.00, yo + 20.62);
vertex(xo - 30.00, yo + 30.62);
vertex(xo - 25.00, yo + 30.62);
vertex(xo - 25.00, yo + 124.30);
vertex(xo + 110.00, yo + 124.30);
vertex(xo + 110.00, yo + 77.87);
vertex(xo + 105.00, yo + 77.87);
vertex(xo + 105.00, yo + 83.11);
vertex(xo + 105.00, yo + 83.11);
vertex(xo + 100.00, yo + 83.36);
vertex(xo + 100.00, yo + 83.36);
vertex(xo + 100.00, yo + 78.61);
vertex(xo + 90.00, yo + 78.61);
vertex(xo + 90.00, yo + 80.68);
vertex(xo + 85.00, yo + 77.75);
vertex(xo + 85.00, yo + 77.75);
vertex(xo + 85.00, yo + 69.82);
vertex(xo + 75.36, yo + 69.82);
vertex(xo + 69.64, yo + 63.66);
vertex(xo + 70.00, yo + 63.66);
vertex(xo + 70.00, yo + 53.66);
vertex(xo + 61.17, yo + 53.66);
vertex(xo + 53.83, yo + 44.08);
vertex(xo + 55.00, yo + 44.08);
vertex(xo + 55.00, yo + 34.08);
vertex(xo + 45.88, yo + 34.08);
vertex(xo + 39.12, yo + 25.88);
vertex(xo + 40.00, yo + 25.88);
vertex(xo + 40.00, yo + 15.88);
vertex(xo + 30.00, yo + 15.88);
vertex(xo + 30.00, yo + 16.76);
vertex(xo + 25.00, yo + 12.63);
vertex(xo + 25.00, yo +  3.51);
vertex(xo + 15.00, yo +  3.51);
vertex(xo + 15.00, yo +  7.34);
vertex(xo + 15.00, yo +  7.34);
vertex(xo + 15.00, yo +  7.34);
vertex(xo + 15.00, yo +  7.34);
vertex(xo + 15.00, yo +  7.34);
vertex(xo + 15.00, yo +  7.34);
vertex(xo + 10.00, yo +  6.17);
vertex(xo + 10.00, yo +  6.17);
vertex(xo + 10.00, yo +  0.00);
endShape();
popStyle();
}

void fillShape_4ad4ca28(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
vertex(xo +  0.00, yo +  5.68);
vertex(xo +  0.00, yo +  5.68);
vertex(xo - 5.00, yo +  6.36);
vertex(xo - 5.00, yo +  2.04);
vertex(xo - 15.00, yo +  2.04);
vertex(xo - 15.00, yo + 10.77);
vertex(xo - 20.00, yo + 14.50);
vertex(xo - 20.00, yo + 13.23);
vertex(xo - 25.00, yo + 13.23);
vertex(xo - 25.00, yo + 123.98);
vertex(xo + 35.00, yo + 123.98);
vertex(xo + 35.00, yo + 22.97);
vertex(xo + 30.12, yo + 22.97);
vertex(xo + 24.88, yo + 17.60);
vertex(xo + 25.00, yo + 17.60);
vertex(xo + 25.00, yo +  7.60);
vertex(xo + 15.00, yo +  7.60);
vertex(xo + 15.00, yo + 10.06);
vertex(xo + 10.00, yo +  7.53);
vertex(xo + 10.00, yo +  0.00);
endShape();
popStyle();
}

void fillShape_58242e79(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
vertex(xo + 10.00, yo +  0.00);
vertex(xo + 10.00, yo + 10.00);
vertex(xo +  0.00, yo + 10.00);
vertex(xo +  0.00, yo +  0.00);
endShape();
popStyle();
}

void drawShape_2f673724() {
pushStyle();
noFill();
line(68.00, 85.52, 78.00, 85.52);
line(78.00, 85.52, 78.00, 95.52);
line(78.00, 95.52, 68.00, 95.52);
line(68.00, 95.52, 68.00, 85.52);
line(83.00, 71.11, 93.00, 71.11);
line(93.00, 71.11, 93.00, 81.11);
line(93.00, 81.11, 83.00, 81.11);
line(83.00, 81.11, 83.00, 71.11);
line(98.00, 64.90, 108.00, 64.90);
line(108.00, 64.90, 108.00, 74.90);
line(108.00, 74.90, 98.00, 74.90);
line(98.00, 74.90, 98.00, 64.90);
line(113.00, 68.41, 123.00, 68.41);
line(123.00, 68.41, 123.00, 78.41);
line(123.00, 78.41, 113.00, 78.41);
line(113.00, 78.41, 113.00, 68.41);
line(128.00, 80.78, 138.00, 80.78);
line(138.00, 80.78, 138.00, 90.78);
line(138.00, 90.78, 128.00, 90.78);
line(128.00, 90.78, 128.00, 80.78);
line(143.00, 98.98, 153.00, 98.98);
line(153.00, 98.98, 153.00, 108.98);
line(153.00, 108.98, 143.00, 108.98);
line(143.00, 108.98, 143.00, 98.98);
line(158.00, 118.56, 168.00, 118.56);
line(168.00, 118.56, 168.00, 128.56);
line(168.00, 128.56, 158.00, 128.56);
line(158.00, 128.56, 158.00, 118.56);
line(173.00, 134.72, 183.00, 134.72);
line(183.00, 134.72, 183.00, 144.72);
line(183.00, 144.72, 173.00, 144.72);
line(173.00, 144.72, 173.00, 134.72);
line(188.00, 143.51, 198.00, 143.51);
line(198.00, 143.51, 198.00, 153.51);
line(198.00, 153.51, 188.00, 153.51);
line(188.00, 153.51, 188.00, 143.51);
line(203.00, 142.77, 213.00, 142.77);
line(213.00, 142.77, 213.00, 152.77);
line(213.00, 152.77, 203.00, 152.77);
line(203.00, 152.77, 203.00, 142.77);
line(218.00, 132.68, 228.00, 132.68);
line(228.00, 132.68, 228.00, 142.68);
line(228.00, 142.68, 218.00, 142.68);
line(218.00, 142.68, 218.00, 132.68);
line(233.00, 115.72, 243.00, 115.72);
line(243.00, 115.72, 243.00, 125.72);
line(243.00, 125.72, 233.00, 125.72);
line(233.00, 125.72, 233.00, 115.72);
line(248.00, 96.04, 258.00, 96.04);
line(258.00, 96.04, 258.00, 106.04);
line(258.00, 106.04, 248.00, 106.04);
line(248.00, 106.04, 248.00, 96.04);
line(263.00, 78.45, 273.00, 78.45);
line(273.00, 78.45, 273.00, 88.45);
line(273.00, 88.45, 263.00, 88.45);
line(263.00, 88.45, 263.00, 78.45);
line(278.00, 67.27, 288.00, 67.27);
line(288.00, 67.27, 288.00, 77.27);
line(288.00, 77.27, 278.00, 77.27);
line(278.00, 77.27, 278.00, 67.27);
line(293.00, 65.22, 303.00, 65.22);
line(303.00, 65.22, 303.00, 75.22);
line(303.00, 75.22, 293.00, 75.22);
line(293.00, 75.22, 293.00, 65.22);
line(308.00, 72.82, 318.00, 72.82);
line(318.00, 72.82, 318.00, 82.82);
line(318.00, 82.82, 308.00, 82.82);
line(308.00, 82.82, 308.00, 72.82);
line(323.00, 88.20, 333.00, 88.20);
line(333.00, 88.20, 333.00, 98.20);
line(333.00, 98.20, 323.00, 98.20);
line(323.00, 98.20, 323.00, 88.20);
line(338.00, 107.59, 348.00, 107.59);
line(348.00, 107.59, 348.00, 117.59);
line(348.00, 117.59, 338.00, 117.59);
line(338.00, 117.59, 338.00, 107.59);
line(353.00, 126.25, 363.00, 126.25);
line(363.00, 126.25, 363.00, 136.25);
line(363.00, 136.25, 353.00, 136.25);
line(353.00, 136.25, 353.00, 126.25);
popStyle();
}

void drawShape_215534cc() {
pushStyle();
noFill();
line(30.00, 30.00, 30.00, 229.00);
line(30.00, 229.00, 35.00, 229.00);
line(30.00, 189.00, 35.00, 189.00);
line(30.00, 149.00, 35.00, 149.00);
line(30.00, 109.00, 35.00, 109.00);
line(30.00, 69.00, 35.00, 69.00);
line(30.00, 30.00, 35.00, 30.00);
popStyle();
}

void drawShape_57b68d59() {
pushStyle();
noFill();
line(390.00, 30.00, 390.00, 229.00);
line(390.00, 229.00, 385.00, 229.00);
line(390.00, 189.00, 385.00, 189.00);
line(390.00, 149.00, 385.00, 149.00);
line(390.00, 109.00, 385.00, 109.00);
line(390.00, 69.00, 385.00, 69.00);
line(390.00, 30.00, 385.00, 30.00);
popStyle();
}

void drawShape_5221fe3d() {
pushStyle();
noFill();
line(30.00, 30.00, 390.00, 30.00);
line(88.00, 30.00, 88.00, 35.00);
line(148.00, 30.00, 148.00, 35.00);
line(208.00, 30.00, 208.00, 35.00);
line(268.00, 30.00, 268.00, 35.00);
line(328.00, 30.00, 328.00, 35.00);
line(388.00, 30.00, 388.00, 35.00);
popStyle();
}

void drawShape_35ba80eb() {
pushStyle();
noFill();
line(30.00, 229.00, 390.00, 229.00);
line(88.00, 229.00, 88.00, 224.00);
line(148.00, 229.00, 148.00, 224.00);
line(208.00, 229.00, 208.00, 224.00);
line(268.00, 229.00, 268.00, 224.00);
line(328.00, 229.00, 328.00, 224.00);
line(388.00, 229.00, 388.00, 224.00);
popStyle();
}
