
PFont myFont;    // font data
char  selected;  // what is selected (h,m,s)
int   gapH;       // gap between digits
int   gapM;  
 int   gapS; 
 int startPos;
 int offset;
 int SecondStartValue;
 int textSizeS;
 int textSizeM; 
  int textSizeH;
int RectSize1,RectSize2, RectSize3;  

float lenM;
 int lenH;
 
  
void setup() {
  size(1024, 600);
 textSizeH=20; 
 textSizeM=20;
 textSizeS=20;

 
  //myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  //textFont(myFont);  // set the current font to myFont
  selected = '0';
    
    gapM = 300;
    gapH = 300;

println(second());
  startPos=300/second();
  
  noStroke();
}
 
void draw() {
  
  
  
 
  if (hour()>=6) { background(60,80,128); }
  if (hour()>=12) {background(255,162,0); }
  if (hour()>=18) {background(142,99,24);}
  if (hour()>=24) {background(192,192,192);}
  


  
  fill(255);
  
    // normal font size

  // draw h, m, s
  
  gapM=(-300/60) *minute();
  offset=abs(gapM+0);

  println(offset);

  // seconds

  
 gapS = (300-offset)-(300/60) *second();
 fill(0,0,255);
 rect(494+gapS, 278,40,40);
 fill(255,0,0);

 drawNumber(second(), selected == 's', gapS,0);
 
 
 
 
 
fill(0,254,0);
rect(493+gapM, 278,40,40);
fill(0,0,255);
drawNumber(minute(), selected == 'm', gapM, 0);




fill(255,0,0);
rect(-105+gapH, 278,40,40);
fill(0,255,0);
drawNumber(hour(), selected == 'h', -gapH, 0);


  
  
  
  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  
  
  
  
 // drawBanner(c, 10);
  
  
  
  
  
  
  
}
 
/*sssm
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY. If big is true then use a big size for the type.
 *
 */
void drawNumber(int number, boolean big, float offsetX, float offsetY) {
  String theText = str(number); // convert number to string
  
  
  if (big)
    textSize(400); // set big font size
  else
    textSize(20);  // normal font size
     
  float textWidth = textWidth(theText) * 0.5;
  float textAscent = textAscent() * 0.375;
 
 
 
  
 
 
  // draw text offset from the centre of the screen
  text(theText, (int) width/2 - textWidth + offsetX, (int) height/2 + textAscent + offsetY);
 
 }
 

 
 
 
void keyReleased() {
  // set selected to be the last key released
  selected = key;
}

