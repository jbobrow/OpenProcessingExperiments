
/*
* Processing script created using PDEGraphics2D which is part of
* Project Waterloo
*             http://sigtool.sourceforge.net
* Project Waterloo and Waterloo Scientific Graphics are King's College London projects
* Author: Malcolm Lidierth, Wolfson Centre for Age-Related Diseases
*
*
* This file was created: Fri May 17 11:21:37 BST 2013
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
fillShape_7c7eaa66();
/* Painting class kcl.waterloo.graphics.GJGraphContainer : 7bc9c5da */
fill(255,255,255,255);
stroke(255,255,255,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_7c7eaa66();
/* Painting class kcl.waterloo.graphics.GJGraph : 31b56444 */
/* Painting class kcl.waterloo.graphics.GJGraph : 31b56444 */
/* Painting grid */
strokeWeight(strkS(0.6));
strokeCap(SQUARE);
strokeJoin(MITER);
fill(100,149,237,255);
stroke(100,149,237,255);
// Rendering class java.awt.geom.Path2D$Double
drawShape_5fe54e64();
strokeWeight(strkS(1.0));
// Rendering class java.awt.geom.Path2D$Double
drawShape_477db86b();
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(1.5));
// Rendering class java.awt.geom.Path2D$Double
drawShape_ed69d78();
strokeWeight(strkS(1.0));
/* Painting class kcl.waterloo.graphics.plots2D.GJBar : 1e2ea207 */
fill(255,255,0,255);
stroke(255,255,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_3bfb174b();
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(1.5));
// Rendering class java.awt.geom.Rectangle2D$Double
drawShape_61b65bb0();
fill(0,0,0,255);
stroke(0,0,0,255);
text("Jan", 48.00, 215.00);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(255,255,0,255);
stroke(255,255,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_b3db1ee();
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
drawShape_7f6c8605();
fill(0,0,0,255);
stroke(0,0,0,255);
text("March", 57.00, 177.00);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(255,255,0,255);
stroke(255,255,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_2dd2f39e();
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
drawShape_74782192();
fill(0,0,0,255);
stroke(0,0,0,255);
text("May", 79.00, 139.00);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(255,255,0,255);
stroke(255,255,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_7ae433fa();
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
drawShape_1c10a11e();
fill(0,0,0,255);
stroke(0,0,0,255);
text("July", 95.00, 101.00);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(255,255,0,255);
stroke(255,255,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_7c1c6f7();
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
drawShape_42ed861b();
fill(0,0,0,255);
stroke(0,0,0,255);
text("Sept", 110.00, 63.00);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,255,255);
stroke(0,0,255,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_77ff78f0();
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
drawShape_255d121c();
fill(255,255,255,255);
stroke(255,255,255,255);
text("Feb", 72.00, 215.00);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,255,255);
stroke(0,0,255,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_14fff6e();
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
drawShape_2b0a8f6e();
fill(255,255,255,255);
stroke(255,255,255,255);
text("April", 117.00, 177.00);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,255,255);
stroke(0,0,255,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_424e94d5();
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
drawShape_350d4df5();
fill(255,255,255,255);
stroke(255,255,255,255);
text("June", 166.00, 139.00);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,255,255);
stroke(0,0,255,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_7c792b08();
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
drawShape_76f85a0f();
fill(255,255,255,255);
stroke(255,255,255,255);
text("Aug", 216.00, 101.00);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,255,255);
stroke(0,0,255,255);
// Rendering class java.awt.geom.Rectangle2D$Double
fillShape_2ae0cbce();
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Rectangle2D$Double
drawShape_c645760();
fill(255,255,255,255);
stroke(255,255,255,255);
text("Oct", 267.00, 63.00);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(3.0));
strokeCap(ROUND);
strokeJoin(ROUND);
fill(0,0,0,255);
stroke(0,0,0,255);
/* Painting class kcl.waterloo.graphics.GJAxisPanel : 7bdcaab3 */
fill(0,0,0,255);
stroke(0,0,0,255);
text("2", 21.00, 197.00);
text("4", 21.00, 159.00);
text("6", 21.00, 121.00);
text("8", 21.00, 83.00);
text("10", 14.00, 45.00);
fill(0,0,0,255);
stroke(0,0,0,255);
strokeWeight(strkS(1.5));
strokeCap(SQUARE);
strokeJoin(MITER);
// Rendering class java.awt.geom.Path2D$Double
drawShape_722349c2();
/* Painting class kcl.waterloo.graphics.GJAxisPanel : 544b0d4c */
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Path2D$Double
drawShape_6abf9a18();
/* Painting class kcl.waterloo.graphics.GJAxisPanel : 44493280 */
fill(0,0,0,255);
stroke(0,0,0,255);
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Path2D$Double
drawShape_491dd468();
/* Painting class kcl.waterloo.graphics.GJAxisPanel : 1e54faa2 */
fill(0,0,0,255);
stroke(0,0,0,255);
text("0", 44.00, 244.00);
text("5", 125.00, 244.00);
text("10", 203.00, 244.00);
text("15", 284.00, 244.00);
fill(0,0,0,255);
stroke(0,0,0,255);
// Rendering class java.awt.geom.Path2D$Double
drawShape_45641d58();
strokeWeight(strkS(1.0));
strokeWeight(strkS(0.5));
strokeCap(SQUARE);
strokeJoin(MITER);
noLoop();
}//EOF DRAW

void fillShape_7c7eaa66() {
pushStyle();
noStroke();
rect( 0.00,  0.00, 402.00, 259.00);//from processShape

popStyle();
}
void drawShape_5fe54e64() {
pushStyle();
noFill();
line(48.00, 30.00, 48.00, 229.00);
line(68.00, 30.00, 68.00, 229.00);
line(88.00, 30.00, 88.00, 229.00);
line(109.00, 30.00, 109.00, 229.00);
line(129.00, 30.00, 129.00, 229.00);
line(149.00, 30.00, 149.00, 229.00);
line(170.00, 30.00, 170.00, 229.00);
line(190.00, 30.00, 190.00, 229.00);
line(210.00, 30.00, 210.00, 229.00);
line(230.00, 30.00, 230.00, 229.00);
line(251.00, 30.00, 251.00, 229.00);
line(271.00, 30.00, 271.00, 229.00);
line(291.00, 30.00, 291.00, 229.00);
line(311.00, 30.00, 311.00, 229.00);
line(332.00, 30.00, 332.00, 229.00);
line(352.00, 30.00, 352.00, 229.00);
line(372.00, 30.00, 372.00, 229.00);
line(33.00, 229.00, 372.00, 229.00);
line(33.00, 219.00, 372.00, 219.00);
line(33.00, 210.00, 372.00, 210.00);
line(33.00, 200.00, 372.00, 200.00);
line(33.00, 191.00, 372.00, 191.00);
line(33.00, 181.00, 372.00, 181.00);
line(33.00, 172.00, 372.00, 172.00);
line(33.00, 162.00, 372.00, 162.00);
line(33.00, 153.00, 372.00, 153.00);
line(33.00, 143.00, 372.00, 143.00);
line(33.00, 134.00, 372.00, 134.00);
line(33.00, 124.00, 372.00, 124.00);
line(33.00, 115.00, 372.00, 115.00);
line(33.00, 105.00, 372.00, 105.00);
line(33.00, 96.00, 372.00, 96.00);
line(33.00, 86.00, 372.00, 86.00);
line(33.00, 77.00, 372.00, 77.00);
line(33.00, 67.00, 372.00, 67.00);
line(33.00, 58.00, 372.00, 58.00);
line(33.00, 48.00, 372.00, 48.00);
line(33.00, 39.00, 372.00, 39.00);
line(33.00, 30.00, 372.00, 30.00);
popStyle();
}

void drawShape_477db86b() {
pushStyle();
noFill();
line(48.00, 30.00, 48.00, 229.00);
line(129.00, 30.00, 129.00, 229.00);
line(210.00, 30.00, 210.00, 229.00);
line(291.00, 30.00, 291.00, 229.00);
line(372.00, 30.00, 372.00, 229.00);
line(33.00, 229.00, 372.00, 229.00);
line(33.00, 191.00, 372.00, 191.00);
line(33.00, 153.00, 372.00, 153.00);
line(33.00, 115.00, 372.00, 115.00);
line(33.00, 77.00, 372.00, 77.00);
line(33.00, 39.00, 372.00, 39.00);
popStyle();
}

void drawShape_ed69d78() {
pushStyle();
noFill();
popStyle();
}

void fillShape_3bfb174b() {
pushStyle();
noStroke();
rect(48.41, 200.91, 16.22, 19.04);//from processShape

popStyle();
}
void drawShape_61b65bb0() {
pushStyle();
noFill();
rect(48.41, 200.91, 16.22, 19.04);//from processShape

popStyle();
}
void fillShape_b3db1ee() {
pushStyle();
noStroke();
rect(48.41, 162.83, 48.66, 19.04);//from processShape

popStyle();
}
void drawShape_7f6c8605() {
pushStyle();
noFill();
rect(48.41, 162.83, 48.66, 19.04);//from processShape

popStyle();
}
void fillShape_2dd2f39e() {
pushStyle();
noStroke();
rect(48.41, 124.74, 81.10, 19.04);//from processShape

popStyle();
}
void drawShape_74782192() {
pushStyle();
noFill();
rect(48.41, 124.74, 81.10, 19.04);//from processShape

popStyle();
}
void fillShape_7ae433fa() {
pushStyle();
noStroke();
rect(48.41, 86.65, 113.54, 19.04);//from processShape

popStyle();
}
void drawShape_1c10a11e() {
pushStyle();
noFill();
rect(48.41, 86.65, 113.54, 19.04);//from processShape

popStyle();
}
void fillShape_7c1c6f7() {
pushStyle();
noStroke();
rect(48.41, 48.57, 145.98, 19.04);//from processShape

popStyle();
}
void drawShape_42ed861b() {
pushStyle();
noFill();
rect(48.41, 48.57, 145.98, 19.04);//from processShape

popStyle();
}
void fillShape_77ff78f0() {
pushStyle();
noStroke();
rect(64.63, 200.91, 32.44, 19.04);//from processShape

popStyle();
}
void drawShape_255d121c() {
pushStyle();
noFill();
rect(64.63, 200.91, 32.44, 19.04);//from processShape

popStyle();
}
void fillShape_14fff6e() {
pushStyle();
noStroke();
rect(97.07, 162.83, 64.88, 19.04);//from processShape

popStyle();
}
void drawShape_2b0a8f6e() {
pushStyle();
noFill();
rect(97.07, 162.83, 64.88, 19.04);//from processShape

popStyle();
}
void fillShape_424e94d5() {
pushStyle();
noStroke();
rect(129.51, 124.74, 97.32, 19.04);//from processShape

popStyle();
}
void drawShape_350d4df5() {
pushStyle();
noFill();
rect(129.51, 124.74, 97.32, 19.04);//from processShape

popStyle();
}
void fillShape_7c792b08() {
pushStyle();
noStroke();
rect(161.95, 86.65, 129.76, 19.04);//from processShape

popStyle();
}
void drawShape_76f85a0f() {
pushStyle();
noFill();
rect(161.95, 86.65, 129.76, 19.04);//from processShape

popStyle();
}
void fillShape_2ae0cbce() {
pushStyle();
noStroke();
rect(194.39, 48.57, 162.20, 19.04);//from processShape

popStyle();
}
void drawShape_c645760() {
pushStyle();
noFill();
rect(194.39, 48.57, 162.20, 19.04);//from processShape

popStyle();
}
void drawShape_722349c2() {
pushStyle();
noFill();
line(33.00, 30.00, 33.00, 229.00);
line(33.00, 191.00, 38.00, 191.00);
line(33.00, 153.00, 38.00, 153.00);
line(33.00, 115.00, 38.00, 115.00);
line(33.00, 77.00, 38.00, 77.00);
line(33.00, 39.00, 38.00, 39.00);
popStyle();
}

void drawShape_6abf9a18() {
pushStyle();
noFill();
line(372.00, 30.00, 372.00, 229.00);
line(372.00, 191.00, 367.00, 191.00);
line(372.00, 153.00, 367.00, 153.00);
line(372.00, 115.00, 367.00, 115.00);
line(372.00, 77.00, 367.00, 77.00);
line(372.00, 39.00, 367.00, 39.00);
popStyle();
}

void drawShape_491dd468() {
pushStyle();
noFill();
line(33.00, 30.00, 372.00, 30.00);
line(48.00, 30.00, 48.00, 35.00);
line(129.00, 30.00, 129.00, 35.00);
line(210.00, 30.00, 210.00, 35.00);
line(291.00, 30.00, 291.00, 35.00);
popStyle();
}

void drawShape_45641d58() {
pushStyle();
noFill();
line(33.00, 229.00, 372.00, 229.00);
line(48.00, 229.00, 48.00, 224.00);
line(129.00, 229.00, 129.00, 224.00);
line(210.00, 229.00, 210.00, 224.00);
line(291.00, 229.00, 291.00, 224.00);
popStyle();
}
