
/**
 *  Interactive Color Bar chart
 *
 * <br> Click and drag the tops of the columns to change background color<br>
 * <br> Michelle Phung
 * <br> NYU Introduction to Interactive Data Visualization
 * <br> Feb 11, 2015
 * <br> Assignment # 2 (part 1 of 2) Calculate Something
 *
 *
 */
int x = 250, 
    y =  40; 
    
int barw = 103;
int up = 208;

int barRx = x +  25, barRy = y+up,
    barGx = x + 164, barGy = y+up,
    barBx = x + 304, barBy = y+up;
    
String ha = "74", hb = "5D", hc = "55",
        r = "116", g = "93" ,b = "85";
    
int r_height = 116,
    g_height = 93,
    b_height = 85;

int r_min = 270, r_max = 390,
    g_min = 410, g_max = 525,
    b_min = 550, b_max = 665;

int bar_min = 265, bar_max = 45;

color backgroundColor = #745D55;
  
void setup () {
  size(780,435);
  frameRate(60);
}

void draw () {
  background(r,g,b);
  drawAxis(x, y);
  drawType();
  
  drawBar(barRx, barRy, barw, r_height, red);    //x,y,h,w 
  drawBar(barGx, barGy, barw, g_height, green);  //x,y,h,w 
  drawBar(barBx, barBy, barw, b_height, blue);   //x,y,h,w 

  drawHex();
  drawRGB();
}

void mouseDragged(){
  int offset = 170;
  int ycoor = getFromLength_Bottom(mouseY)- offset;
  int mult = (255/205);
  
  if(mouseX > r_min && mouseX < r_max){
    r_height = constrain(ycoor);
    r = "" + ceil(r_height*mult);
    ha = hex(r,2);
  }
  if(mouseX > g_min && mouseX < g_max){
    g_height = constrain(ycoor);
    g = "" +ceil(g_height*mult);
    hb = "" + hex(g,2);
  }
  if(mouseX > b_min && mouseX < b_max){
    b_height = constrain(ycoor);
    b = "" + ceil(b_height*mult);
    hc = "" + hex(b,2);
  }
}

int constrain(int number){
    
  if( number < 0 ){
    return 0;
  }
  
  if(number > 205){
    return 205;
  }
  
  return number;
}

void drawType(){
  drawAxisNumbers();
  drawLabels();
  drawInstructions();
}


void drawInstructions(){
     PFont font;
  font = createFont("SourceSansPro-Regular", 66);
  textFont(font);
  textSize(14);
  
  fill(darkGray);
  text("               click and drag on the bars\nin the graph to change the values", 500, 40);
   
  noFill();
}

void drawHex(){
  PFont font;
  font = createFont("SourceSansPro-Light", 65, true);
  textFont(font);
  int y = 320;
  
  
  fill(red);
  text(ha, x + 40, y); 
  
  fill(green);
  text(hb, x +183, y);
  
  fill(blue);
  text(hc, x +320, y);
  
  noFill();
}

void drawRGB(){
  PFont font;
  font = createFont("SourceSansPro-Light", 65);
  textFont(font,65);
  int y = 395;
  
  fill(red);
  text("(", x + 10, y); 
  text(r, x + 40, y);   //r
  text(",", x + 140, y);
  
  fill(green);
  text(g, x + 183, y);  //g
  text(",", x + 280, y);
  
  fill(blue);
  text(b, x + 320, y);  //b
  text(")", x + 410, y);
  
  noFill();
}

void drawAxisNumbers(){
  PFont font;
  font = createFont("SourceSansPro-Light", 26);
  textFont(font, 26);
 
  fill(darkGray);
  text("FF", x - 93, 50); 
  fill(veryLightGray);
  text("255", x - 56, 50);
  noFill();
}

void drawLabels(){
  PFont font;
  font = createFont("SourceSansPro-Regular", 66);
  textFont(font);
  textSize(66);
  
  fill(darkGray);
  text("hex #", x - 162, 320); 
  
  fill(veryLightGray);
  text("rgb", x - 110, 395);
  
  noFill();
}

void drawAxis( int x, int y){
  noFill();
  stroke(white);
  strokeWeight(3);
  
  int h = 250;
  int w = 430;
  
  strokeWeight(5);
  strokeJoin(ROUND);
  strokeCap(SQUARE);
  beginShape();
  vertex(x, y);
  vertex(x, h);
  vertex(x + w, h);
  endShape();
}

void drawBar(int x, int y, int w, int h,color bcolor ){
  stroke(bcolor);
  strokeWeight(5);
  
  strokeJoin(ROUND);
  strokeCap(SQUARE);
  beginShape();
  vertex(x, y);
  vertex(x, y - h);
  vertex(x + w, y - h);
  vertex(x + w, y);
  endShape();
}

int getFromLength_Top(int lengthFromBottom){
  return lengthFromBottom;
}

int getFromLength_Right(int lengthFromLeft){
  return (width - lengthFromLeft);
}

int getFromLength_Bottom(int lengthFromBottom){
  return (height - lengthFromBottom);
}

int getFromLength_Left(int lengthFromRight){
  return (width - lengthFromRight);
}
color   black = #000000;
color   white = #ffffff;
color   red = #CD2626;
color   orange = #FF9217;
color   yellow = #F2E060;
color   green = #458B00;
color   blue = #586CBB;
color   purple = #72587F; 
color   pink = #C76BD2;
color   gray= #d7d7d7;
color   darkGray = #444444;
color   veryLightGray = #d0d0d0;
