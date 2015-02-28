
int colorCounter = 50;
boolean mouseOnRight = false;
PFont myFontGeneva;
PFont myFontJCfg;
boolean font = false;

void setup(){
  size(500,500);
  background(250,108,25);
  noStroke();
  myFontGeneva = loadFont("Geneva-160.vlw");
  myFontJCfg = loadFont("JCfg-160.vlw");
}

void draw(){
  fill(250 - colorCounter, 25 - colorCounter, 112);
  rect(0,0,500,500);
  
  if (font == false);{
  fill(255,255,112);
  textFont(myFontGeneva);
  text("yellow", 10, 300);
  }
  
  if (font == false);{
  fill(250,25,112);
  textFont(myFontJCfg);
  text("pink", 100, 200);
  }
  
  if (mouseY >= width/2 && mouseOnRight == false){
    mouseOnRight = true;
    colorCounter -=250;
  }
  if(mouseY < width/2 && mouseOnRight == true){
    mouseOnRight = false;
    colorCounter +=250;
  }
}

