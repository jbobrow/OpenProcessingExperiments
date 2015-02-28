
int x;
PFont RageItalicFont;
PFont ScriptMTBoldFont;
PImage myImage;


void setup(){
  size(360,450);
  x=0;
  RageItalicFont = loadFont("RageItalic-48.vlw");
  ScriptMTBoldFont = loadFont("ScriptMTBold-64.vlw");
  myImage = loadImage("coffee.jpg");
}

void draw(){
  tint(85);
  image(myImage,0,0);
  
  fill(0,255,0);
  textFont(ScriptMTBoldFont);
  text("STFU fails",80,180);
  
  
  fill(0);
  textFont(RageItalicFont);
  text("RaGeQuIt",mouseX,mouseY);
  
  
}

