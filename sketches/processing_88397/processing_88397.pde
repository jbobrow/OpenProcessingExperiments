
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/52245*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */


/*
  Sorts an array of balls by index, and by color (press any key to sort).
 Uses a custom sort class (SortObjects) to sort an array of objects by data field.
 */

Ball[] balls = new Ball[50]; // object array

Button buttons;
//ColorGuide colors;

float damping = 0.09;
int cols = 10;
int topMargin = 250;
int marginL = 50;
int viewVal;
int x = 2;
PImage diag;
PImage colorDiag;
PImage calLabel;

// booleans 
Boolean sortByColor = false;
Boolean viewBars = false;
Boolean circTest = false;
Boolean clicked = false;
Boolean clicked2 = false;
PFont font; // declare font variable of type PFont
PFont font2;

// button variables
float barsX = 850;
float barsW = 35;
float radialX = 923;
float radialW = 50;
float buttonY = 40;
float slideX;
float slideY = buttonY;
float spaceV = 40;

// colors
color copperC = color(192,67,23);
color ironC = color(108,144,235);
color zincC = color(156,145,141, 124);

color vegC = color(153, 215, 148, 130);
color fruitC = color(239,166,219, 71);
color grainC = color(246,180,3 , 80); 
color meatC = color(246,78,85);
//color sugarC = color(249, 88, 76, 55);

