
// Day 9 Q8
int  startTime;
boolean doing  =  false; //  時間計測中は true にする
PFont font;
void  setup(){
  size(400,400);
  smooth();
  font  = loadFont("Aharoni-Bold-48.vlw");
  textFont(font,48);
  textAlign(CENTER);
  background(255);
}

void  draw(){
  if(doing){
    background(255);
    int  ms  =  millis()- startTime; //C?
    fill(0);
    text(millisToMS( ms ),width/2,height/5);
    float  theta  =  map( ms00, 0,1000, 0, 2*PI);
    stroke(0);
    fill(50);
    arc  (width/2,0.6*height, width/2,height/2,
          3*PI/2 ,  3*PI/2 + theta);
  }
}

String millisToMS(int  ms){
  int  ts  =  ms  / 1000 ;//  ミリ秒を秒に変換
  int  s  =   ts`  ; //  ts から秒の部分を求める
  int  m  =   ts/60  ; //  ts から分の部分を求める
  return  str(m)  +  "m"  +  str(s)  +  "s";    
}

void mousePressed(){
  if(doing  ==  false){
    doing  =  true ;
    startTime  =  millis() ;
  }else{
    doing  =  false;
  }
}
