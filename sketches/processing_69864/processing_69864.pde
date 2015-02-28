
ArrayList arcs;
int hNum = 1;
int mNum = 1;
int sNum = 1;
float hSize = 15.6521739;
float mSize = 6.10169492;
float sSize = 6.10169492;
float cx;
float cy;
float hDia = 350;
float mDia = 245;
float sDia = 140;
color hColor = color(255,0,0);
color mColor = color(255,255,0);
color sColor = color(175,175,0);
float hWidth = 50;
float mWidth = 50;
float sWidth = 50;

void setup(){
  size(600,450);
  background(0);
  cx = width/2;
  cy = height/2;
  arcs = new ArrayList();
  textAlign(CENTER);
  
  // hours
  
  for(float i = 270;i<620;i+=hSize){
    float startAngle = i;
    arcs.add(new Arc(hNum,i,hSize,cx,cy,hDia,hWidth,hColor,"hour"));
    hNum++;
  }
  
  // mins
 
  for(float i = 270;i<625;i+=mSize){
    float startAngle = i;
    arcs.add(new Arc(mNum,i,mSize,cx,cy,mDia,mWidth,mColor,"minute"));
    mNum++;
  }
  
  // seconds
  
  for(float i = 270;i<625;i+=sSize){
    float startAngle = i;
    arcs.add(new Arc(sNum,i,sSize,cx,cy,sDia,sWidth,sColor,"second"));
    sNum++;
  }

}

void draw(){
  background(0);
  
  for(int i = 0;i<arcs.size();i++){
    Arc thisArc = (Arc) arcs.get(i);
    thisArc.display();
  }
  fill(255,255,0);
  text(hour() + " : " + minute() + " : " + second(),width/2,height/2);
  

}
    

class Arc{
  float num;
  float arcX;
  float arcY;
  float arcStartDeg;
  float arcStopDeg;
  float arcStartRad;
  float arcStopRad;
  float arcLen;
  float arcDia;
  float arcWidth;
  float alfa;
  color c;
  float time;
  String type;
  boolean on;
  
  Arc(int _num, float _startDeg, float _arcLen, float _x,float _y,float _dia, float _width, color _c, String _type){
    num = _num;
    arcStartDeg = _startDeg;
    arcLen = _arcLen;
    c = _c;
    arcX = _x;
    arcY = _y;
    arcDia = _dia;
    arcWidth = _width;
    arcStopDeg = arcStartDeg + arcLen-1;
    arcStartRad = radians(arcStartDeg);
    arcStopRad = radians(arcStopDeg);
    alfa = 100;
    type = _type;
  }
       
  void display(){
    noFill();
    if(type == "hour"){
      if(num > hour()){
        alfa = 100;
      }else if(num < hour()){
        alfa = 200;
      }else if(num == hour()){
        alfa = 255;
      }
    }else if(type == "minute"){
      if(num > minute()){
        alfa = 100;
      }else if(num < minute()){
        alfa = 200;
      }else if(num == minute()){
        alfa = 255;
      }
    }else if(type == "second"){
      if(num > second()){
        alfa = 100;
      }else if(num < second()){
        alfa = 200;
      }else if(num == second()){
        alfa = 255;
      }
    } 
    stroke(c,alfa);
    strokeWeight(arcWidth);
    strokeCap(SQUARE);
    arc(cx,cy,arcDia,arcDia,arcStartRad,arcStopRad);
    fill(0);
  }
    
}
