
/*
* Processing script created using PDEGraphics2D which is part of
* Project Waterloo
*             http://sigtool.sourceforge.net
* Project Waterloo and Waterloo Scientific Graphics are King's College London projects
* Author: Malcolm Lidierth, Wolfson Centre for Age-Related Diseases
*
*
* This file was created: Fri May 17 11:24:32 BST 2013
*
* Display area size was 402 x 259 pixels when created but may be edited
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
size(402,259);
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
fillShape_1bd84a50();
/* Painting class kcl.waterloo.graphics.GJGraphContainer : 6cb73f62 */
fill(255,255,255,255);
stroke(255,255,255,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_1bd84a50();
/* Painting class kcl.waterloo.graphics.GJGraph : 6c74de6e */
/* Painting class kcl.waterloo.graphics.GJGraph : 6c74de6e */
/* Painting grid */
strokeWeight(strkS(1.0));
strokeCap(SQUARE);
strokeJoin(MITER);
/* Painting class kcl.waterloo.graphics.plots2D.GJPie : 14f6d878 */
fill(24,28,247,255);
stroke(24,28,247,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_207eea60(293.05, 130.40);
fill(165,0,33,255);
stroke(165,0,33,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_6c4d554a(289.45, 104.57);
fill(40,87,255,255);
stroke(40,87,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_491aa4d2(262.76, 56.67);
fill(216,21,47,255);
stroke(216,21,47,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_743afc7c(152.78, 47.68);
fill(61,135,255,255);
stroke(61,135,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_4c966c81(104.44, 139.54);
fill(247,39,53,255);
stroke(247,39,53,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_27adb06f(126.58, 191.71);
fill(86,176,255,255);
stroke(86,176,255,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_7c1a5bc2(184.84, 223.93);
fill(255,61,61,255);
stroke(255,61,61,255);
// Rendering class java.awt.geom.Arc2D$Double
fillShape_267e5d35(278.93, 180.10);
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(1.5));
// Rendering class java.awt.geom.Arc2D$Double
drawShape_32195651();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_1d71f989();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_25b5a079();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_373a7b46();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_60734cfd();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_31c3a783();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_242aa2fb();
// Rendering class java.awt.geom.Arc2D$Double
drawShape_6b321f49();
text("10.0", 251.41, 126.43);
text("20.0", 242.32, 101.22);
text("45.0", 194.65, 70.84);
text("42.0", 129.50, 105.13);
text("22.0", 127.18, 160.80);
text("26.0", 155.57, 192.29);
text("42.0", 214.48, 194.33);
text("20.0", 249.56, 153.16);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(3.0));
strokeCap(ROUND);
strokeJoin(ROUND);
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(1.0));
strokeCap(SQUARE);
strokeJoin(MITER);
strokeWeight(strkS(0.5));
strokeCap(SQUARE);
strokeJoin(MITER);
noLoop();
}//EOF DRAW

void fillShape_1bd84a50() {
pushStyle();
noStroke();
rect( 0.00,  0.00, 402.00, 259.00);//from processShape

popStyle();
}
void fillShape_207eea60(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  0.00, yo - 8.74,xo - 1.21, yo - 17.43, xo - 3.60, yo - 25.83);
vertex(xo - 94.53, yo +  0.00);
endShape();
popStyle();
}

void fillShape_6c4d554a(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 4.80, yo - 16.89,xo - 14.20, yo - 32.10, xo - 27.16, yo - 43.95);
vertex(xo - 90.93, yo + 25.83);
endShape();
popStyle();
}

void fillShape_491aa4d2(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 29.94, yo - 27.37,xo - 74.01, yo - 32.57, xo - 109.51, yo - 12.94);
vertex(xo - 63.77, yo + 69.78);
endShape();
popStyle();
}

void fillShape_743afc7c(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo - 32.99, yo + 18.24,xo - 51.98, yo + 54.34, xo - 48.34, yo + 91.86);
vertex(xo + 45.74, yo + 82.72);
endShape();
popStyle();
}

void fillShape_4c966c81(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  1.87, yo + 19.25,xo +  9.60, yo + 37.45, xo + 22.14, yo + 52.17);
vertex(xo + 94.08, yo - 9.14);
endShape();
popStyle();
}

void fillShape_27adb06f(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo + 14.87, yo + 17.45,xo + 35.57, yo + 28.89, xo + 58.25, yo + 32.21);
vertex(xo + 71.94, yo - 61.31);
endShape();
popStyle();
}

void fillShape_7c1a5bc2(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo + 37.30, yo +  5.46,xo + 74.28, yo - 11.77, xo + 94.09, yo - 43.83);
vertex(xo + 13.69, yo - 93.53);
endShape();
popStyle();
}

void fillShape_267e5d35(float xo, float yo) {
pushStyle();
noStroke();
beginShape();
vertex(xo +  0.00, yo +  0.00);
bezierVertex(xo +  9.23, yo - 14.93,xo + 14.12, yo - 32.14, xo + 14.12, yo - 49.70);
vertex(xo - 80.41, yo - 49.70);
endShape();
popStyle();
}

void drawShape_32195651() {
pushStyle();
noFill();
bezier(293.05, 130.40, 293.05, 121.67, 291.84, 112.97, 289.45, 104.57);
line(289.45, 104.57, 198.53, 130.40);
popStyle();
}

void drawShape_1d71f989() {
pushStyle();
noFill();
bezier(289.45, 104.57, 284.65, 87.68, 275.25, 72.47, 262.29, 60.62);
line(262.29, 60.62, 198.53, 130.40);
popStyle();
}

void drawShape_25b5a079() {
pushStyle();
noFill();
bezier(262.76, 56.67, 232.81, 29.31, 188.75, 24.10, 153.25, 43.73);
line(153.25, 43.73, 198.99, 126.45);
popStyle();
}

void drawShape_373a7b46() {
pushStyle();
noFill();
bezier(152.78, 47.68, 119.79, 65.92, 100.80, 102.02, 104.44, 139.54);
line(104.44, 139.54, 198.53, 130.40);
popStyle();
}

void drawShape_60734cfd() {
pushStyle();
noFill();
bezier(104.44, 139.54, 106.31, 158.79, 114.04, 177.00, 126.58, 191.71);
line(126.58, 191.71, 198.53, 130.40);
popStyle();
}

void drawShape_31c3a783() {
pushStyle();
noFill();
bezier(126.58, 191.71, 141.45, 209.16, 162.16, 220.61, 184.84, 223.93);
line(184.84, 223.93, 198.53, 130.40);
popStyle();
}

void drawShape_242aa2fb() {
pushStyle();
noFill();
bezier(184.84, 223.93, 222.14, 229.39, 259.11, 212.16, 278.93, 180.10);
line(278.93, 180.10, 198.53, 130.40);
popStyle();
}

void drawShape_6b321f49() {
pushStyle();
noFill();
bezier(278.93, 180.10, 288.16, 165.16, 293.05, 147.96, 293.05, 130.40);
line(293.05, 130.40, 198.53, 130.40);
popStyle();
}
