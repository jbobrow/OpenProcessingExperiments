
PFont myFont;  //for font
String[] message = {"apple","love","sign","some","send",
                    "address","school","shop","Tokyo","action",
                    "time","green","Google","travel","phone",
                    "you","yuto","hello","home","cell",
                    "top","user","next","class","fan",
                    "beside","from","side","egoist","oppsite"};
int SIZE=400;

void setup(){
  size(SIZE,SIZE);
  colorMode(RGB,255);
  noStroke();
  background(255,255,255);  //background color is white
  frameRate(30);
  myFont = loadFont("BuxtonSketch-48.vlw");  //deside font
}

void draw(){
  fill(255,255,255,50);  //transparent white
  rect(0,0,width,height);
  fill(0);  //stroke color is black
  textFont(myFont,random(100));  //font is myFont and size is 0-100
  int i = (int)random(30);
  text(message[i],random(width-150),random(height));
}
