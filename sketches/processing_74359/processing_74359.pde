
/*
 *      sem título.java
 *      
 *      Copyright 2012 Iara <iara@atena>
 */
 
 class Bubble {
  float x, y, x_value, y_value;
  int r = 4;
  int perfil;
  String id;
  color c;
  
  Bubble(float x_, float y_, String id_,int perfil_, float x_v, float y_v) {
    x = x_;
    y = y_;
    x_value = x_v;
    y_value = y_v;
    id = id_;
    perfil = perfil_;
    //mudar a cor de acordo com o perfil do usuario
    if(perfil == 1){
      c = color(352,74,85);
    }else if (perfil == 2){
      c = color(49,167,64);
    }else if (perfil == 3){
      c = color(49,79,167);
    }else{
      c = 200;
    }
      
  }
   
  void display() {

    if (dist(mouseX, mouseY, x, y) <= r) {
      fill(0);
    } else {
      fill(c);
    }
     
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
   
  void displayLabel() {
    if (dist(mouseX, mouseY, x, y) <= r) {
      String txt = "Aluno: " + id + "\nAtiv.:" + y_value + ", Nota: " + x_value;
      Label label = new Label(txt, mouseX, mouseY);
    }
  }
}

class Label {
   
  Label(String txt, float x, float y) {
     
    // get text width
    float labelW = textWidth(txt);
     
    // check if label would go beyond screen dims
    if (x + labelW + 20 > width) {
      x -= labelW + 20;
    }
     
    // draw bg
    fill(255);
    noStroke();
    rectMode(CORNER); // note: this is the default mode. confusing b/c similar to CORNERS (plural)
    rect(x+10, y-30, labelW+10, 35);
     
    // draw text
    fill(0);
    text(txt, x+15, y-15);
  }
}
class Point2D {
  float x, y;
   
  Point2D(float x_, float y_) {
    x = x_;
    y = y_;
  }
   
  float x() {
    return x;
  }
   
  float y() {
    return y;
  }
}
class Plot {
  Point2D topLeft, bottomRight;
  color c;
  
  Plot(int x1_, int y1_, int x2_, int y2_, color c_) {
    topLeft = new Point2D(x1_, y1_);
    bottomRight = new Point2D(x2_, y2_);
    c = c_;
  }
   
  Point2D topLeft() {
    return topLeft;
  }
   
  Point2D bottomRight() {
    return bottomRight;
  }
   
  float w() {
    return bottomRight.x - topLeft.x;
  }
   
  float h() {
    return bottomRight.y - topLeft.y;
  }
}

Plot plot;
Bubble[] bubbles = new Bubble[110];
 
int leftMargin = 20;
int rightMargin = 20;
int topMargin = 200;
int bottomMargin = 10;
PImage bg;
int numFrames = 12;  // The number of frames in the animation
int frame = 0;
 
int minRadius = 10;
int maxRadius = 30;
 
void setup() {
  
  size(980, 680);
  String url = "http://imageshack.us/a/img827/4276/uc3background.png";
  webImg = loadImage(url, "png");
  smooth();
  frameRate(30);

  // initialize plot
  plot = new Plot(leftMargin, topMargin, width-rightMargin, height-topMargin, color(235));
   
  // plot 5 bubbles
  generateValues();
}
 
void draw() {
  background(255);
  image(webImg, 0, 0);
  fill(102);
  text("Notas", 480, 570); 
  text("Alunos por atividade de estudo e nota final", 350, 100); 
  
   
  // display bubbles
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].display();
  }
   
  // display labels
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].displayLabel();
  }
  
}
 
