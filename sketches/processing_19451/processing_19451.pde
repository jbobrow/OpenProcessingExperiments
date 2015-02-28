
PFont font;
float x= 0.0;


void setup(){
  size(250,250);
  font=loadFont("PoplarStd-180.vlw");
  textFont(font);
  smooth();
  fill(62,59,47);
}

void draw(){
  background(198,183,154);
         font=loadFont("PrestigeEliteStd-Bd-13.vlw");
 textFont(font);
 smooth();

  text("L1C5K5 L1C5K5",x,126);
  //small moving texts

    font=loadFont("PoplarStd-180.vlw");
    textFont(font);
  text("L1C", 0, 114);
  text("5K5",0, 264);
  //big texts

  
  frameRate(4);
  x+=13.0;
  if(x>width){
    x=-100;
    
  }
}

