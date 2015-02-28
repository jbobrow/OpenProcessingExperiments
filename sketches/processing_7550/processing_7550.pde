
PFont[][] myFonts;
int font1;
int font2;
PFont displayFont;
String message;
String initialMessage;
String[] fontNames ={"Arial","Arial Narrow","Bodoni","Calibri","Cambria","Candara","Century Gothic","Consolas","Constantia","Corbel","Courier New","Frutiger","Garamond","Georgia","GillSans","Helvetica","Palatino","Rockwell","Times New Roman"};;
int NB_FONTS=19;
void setup(){
size(900,400);
background(255);
myFonts= new PFont[19][2];


myFonts[0][0]=loadFont("Arial.vlw");myFonts[0][1]=loadFont("ArialItalic.vlw");
myFonts[1][0]=loadFont("ArialNarrow.vlw");myFonts[1][1]=loadFont("ArialNarrowItalic.vlw");
myFonts[2][0]=loadFont("Bodoni.vlw");myFonts[2][1]=loadFont("BodoniItalic.vlw");
myFonts[3][0]=loadFont("Calibri.vlw");myFonts[3][1]=loadFont("CalibriItalic.vlw");
myFonts[4][0]=loadFont("Cambria.vlw");myFonts[4][1]=loadFont("CambriaItalic.vlw");
myFonts[5][0]=loadFont("Candara.vlw");myFonts[5][1]=loadFont("CandaraItalic.vlw");
myFonts[6][0]=loadFont("CenturyGothic.vlw");myFonts[6][1]=loadFont("CenturyGothicItalic.vlw");
myFonts[7][0]=loadFont("Consolas.vlw");myFonts[7][1]=loadFont("ConsolasItalic.vlw");
myFonts[8][0]=loadFont("Constantia.vlw");myFonts[8][1]=loadFont("ConstantiaItalic.vlw");
myFonts[9][0]=loadFont("Corbel.vlw");myFonts[9][1]=loadFont("CorbelItalic.vlw");
myFonts[10][0]=loadFont("CourierNew.vlw");myFonts[10][1]=loadFont("CourierNewItalic.vlw");
myFonts[11][0]=loadFont("Frutiger.vlw");myFonts[11][1]=loadFont("FrutigerItalic.vlw");
myFonts[12][0]=loadFont("Garamond.vlw");myFonts[12][1]=loadFont("GaramondItalic.vlw");
myFonts[13][0]=loadFont("Georgia.vlw");myFonts[13][1]=loadFont("GeorgiaItalic.vlw");
myFonts[14][0]=loadFont("GillSans.vlw");myFonts[14][1]=loadFont("GillSansItalic.vlw");
myFonts[15][0]=loadFont("Helvetica.vlw");myFonts[15][1]=loadFont("HelveticaItalic.vlw");
myFonts[16][0]=loadFont("Palatino.vlw");myFonts[16][1]=loadFont("PalatinoItalic.vlw");
myFonts[17][0]=loadFont("Rockwell.vlw");myFonts[17][1]=loadFont("RockwellItalic.vlw");
myFonts[18][0]=loadFont("TimesNewRoman.vlw");myFonts[18][1]=loadFont("TimesNewRomanItalic.vlw");

displayFont=createFont("Arial", 12, true);

font1 = 0;
font2 = 1;
initialMessage="abdfjklmoptvxyz";
message=initialMessage;

}
void draw(){
  
  background(255);
  textFont(displayFont);
  if(font2!=font1){textAlign(RIGHT);fill(255,0,0,128);text(fontNames[font2],880,30);}
  textAlign(LEFT);fill(0,0,255,128);text(fontNames[font1],20,30);
  fill(0);
  text("[LEFT], [RIGHT] keys change the blue font, [UP],[DOWN] keys change the red font. [PG UP] keeps blue font only, [PG DOWN] keeps red font only. \nType your text or [BACKSPACE] to revert to default.", 20, 370);
  
  for (int j=0;j<4;j++){
    int x=10;String myText;
    if (j==1||j==3) {myText=message.toUpperCase();} else {myText=message;}
    
    if(font2!=font1){
      textAlign(CENTER);
      for (int i=0;i<myText.length();i++){
        float maxX=0;
        textFont(myFonts[font2][int(j/2)]);
        maxX=textWidth(myText.charAt(i));
        textFont(myFonts[font1][int(j/2)]);
        maxX=max(maxX,textWidth(myText.charAt(i)));
        
        fill(0,0,255,128);text(myText.charAt(i),x+maxX/2,100+j*80);
        fill(255,0,0,128);textFont(myFonts[font2][int(j/2)]);text(myText.charAt(i),x+maxX/2,100+j*80);
        
        x+=maxX;
      }
    } else {fill(0);
      textAlign(LEFT);
      textFont(myFonts[font2][int(j/2)]);
      text(myText,20,100+j*80);
    }
  }  
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == DOWN) {
      font2++;if(font2==NB_FONTS){font2=0;}
    } else if (keyCode == UP) {
      font2--;if(font2==-1){font2=NB_FONTS-1;}
    } else if (keyCode == LEFT) {
      font1--;if(font1==-1){font1=NB_FONTS-1;}
    } else if (keyCode == RIGHT) {
      font1++;if(font1==NB_FONTS){font1=0;}
    } else if (keyCode == 34) {
      font1=font2;
    } else if (keyCode == 33) {
      font2=font1;
    } else {println (keyCode);}
  } else {
    if (key == BACKSPACE || key == ESC || key == DELETE) {
      message=initialMessage;
    } else if (message==initialMessage) {
      message=""+key;
    } else {
      message+=key;
    }
  }
}