void generateValues() {
  //String[] data = loadStrings("uc3.csv");
  String[] data =  {"79CBE190,1.025,7.8,3","3A1B84F4,0,4.2,1","267C1E34,0.725,8.9,3","562A867F,0.775,5.7,2","258DFC4B,0.45,6.8,2","1397BFB0,0.975,8.9,3","13085463,0.75,6.4,3","77A35CAF,0.875,7,2","46484C5E,0.95,6.5,2","22EB47AA,0.65,4.9,2","5EA91E42,0.5,7.3,2","673B031F,0.275,3.2,1","210B0D56,0.85,8.3,3","5978A120,0.3,2.4,1","3826E0DE,0.85,7.9,3","67657F86,0.975,6.3,2","4482494C,0.9,9.2,3","40164B6,0.075,6.4,2","189E4323,0.975,8.3,3","2B989949,1.025,10,3","281286BC,0.225,6.1,2","44AF14C1,1.025,8.5,3","63116A24,0.675,5.7,2","28E49A9D,0.95,8.7,3","B5D2F643,0,2.6,1,3","7ED68BE0,0.3,6.8,2","1DF2A12E,1.075,6.3,2","25762941,0.5,8.2,2","19449717,0.175,9.3,4","269E83C8,0.975,2.8,4","1B81A33E,0.875,7.9,3","7BF33A4A,0.15,2.1,1","6878BF80,0.525,8.2,2","4AD45AC5,0.025,4.3,1","2561F105,0.725,6.9,2",
  "6C643AAF,1.075,4.9,3","6A197CF7,0.875,8.9,3","71F3C736,0.2,3.5,1","14A1B78B,0.125,7.4,2","492E11B4,0.15,3.4,1","390C0CCC,0.7,7.2,2",
  "64B26A18,0.25,4.5,1","4D98EE47,0.875,6.9,2","13AB68B3,0.3,4.2,1","792B1580,0.475,5.6,2","7C52AF6D,0.35,6.9,2","6EBCD028,1.1,10,3",
  "4D41BBE3,0.025,3.6,1","7BCB919D,0.975,7.9,3","3FE45559,0.75,6.4,3","37594F45,1.025,5,4","107076E4,0.25,2.9,1","15A3743B,0.35,5.8,2",
  "44D029E4,0.675,8.1,3","5CD8B4FE,0,4.3,1","15EA15E5,0.5,6.4,2","ADBC154F,0.65,3.6,0","55BA642E,0.525,7.1,2","7365085E,0.925,6.5,2",
  "8CAB3DB0,0.175,5.8,2","52C319A1,0.75,6.4,2","60BAF986,0.275,5.8,2","7DCD514D,0.825,8,3","52E571B8,0.9,6.9,2","5B8F96B8,0.1,5.6,2",
  "26EA2FA7,0.775,7,2","4B929F6D,0.4,5.8,3","51FE3830,0.55,6.3,2","1567F200,0.5,5.8,2","26CE28DC,0.425,6.8,2","E3A19A90,0.95,7.6,3",
  "1A25F6BF,0.25,4.3,1","D616D4FA,1.025,7,2","4195063D,0.05,2.5,1","10E8A59E,0.325,6.7,2","77089DA4,1.075,8.3,3","74E3795C,0.525,6.3,2",
  "2777E5EE,0.075,6.3,2","740BC298,0.325,5.2,2","2556AF8C,0.15,3.9,1","4C84103A,0.5,6.2,2","5EC0B9E1,0.6,7.3,2","21604216,1.075,4.9,4",
  "68FA8B73,0.525,5.8,2","6A2A6BE9,1.05,6.9,2","445E679D,0.175,4.7,1","F952D04C,0.3,4.3,1","4DA185E9,0.375,5.6,2","3BC456D5,0.425,6.5,2",
  "7BA159DE,0.675,7.8,3","48295835,0.35,5.7,2","5DEBE97D,0.5,5.2,2","69DEEC46,1.05,7.8,3","1B52DD48,0.075,5.8,2","32B00B44,1,8.3,3",
  "347D5E36,0.575,5.7,2","B30252C7,0.05,3.6,1","224511B3,0.425,5.8,2","21C00083,0.325,10,0","1CCD2085,0.5,6.7,2","1823A1FA,0.4,3.6,1",
  "1C897F15,0.925,7,2","6BA5CF35,0.45,7.2,2","68151142,0.05,5.8,2","70F93A3B,0.325,6.8,2","5D73E08B,0.4,5.8,2","1ABFFBDD,0.05,6.7,2",
  "79D7BD5B,0.325,7.8,2","619B5433,0.025,4.5,1","1706D438,0.125,7.2,2"};
  for (int i = 0; i < bubbles.length; i++) {
    String[] temp=split(data[i],",");
    float x = float(temp[2]);
    float y = float(temp[1]);
    String id = temp[0];
    int perfil = int(temp[3]);
    bubbles[i] = new Bubble((98*x) - 80, (-300*y) + 500, id,perfil,x,y);
  }
}