void setup() {
  size(1024, 600);
  frameRate(60);
  smooth();

  buttons = new Button();
  //colors = new ColorGuide();

 
  //Ball(String name_, String type_, float copper_, float iron_, float zinc_, int cal_, float x_, float y_,)
  balls[0] = new Ball("apple", "fruit", 0.034, 0.17, 0.06, 45, width/2, height/2); 
  balls[1] = new Ball("asparagus", "vegetable", 0.099, 0.55, 0.74, 24, width/2, height/2); 
  balls[2] = new Ball("artichoke", "vegetable", 0.152, 0.73, 0.18, 16*2, width/2, height/2); 
  balls[3] = new Ball("avocado", "fruit", 0.088, 0.17, 0.19, 28*2, width/2, height/2);
  balls[4] = new Ball("beef liver", "meat", 12.4, 5.24, 4.45, 1*2, width/2, height/2);  
  balls[5] = new Ball("banana", "fruit", 0.117, 0.39, 0.18, 19*2, width/2, height/2);
  balls[6] = new Ball("blueberry", "fruit", 0.083, 0.41, 0.23, 30*2, width/2, height/2);
  balls[7] = new Ball("blackberry", "fruit", 0.238, 0.89, 0.76, 8*2, width/2, height/2);
  balls[8] = new Ball("beans", "vegetable", 0.552, 3.02, 4.84, 5*2, width/2, height/2);
  balls[9] = new Ball("broccoli", "vegetable", 0.095, 0.64, 0.36, 27*2, width/2, height/2);
  balls[10] = new Ball("cabbage", "vegetable", 0.013, 0.33, 0.13, 47*2, width/2, height/2);
  balls[11] = new Ball("celery", "vegetable", 0.014, 0.24, 0.05, 46*2, width/2, height/2);
  balls[12] = new Ball("carrot", "vegetable", 0.05, 0.22, 0.26, 37*2, width/2, height/2);
  balls[13] = new Ball("cucumber", "vegetable", 0.043, 0.29, 0.6, 39*2, width/2, height/2);
  balls[14] = new Ball("crab", "meat", 1.026, 0.33, 0.28, 4*2, width/2, height/2);
  balls[15] = new Ball("corn", "vegetable", 0.036, 0.47, 0.37, 44*2, width/2, height/2);
  balls[16] = new Ball("cranberry", "fruit", 0.011, 0.13, 0.03, 48*2, width/2, height/2);
  balls[17] = new Ball("cherry", "fruit", 0.041, 0.24, 0.05, 40*2, width/2, height/2);
  balls[18] = new Ball("eggplant", "vegetable", 0.058, 0.25, 0.12, 36*2, width/2, height/2);
  balls[19] = new Ball("grapefruit", "fruit", 0.039, 0.1, 0.09, 41*2, width/2, height/2);
  balls[20] = new Ball("ham", "meat", 0.278, 0.41, 1.05, 7*2, width/2, height/2);
  balls[21] = new Ball("ground beef", "meat", 0.072, 2.01, 5.26, 32*2, width/2, height/2);  
  balls[22] = new Ball("honeydew", "fruit", 0.038, 0.29, 0.15, 42*2, width/2, height/2);
  balls[23] = new Ball("haddock", "meat", 0.028, 1.15, 0.72, 45*2, width/2, height/2);
  balls[24] = new Ball("kiwi", "fruit", 0.099, 0.24, 0.11, 25*2, width/2, height/2);
  balls[25] = new Ball("lobster", "meat", 3.65, 0.33, 2.48, 3*2, width/2, height/2);
  balls[26] = new Ball("lettuce", "vegetable", 0.135, 2.21, 0.81, 18*2, width/2, height/2);
  balls[27] = new Ball("lamb", "meat", 0.111, 1.8, 3.8, 20*2, width/2, height/2);
  balls[28] = new Ball("mango", "fruit", 0.228, 0.21, 0.07, 10*2, width/2, height/2);
  balls[29] = new Ball("onion", "vegetable", 0.062, 0.34, 0.19, 35*2, width/2, height/2);
  balls[30] = new Ball("oyster", "meat", 3.74, 5.59, 3.28, 2*2, width/2, height/2);
  balls[31] = new Ball("orange", "fruit", 0.081, 0.13, 0.13, 31*2, width/2, height/2);
  balls[32] = new Ball("green pepper", "vegetable", 0.098, 0.4, 0.15, 26*2, width/2, height/2);
  balls[33] = new Ball("coconut", "fruit", 0.196, 1.09, 0.5, 14*2, width/2, height/2);
  balls[34] = new Ball("pumpkin", "fruit", 0.223, 1.4, 0.56, 11*2, width/2, height/2);
  balls[35] = new Ball("plum", "fruit", 0.038, 0.11, 0.07, 43*2, width/2, height/2);
  balls[36] = new Ball("potato", "vegetable", 0.474, 0.55, 0.73, 6*2, width/2, height/2);
  balls[37] = new Ball("pork", "meat", 0.084, 0.8, 0.54, 29*2, width/2, height/2);
  balls[38] = new Ball("rice", "grain", 0.109, 2.92, 1.92, 21*2, width/2, height/2);
  balls[39] = new Ball("pineapple", "fruit", 0.171, 0.45, 0.19, 15*2, width/2, height/2);
  balls[40] = new Ball("sweet potato", "vegetable", 0.147, 1.12, 0.31, 17*2, width/2, height/2);
  balls[41] = new Ball("soybean", "vegetable", 0.211, 4.5, 1.64, 13*2, width/2, height/2);
  balls[42] = new Ball("spinach", "vegetable", 0.107, 0.27, 0.16, 22*2, width/2, height/2);
  balls[43] = new Ball("mushroom", "vegetable", 0.223, 0.35, 0.36, 12*2, width/2, height/2);
  balls[44] = new Ball("turkey", "meat", 0.234, 1.96, 3.75, 9*2, width/2, height/2);
  balls[45] = new Ball("tomato", "vegetable", 0.106, 0.33, 0.34, 23*2, width/2, height/2);
  balls[46] = new Ball("tuna", "meat", 0.07, 0.82, 0.65, 33*2, width/2, height/2);
  balls[47] = new Ball("watermelon", "fruit", 0.064, 0.69, 0.15, 34*2, width/2, height/2);
  balls[48] = new Ball("white bread", "grain", 0.046, 0.94, 0.19, 38*2, width/2, height/2);
  balls[49] = new Ball("wheat", "grain", 0.18, 5.8, 3.52, 14*2, width/2, height/2);

  // load fonts
  font = loadFont("AkkuratPro-Regular-31.vlw");
  font2 = loadFont("ATSackersHeavyGothic-13.vlw");

  // load images
  colorDiag = loadImage("diagram.png");
  calLabel = loadImage ("mg.png");
}

