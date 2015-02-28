
//CDragon Curve by Ivan Burghart 
//licensed under Creative Commons Attribution-Share Alike 3.0 license
//A recursive C-Curve/Dragon Curve generator. 
//It transforms from one curve to the other by adjusting the 
//left and right angles.
//It can also fold in on itself.
PFont font;
float YRotate, XRotate;
float StartBase=100;
float Base=StartBase;
float FoldAngle=radians(0);
float LAngle=radians(45);
float RAngle=radians(-45);
int MaxIter=12;

ScrollBar LAngleBar, RAngleBar, ZoomBar;
ScrollBar YRotateBar, XRotateBar, FoldBar;

void setup() {
  size(550,550, P3D);
  smooth(); 
  strokeWeight(1);
  stroke(0, 100);
  font = loadFont("ComicSansMS-32.vlw"); 
  textFont(font); 
 

  LAngleBar= new ScrollBar(5,30,300,15,true, 0);
  RAngleBar= new ScrollBar(width-20,30,300,15,true,0);
  ZoomBar= new ScrollBar(30,height-20,300,15,false,0);
  FoldBar= new ScrollBar(width/2-150,5,300,15,false,0);
  
  int BoxX=width-170;
  int BoxY=height-120;
  int BoxSize=110;// A horizontal and a vertical square Scroll bar on top of each other
  XRotateBar=new ScrollBar(BoxX,BoxY,BoxSize,BoxSize,true,.5);
  YRotateBar=new ScrollBar(BoxX,BoxY,BoxSize,BoxSize,false,.4);  
  XRotateBar.setAlpha(80);
  YRotateBar.setAlpha(80);
  XRotateBar.setEasing(4);
  YRotateBar.setEasing(4);
}
void draw(){
  background(0);

  HandleInterface();
  colorMode(HSB,256);
  pushMatrix(); 
    translate(width/2,height/2);     
    rotateY(YRotate); ////////////////////////////////////////////////////////
    rotateX(XRotate);
    CDragon(Base,LAngle,LAngle,RAngle,FoldAngle,MaxIter);////////////////////////////////////////
  popMatrix();

  pushMatrix();
    translate(100,height-100);
    rotateY(YRotate);
    rotateX(XRotate);
    CDragon(50,LAngle,LAngle,RAngle,FoldAngle,4);////////////////////////////////////////
  popMatrix();
  
//  pushMatrix();
//    translate(width-100,height-100);
//    rotateY(YRotate);
//    rotateX(XRotate);
//    //rotateX(PI/2);
//    CDragon(50,LAngle,LAngle,RAngle,FoldAngle,7);////////////////////////////////////////
//  popMatrix();
}




void CDragon(float Base,float Angle,float LAngle,float RAngle,float Fold,int i)
{
  fill(10*i,230,250,70);
 
  float Dist=-tan(Angle)*Base;
  float NewBase=Base/(2*cos(Angle));
  
  if(i>0) {
    if (i<2){fill(120,255,255,170);}////////////////////////////////////
    rotateX(Fold);   
    triangle(-Base,0, Base,0, 0,Dist);

    pushMatrix();
      translate(-Base/2,Dist/2);
      
      rotateZ(-Angle);
      rotateX(Fold);
      CDragon(NewBase,LAngle,LAngle,RAngle,Fold,i-1);
    popMatrix();  

    pushMatrix();
      translate(Base/2,Dist/2);
      rotateZ(Angle);
      rotateX(Fold);
      CDragon(NewBase,RAngle,LAngle,RAngle,Fold,i-1);
    popMatrix();  
  }
}

void HandleInterface(){

  
  LAngleBar.update();
  LAngleBar.display();
  RAngleBar.update();
  RAngleBar.display();
  
  XRotateBar.update();
  XRotateBar.display();
  YRotateBar.update();
  YRotateBar.display();  
  ZoomBar.update();
  ZoomBar.display();
  FoldBar.update();
  FoldBar.display();
  
  Base=StartBase+150*ZoomBar.getValue();
  FoldAngle=PI*FoldBar.getValue();//TWO_PI*(FoldBar.getValue()-.5);
  YRotate=1.5*PI*(YRotateBar.getValue()-.5);
  XRotate=-1.5*PI*(XRotateBar.getValue()-.5);
  LAngle=-HALF_PI*(LAngleBar.getValue()-.5);
  RAngle=-HALF_PI*(RAngleBar.getValue()-.5); 

  fill(200,0,0,150);
  text("Zoom", 90,height-5);
  text("Fold Angle", width/2-80, 30);
  text("Rotate",width-110, height-5 );
  pushMatrix();
    rotateZ(-HALF_PI);
    text("Left Angle",-height/2,30);
  popMatrix();
  pushMatrix();
    rotateZ(HALF_PI);
    text("Right Angle",height/2-170,-width+30);
  popMatrix();
}



