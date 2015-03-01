
String Name = "abcdefghijklmnopqrstuvwkyz!!!!!!!!!!!!!!!!!!!" ;
String quad = "■" ;
int charNum=0;

void setup(){
  size(800,200);
  frameRate(30);
}

void draw(){
  background(255);
  textAlign(LEFT);
  textSize(30);
  if( charNum > Name.length()){
    charNum = Name.length();
  }
  fill(0);
  text(Name.substring(0,charNum)+quad,0,height/2);
  charNum ++;
  if(mousePressed) charNum = 0;
}
