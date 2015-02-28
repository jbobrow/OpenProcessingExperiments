
String z = "shout";
float x;
float y;
float wt;
float ht;
float r;
float t;

void setup(){
  size(500, 500);
  PFont font = loadFont("TradeGothic.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  smooth();
  wt=textWidth(z)/2;
  ht=(textAscent()+textDescent())/2;
  noStroke();
  x= width/2;
  y=height/2;
  
}


void draw(){
  r=random(4,200);
  t=random(0,150);
  fill(0,20);
  rect(0, 0, width, height);
  fill(255,255,0);
  if (abs(mouseX - x) < wt && abs(mouseY - y) < ht) {
    fill(255,255,t);
    textSize(r);
    text("SHOUT",x, y);
    
    
    
    
    
  }
  
  else {
    textSize(24);
  }
text("SHOUT",x, y);
}

