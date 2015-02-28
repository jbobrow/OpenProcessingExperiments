
/*
 *      sem título.java
 *      
 *      Copyright 2012 Iara <iara@atena>
 */
 
 class Bubble {
  float x, y, x_value;
  int y_value;
  int r = 4;
  int perfil;
  String id;
  color c;
  
  Bubble(float x_, float y_, String id_,int perfil_, float x_v, float y_v) {
    x = x_;
    y = y_;
    x_value = x_v;
    y_value = int(y_v);
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
      String txt = "Aluno: " + id + "\nQuant.:" + y_value + ", Nota: " + x_value;
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
  //color c;
  
  Plot(int x1_, int y1_, int x2_, int y2_, color c_) {
    topLeft = new Point2D(x1_, y1_);
    bottomRight = new Point2D(x2_, y2_);
   // c = c_;
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
 
int minRadius = 10;
int maxRadius = 30;
 
void setup() {
  
  size(980, 680);
  //bg = loadImage("/home/iara/uc3_background.png");
  String url = "http://imageshack.us/a/img19/8752/uc3t.png";
  // Load image from a web server
  bg = loadImage(url, "png");

  // initialize plot
  plot = new Plot(leftMargin, topMargin, width-rightMargin, height-topMargin, color(235));
   
  // plot 5 bubbles
  generateValues();
}
 
void draw() {
  background(255);
  //image(bg, 0, height/2, img.width/2, img.height/2);
  fill(102);
  text("Notas", 480, 570); 
  text("Alunos por nota final e quantidade de exercícios submetidos", 310, 70); 
   
  // display bubbles
  for (int i = 1; i < bubbles.length; i++) {
    bubbles[i].display();
  }
   
  // display labels
  for (int i = 1; i < bubbles.length; i++) {
    bubbles[i].displayLabel();
  }
  
}
 
void generateValues() {
  //String[] data = loadStrings("/home/iara/uc3.2.csv");
  String[] data = {"1,79CBE190,7.4,101,3","2,3A1B84F4,7.4,137,3","3,267C1E34,8,120,3","4,562A867F,7.7,135,3",
          "5,258DFC4B,7.5,131,3","6,1397BFB0,8.8,158,3","7,13085463,6.7,124,2","8,77A35CA,9.1,121,3","9,46484C5E,7.4,139,3",
          "10,22EB47AA,7.6,131,3","11,5EA91E42,7.9,127,3","12,673B031F,6.7,82,2","13,210B0D56,8.2,146,3","14,5978A120,8.7,136,3",
          "15,3826E0DE,7.5,150,3","16,67657F86,7,126,3","17,4482494C,8.4,139,3","18,240164B6,2.1,48,1","19,189E4323,1.8,52,1",
          "20,2B989949,5.6,131,0","21,281286BC,8.3,156,3","22,44AF14C1,7,148,3","23,63116A24,8.2,162,3","24,28E49A9D,2.9,68,1",
          "25,B5D2F64,3.2,47,1","26,7ED68BE0,1,3,1","27,1DF2A12E,8.6,153,3","28,25762941,7.6,143,3","29,19449717,7.5,93,3",
          "30,269E83C8,1.2,0,0","31,1B81A33E,9,154,3","32,7BF33A4A,6.5,61,2","33,6878BF80,7.5,101,3","34,4AD45AC5,9.1,135,3",
          "35,2561F105,1.7,13,1","36,6C643AAF,1.4,18,1","37,6A197CF,7.2,91,3","38,71F3C736,8.3,148,3","39,14A1B78B,6.9,69,2",
        "40,492E11B4,2.6,22,1","41,390C0CCC,7,147,3","42,64B26A18,1.5,24,1","43,4D98EE47,8,150,3","44,13AB68B3,2.3,0,1","45,792B1580,2.7,79,1",
      "46,7C52AF6D,7.7,100,3","47,6EBCD028,1.3,0,1","48,4D41BBE3,2.6,0,1","49,7BCB919D,7.6,155,3","50,3FE45559,4,29,1","51,37594F45,7.1,119,3",
    "52,107076E4,2.9,53,1","53,15A3743B,7.3,104,3","54,44D029E4,1.3,33,1","55,5CD8B4FE,6.1,55,2","56,15EA15E5,3.5,79,1","57,ADBC154,5.8,43,2",
  "58,55BA642E,7.1,64,2","59,7365085E,2.4,108,0","60,8CAB3DB,1.6,36,1","61,52C319A1,4.4,72,1","62,60BAF986,2.6,25,1","63,7DCD514D,7,148,3",
"64,52E571B8,3.2,36,1","65,5B8F96B8,6.4,72,2","66,26EA2FA,8.9,64,0","67,4B929F6,8.2,153,3","68,51FE3830,7.2,131,3","69,1567F200,1.4,0,1",
"70,26CE28D,1.2,2,1","71,E3A19A,6.8,80,2","72,1A25F6BF,5.6,92,2","73,D616D4F,1.2,0,1","74,4195063D,1.1,15,1","75,10E8A59E,5.8,103,2",
"76,77089DA4,3,14,1","77,74E3795C,5.6,40,2","78,2777E5EE,6.4,96,2","79,740BC298,3.7,124,0","80,2556AF8C,6.8,103,3","81,4C84103A,8.2,146,3",
"82,5EC0B9E1,1.0,0,1","83,21604216,6.9,115,2","84,68FA8B73,8.2,137,3","85,6A2A6BE9,1.6,0,1","86,445E679D,7.1,90,3","87,F952D04,8.6,139,3",
"88,4DA185E9,3.4,40,1","89,3BC456D5,5.7,55,2","90,7BA159DE,6.4,110,2","91,48295835,7,121,3","92,5DEBE97D,4,69,1","93,69DEEC46,4,69,1",
"94,1B52DD48,1.3,22,1","95,32B00B44,3.8,65,1","96,347D5E36,9.1,157,3","97,B30252C,4.3,74,1","98,224511B3,4.4,75,1","99,21C00083,6,104,2",
"100,1CCD2085,4.8,83,2","101,1823A1FA,2.7,47,1","102,1C897F15,7.3,125,3","103,6BA5CF35,8,138,3","104,68151142,8.4,144,3","105,70F93A3B,4.8,82,2",
"106,5D73E08B,7.2,123,3","107,1ABFFBDD,3.4,59,1","108,79D7BD5B,8.8,152,3","109,619B5433,5.2,90,2","110,1706D43,2.7,148,0"};
  for (int i = 1; i < bubbles.length; i++) {
    String[] temp=split(data[i],",");
    //println(temp);
    float x = float(temp[2]);
    float y = float(temp[3]);
    String id = temp[1];
    int perfil = int(temp[4]);
    bubbles[i] = new Bubble((95*x) - 55, (-2.4 *y) + 520, id,perfil,x,y);
  }
}
