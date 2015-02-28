
int J=0;
int A=0;
int Y=0;
int P=0;
int XJ;
int YJ;
int XA;
int YA;
int XY;
int YY;
int XP;
int YP;
 
PFont font;
  
void setup(){
  size(700,300);
  smooth();
  font=loadFont("CenturyGothic-48.vlw");
}
  
void draw(){
background(0);
  textFont(font,150);
  fill(100);  
  float XJ= int(random(10,800));
  float YJ= int(random(10,300));
  float XA= int(random(10,800));
  float YA= int(random(10,300));
  float XY= int(random(10,800));
  float YY= int(random(10,300));
  float XP= int(random(10,800));
  float YP= int(random(10,300));

//-----------------------------------

if ((XJ!=200) && (YJ!=255) && J!=1){
   text("J", XJ,YJ);
 }
else{
   text("J", 100,200);
  J=1;
 }
    
//------------------------------------

if ((XA!=380) && (YA!=250) && A!=1){
   text("A", XA,YA);
 }
else{
   text("A", 200,200);
  A=1;
 }
   
//------------------------------------

if ((XY!=200) && (YY!=180) && Y!=1){
   text("Y", XY,YY);
 }
else{
   text("Y", 300,200);
  Y=1;
 }
   
//-------------------------------------

if ((XP!=250) && (YP!=180) && P!=1){
   text("P", XP,YP);
 }
else{
   text("P", 500,200);
  P=1;
 } 
}

