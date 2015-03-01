
/**
 * Tree <br><br>
 *
 * Drag your mouse around the screen to paint a forest.<br><br>
 * 
 * <br> Michelle Phung
 * <br> NYU Introduction to Interactive Data Visualization
 * <br> Feb 11, 2015
 * <br> Assignment # 2 (part 2 of 2) Draw Something
 *
 */

void setup () {
  size(600,400);
}

void draw () {
}

void mouseMoved() {
background(gray);
  color randomColor = color(random(255),random(255),random(255));
  drawTree(mouseX, mouseY, random(100), random(100), randomColor);
}

void drawTree(int x, int y, int w, int h, color treeColor){
  noStroke();
  fill(treeColor);
  triangle(x, y, x-(w/2), y+(h/4), x+(w/2), y+(h/4));
  triangle(x, y+(h*0.25), x-(w/2), y+(h*(4/8)), x+(w/2), y+(h*(4/8)));
  triangle(x, y+(h*0.5), x-(w/2), y+(h*(6/8)), x+(w/2), y+(h*(6/8)));
  rect(x-(w*0.125), y+(h*0.75), w*0.25, h*0.2);
}
color black  = #000000;
color white = #ffffff;
color      red = #ED2B2B;
color      orange = #FF9217;
color      yellow = #F2E060;
color      green = #32B51D;
color      blue = #586CBB;
color      purple = #78379E; 
color      pink = #C76BD2;
color      gray= #AAAAAA;