void draw() {

  background(240, 242, 231); 

  image(colorDiag, 650, height*.03);
     image(calLabel, 19, width/4); 
    
  // buttons
 buttons.position(900, 100);
 buttons.display();
 buttons.slidePosition(barsX, slideY, barsX, slideY+spaceV);
 buttons.isHover();

  // draw balls
  for (int i = 0; i < balls.length; i++) {

   
      int cols = 50;
      float spacer = .9*width / cols; // get grid cell size
      float col = i % cols;
      float row = floor(i / cols);

      float posX = marginL + col * spacer + spacer/2;
      float posY = topMargin + height/2;

      balls[i].position(posX, posY);
      balls[i].display(2);
      balls[i].isMouseBars();

      // graph line left
      noFill();
      strokeWeight(1);
      stroke(190);
      line(35, topMargin+height/2, 35, topMargin+height/2-200); 
      
    }
  }
//}

void mousePressed() {

    if ((mouseX > radialX) && (mouseX < radialX + radialW) && (mouseY > buttonY + spaceV - 5) && (mouseY < buttonY + spaceV + 30)) {
    clicked2 = false;
    Arrays.sort(balls, new SortObjects("type"));
    sortByColor = true;
    }
  else if ((mouseX > barsX) && (mouseX < barsX + barsW + 20) && (mouseY > buttonY + spaceV - 5) && (mouseY < buttonY + spaceV + 5)) {
    clicked2 = true;
    Arrays.sort(balls, new SortObjects("copper"));
    sortByColor = true;
  } else {
  }
}


class Ball {
 
   int cal;
   float x;
   float y;
   float lineH;
   float triScale;
   float circDiam = 25;
   float endX;
   float endY;
   Boolean hover = false;
   
   //captions
   float bigTxtY = 120;
   float smallTxtY = bigTxtY + 17;
   
   //float colHue;
   float copper, iron, zinc;
   float w = 50;
   float h = 50;
   String name;
   String type;
   int view;
 
 Ball(String name_, String type_, float copper_, float iron_, float zinc_, int cal_, float x_, float y_) {
   name = name_;   
   cal = cal_;
   type = type_;
   x = x_;
   y = y_; 
   endX = x_;
   endY = y_;
   copper = copper_;  
   iron = iron_;
   zinc = zinc_;
 }
 

 void display(int view_) {
   
   view = view_;
  
   if (hover) {
       
     //draw caption
     textFont(font);
     String txt = name;
     fill(103, 102, 92);
     text(txt, 75, bigTxtY);
     
     text(copper, 270, bigTxtY);
    
     textFont(font2);     
     String cap = type;
     fill(118, 116, 107, 150);
     text(cap, 75, smallTxtY);
     text("mg of copper", 270, smallTxtY);

   }
   
   // type indicator
   if (type == "vegetable") {
     noStroke();
     fill(vegC);
     } else if (type == "fruit") {
     noStroke();
     fill(fruitC);
     } else if (type == "grain") {
     noStroke();
     fill(grainC);
     } else if (type == "meat") {
     noStroke();
     fill(meatC);
    // } else {
     //noStroke();
     //fill(sugarC);  
     }
     
   if (view == 1) { 
     noStroke();
     
     x = x + (endX - x) * damping;
     y = y + (endY - y) * damping;
     
     ellipse(x, y, cal*.9, cal*.9);
    
   }
   
   if (view == 2) {
    
     strokeCap(SQUARE);
     
     x = x + (endX - x) * damping;
     y = y + (endY - y) * damping;
     
     lineH = (20);
     
     int[] colorList = {copperC, ironC, zincC, };
     int[] typeList = {vegC, fruitC, grainC, meatC};

    
     //bar graph
     noFill();
     strokeWeight(8);
     stroke(colorList[0]);
     beginShape(LINES);
     vertex(x, y);
     vertex(x, y-copper*lineH);
     stroke(colorList[1]);
     vertex(x, y-copper*lineH);
     vertex(x, y-(iron+copper)*lineH);
     stroke(colorList[2]);
     vertex(x, y-(iron+copper)*lineH);
     vertex(x, y-(iron+copper+zinc)*lineH);
     endShape();
     
     // type indicator
     if (type == "vegetable") {
     noStroke();
     fill(vegC);
     } else if (type == "fruit") {
     noStroke();
     fill(fruitC);
     } else if (type == "grain") {
     noStroke();
     fill(grainC);
     } else if (type == "meat") {
     noStroke();
     fill(meatC);
    
     }     
     
     ellipse(x, y+20, 10, 10);
   } 
 }
   
