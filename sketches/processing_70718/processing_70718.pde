
int F;
int E;
int R;

int XF1;
int YF2;
int XE1;
int YE2;
int XR1;
int YR2;

 
int letraOxfinal;
  
PFont font;
  
void setup(){
  size(500,500);
  smooth();
  background(0);
  font=loadFont("AintNothingFancy-48.vlw");
  
F=0;
E=0;
R=0;

}
  
void draw(){
background(0);
  textFont(font,200);
  fill(255);
     
  float XF1= int(random(20,500));
 float YF2= int(random(20,400));
   float XE1= int(random(20,500));
 float YE1= int(random(20,500));
   float XR1= int(random(20,500));
 float XR2= int(random(20,400));

    
  
//F
if ((XF1!=150) && (YF2!=500) && F!=1){
   text("F", XF1,YF2);
}
else{
   text("F", 100,200);
  F=1;
 }
    
    
//E
if ((XE1!=250) && (YE2!=250) && E!=1){
   text("E", XE1,YE2);
}
else{
   text("E", 250,180);
  E=1;
 }
 
 //R
 

if ((XR1!=100) && (YR2!=500) && R!=1){
   text("R", XR1,YR2);
}
else{
   text("R", 380,180);
  R=1;
 }
 

}
