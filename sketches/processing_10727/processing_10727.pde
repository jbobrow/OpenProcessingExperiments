
//Taiji mousePressed
//bigR (10-100)


float savedTime = 0;
float totalTime = 0;
float isMousePress = 0;
float isStart = 0;//动画是否开始
float isFinish = 1;
 
float changeR = 0;
float bigR = 0;
float smallR = 0;
 //旋转中心的x,y坐标。
 int centerX ;
 int centerY;
 TaiJi tj ;
ArrayList taijis ;

float ball_x;
float ball_y;
float ball_r;

  void setup() {
 taijis = new ArrayList() ;
  background(130);
  size(400,400);
  frameRate(30);
  smooth();
 tj = new TaiJi( width/2,height/2,1);

}

void draw() {
    //background(130);
  if( 	mousePressed)
  {
       savedTime ++;
       if(savedTime>50)
       {
         savedTime = 50;
       }
       
       
//     print(" savedTime is "+ savedTime);
  }
 
for(int i = taijis.size()-1; i >=0  ; i=i-1)
{
      TaiJi t = ( TaiJi)taijis.get(i);
       t.go();
       if(t.isfinish==1)
       {
     //    print("isFinish"+isFinish);
       taijis.remove(i);
      }
 
  }
}
  


void mouseReleased(){
// print("mouse ireleased");
     centerX = mouseX;
     centerY = mouseY;
     totalTime =  savedTime;
    // isMousePress = 0;
     savedTime = 0;
    // isStart = 1;
     TaiJi t  = new  TaiJi(centerX,centerY,totalTime);
     taijis.add( t);
 

}