  Boolean isMouseCircs() {
 
    if ((mouseX > x - circDiam) && (mouseX < x + circDiam) && (mouseY > y - circDiam) && (mouseY < y + circDiam)) {
      hover = true;
      return true;
 
    } else {
      hover = false;
      return false;
    }
  }

 Boolean isMouseBars() { 
   
    if ((mouseX > x - 5) && (mouseX < x + 5) && (mouseY > y - cal) && (mouseY < y + 50)) {
      hover = true;
      return true;
    } else {
      hover = false;
      return false;
    } 
  }

 
 void position(float x_, float y_) {
   endX = x_;
   endY = y_; 
 }
}
class Button {
  Boolean hover = false;
  float x;
  float y;
  float endX;
  float endY;
  float endbx;
  float endby;
  float endcx;
  float endcy;
  float rx, ry;
 
  //button loc variables
  float bx = radialX;
  float by = buttonY;
  float cx = radialX;
  float cy = buttonY + spaceV;
  
  Button() {
  }
  
  void display() {
    
    // title
    textFont(font2);     
    fill(copperC);
    text("HEAVY METAL CONTENT IN FOOD: copper, iron & zinc", marginL+10, buttonY);
    
    // bars 
    if (clicked2) {
      textFont(font2); 
      fill(copperC);
      text("metal", barsX, buttonY+spaceV);
      fill(118, 116, 107, 50);
      text("type", radialX+17, buttonY+spaceV);
    } else {
      textFont(font2);     
      fill(118, 116, 107, 50);
      text("metal", barsX, buttonY+spaceV);
      fill(copperC);
      text("type", radialX+17, buttonY+spaceV);
    }
    
    
    // slider line
    noFill();
    strokeWeight(1);
    stroke(118, 116, 107, 150);
    line(barsX, buttonY+10+spaceV, radialX + radialW*.95, buttonY+10+spaceV);
    
    // sliding bar
    noStroke();
    fill(copperC);
    rect(cx,cy+7,radialW,7);
    
    if (clicked) {
      bx = bx + (endbx - bx) * damping;
      by = by + (endby - by) * damping;
    } else {
      bx = bx + (radialX - bx) * damping;
      by = by + (endby - by) * damping;
    }
    
    if (clicked2) {
      cx = cx + (endcx - cx) * damping;
      cy = cy + (endcy - cy) * damping;
    } else {
      cx = cx + (radialX - cx) * damping;
      cy = cy + (endcy - cy) * damping;
    }
    
  }
  
  void slidePosition(float endbx_, float endby_, float endcx_, float endcy_) {
    endbx = endbx_;
    endby = endby_;
    endcx = endcx_;
    endcy = endcy_;
  }
  
  void position(float endX_, float endY_) {
    endX = endX_;
    endY = endY_;
  }
    
  
  Boolean isHover() {
       
    if ((mouseX > 800) && (mouseX < 850) && (mouseY > 45) && (mouseY < 55)) {
      hover = true;
      return true;
    } else {
      hover = false;
      return false;
    } 
  }
}
  
      
      
    
class SortObjects implements Comparator {

  String fieldToSortOn;

  // Class constructor sets the column to sort on
  SortObjects(String fieldToSortOn_) {
    fieldToSortOn = fieldToSortOn_;
  }


  int compare(Object object1, Object object2) {

    // cast the objects to your specific object class to be sorted by
    Ball row1 = (Ball) object1;
    Ball row2 = (Ball) object2;

    if (fieldToSortOn == "type") {

      // necessary to cast to Integer type when comparing ints
      String val1 = (String) row1.type;
      String val2 = (String) row2.type;

      return val1.compareTo(val2);
    }
    else if (fieldToSortOn == "copper") {
      Integer val1 = (Integer) row1.cal;
      Integer val2 = (Integer) row2.cal;

      return val1.compareTo(val2);
    }

    // avoid error.
    return 0;
  }
}



