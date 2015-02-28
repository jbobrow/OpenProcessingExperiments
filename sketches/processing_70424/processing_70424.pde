
int M;
int i;
int r;
int e;
int y;
int a; 
int randXM;
int randYM;
int randXi;
int randYi;
int randXr;
int randYr;
int randXe;
int randYe;
int randXy;
int randYy;
int randXa;
int randYa;

int letraOxfinal;
 
PFont font;
 
void setup(){
  size(800,300);
  smooth();
  background(255,0,0);
  font=loadFont("EnthuseSolidBRK-48.vlw");
M=0;
i=0;
r=0;
e=0;
y=0;
a=0;  
}
 
void draw(){
background(255,0,0);
  textFont(font,250);
  fill(0);
    
  float randXM= int(random(10,800));
 float randYM= int(random(10,300));
   float randXi= int(random(10,800));
 float randYi= int(random(10,300));
   float randXr= int(random(10,800));
 float randYr= int(random(10,300));
   float randXe= int(random(10,800));
 float randYe= int(random(10,300));
   float randXy= int(random(10,800));
 float randYy= int(random(10,300));
    float randXa= int(random(10,800));
 float randYa= int(random(10,300));
   
 
//Mireya
if ((randXM!=200) && (randYM!=255) && M!=1){
   text("M", randXM,randYM);
}
else{
   text("M", 100,200);
  M=1; 
 }
   
   
//mIreya
if ((randXi!=380) && (randYi!=250) && i!=1){
   text("i", randXi,randYi);
}
else{
   text("i", 250,180);
  i=1; 
 }
  
//miReya
if ((randXr!=200) && (randYr!=180) && r!=1){
   text("r", randXr,randYr);
}
else{
   text("r", 300,200);
  r=1; 
 }
  
// mirEya
if ((randXy!=250) && (randYy!=180) && y!=1){
   text("y", randXy,randYy);
}
else{
   text("y", 500,200);
  y=1; 
 }
  
// mireYa
if ((randXe!=265) && (randYe!=180) && e!=1){
   text("e", randXe,randYe);
}
else{
   text("e", 400,180);
  e=1; 
 }
 // mireyA
if ((randXa!=265) && (randYa!=180) && a!=1){
   text("a", randXa,randYa);
}
else{
   text("a", 600,280);
  a=1; 
 }
  
}


