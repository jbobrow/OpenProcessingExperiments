
int x=5;
float b= 80;
PFont myfont;
PFont fan;
PFont extra;
 
void setup(){
  size(600,600);
  background(39,85,70);
  myfont = loadFont("aaaiight!-20.vlw");
  fan = loadFont("AdobeMingStd-Light-25.vlw");
  extra = loadFont("BudmoJiggler-15.vlw");
}

void draw(){
  
}

void mouseDragged(){
  fill(19,54,43,70);
  textSize(random(12,36));
  textFont(fan);
  text("FanCHEEZical",mouseX,mouseY);
  b = b-10;
  
}

void mousePressed(){
  fill(112,173,142,80);
  textSize(10);
  textFont(extra);
  text("It's Extraordinary",mouseX,mouseY);
}


void keyPressed(){
  fill(154,234,195,50);
  textSize(10);
  textFont(myfont);
  text("Brick Swag",random(150,450),random(150,450));
}





