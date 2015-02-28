
void setup(){
  size(800,200,P2D);
  float x=sqrt(sqrt(sqrt(sqrt(PI))))+PI*(sqrt(sqrt(sqrt(PI)))+PI*(PI+PI+PI+PI*(PI*(PI+PI*(PI+PI+PI*(PI+PI*(PI*(PI*(PI+PI+PI*(PI*(PI*(PI+PI))))))))))));
  if(
      ((year()==2010) && (month()>=4))
    ||
      (year()>2010)
  ){
    x=ceil(x);
  }else{
    x=floor(x);
  }
  background(255);
  noStroke();
  noSmooth();
  fill(0);
  textFont(createFont("",100,true));
  textAlign(CENTER,CENTER);
  text(int(x),width/2,height/2);
}
void draw(){}

