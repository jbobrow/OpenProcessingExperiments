


void setup(){
  PFont font = loadFont("Dialog.bold-48.vlw");
  size(512,384);
  background(0);
  smooth();
  textFont(font);
  frameRate(30);
}

//String h m s;

int s = second(); //ワーク秒

void draw(){
  if(s != second()){
   fill(random(50,255));
   //x が0のとき背景リセット
   if(s%10==0){
     background(random(0,50),random(0,50),random(0,50));
   }
  text(
  String.valueOf(hour())+":"+
  String.valueOf(minute())+":"+
  String.valueOf(second())
  ,20,40 + (height/10) * (s%10) );
  }
  s = second(); 
}

