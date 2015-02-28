
void setup(){
  size(600,600);
// background(0);
  smooth();
  stroke(0);
 frameRate(999999999);
  ellipseMode(CENTER);

  }

float x=60;
float y=60;
float x1=540;
float y1=540;

 int num=0;//限定碰撞次数


 
void draw(){
  
if (num<1){

fill(0,10);
rect(0,0,width,height);

float d = 15;//限定边界所用，值为圈圈半径
float D=dist(x,y,x1,y1);
float v=15; //撞一起弹开的值
float s=8;//圆圈在-s与s之间随机走动

float xs=random(-s,s);
float x1s=random(-s,s);
float ys=random(-s,s);
float y1s=random(-s,s);

  fill(255);
ellipse(x,y,60,60);
 fill(255);
ellipse(x1,y1,60,60);


 

 
   
   x=x+xs;
   y=y+ys;
   x1=x1+x1s;
   y1=y1+y1s;
   

   
  if(x<=30){ //定义x圈的左边边界
       x=x+15;
  }else if(x1<=30){ //定义x1圈的左边边界
          x1=x1+d;
  }else if(x>=width-30){ 
             x=x-d;
  }else if( x1>=width-30){
                x1=x1-d;
  }else if(y<=30){
                   y=y+d;
  }else if(y1<=30){
                       y1=y1+d;
  }else if(y>=height-30){
                           y=y-d;
  }else if(y1>=height-30){
                             y1=y1-d;
 
  }else if(D<60 && x<x1 && y>y1){ //如果撞在一起则弹开
     fill(255,0,0);
     ellipse(x,y,60,60);
   ellipse(x1,y1,60,60);
        x=x-v;
        y=y+v;
        x1=x1+v;
        y1=y1-v;
        num=num+1;
}else if(D<60 && x<x1 && y<y1){
   fill(255,0,0);
   ellipse(x,y,60,60);
   ellipse(x1,y1,60,60);
         x=x-v;
         y=y-v;
         x1=x1+v;
         y1=y1+v;
          num=num+1;
}else if(D<60 && x>x1 && y<y1){
   fill(255,0,0);
   ellipse(x,y,60,60);
   ellipse(x1,y1,60,60);
         x=x+v;
         y=y-v;
         x1=x1-v;
         y1=y1+v;
          num=num+1;
}else if(D<60 && x>x1 && y>y1){
       fill(255,0,0);
       ellipse(x,y,60,60);
   ellipse(x1,y1,60,60);
         x=x+v;
         x1=x1-v;
         y=y+v;
         y1=y1-v;
          num=num+1;

 
}else{
  fill(255);
ellipse(x,y,60,60);
 fill(255);
ellipse(x1,y1,60,60);
}



//pushMatrix();
// PFont architect;
//  PFont dream;
// architect = loadFont("MicrosoftYaHei-48.vlw");
// dream = loadFont("MicrosoftYaHei-48.vlw");
// textFont(architect,10);
// textFont(dream,10);
//  String ARCHITECT="建筑师";
//  String DREAM="理想";
// fill(200,0,0);
 // text(ARCHITECT,x-15,y);
//  text(DREAM,x1-15,y1);
 //  popMatrix();
   }
   if(num==1){
     fill(255,0,0);
     ellipse((x+x1)/2,(y+y1)/2,120,120);
     
     fill(255);
     PFont oye;
     oye = loadFont("MicrosoftYaHei-48.vlw");
     textFont(oye,40);
     String yes = "哦也！";
     text(yes,(x+x1)/2-48,(y+y1)/2+18);
   }
}
