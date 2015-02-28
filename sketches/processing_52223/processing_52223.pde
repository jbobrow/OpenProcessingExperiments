
int movx;
int cambio;
int movy;

void setup() {
size (800,600);
smooth();
noStroke();
movx=0;
cambio=0;
movy=0;
 }
 

void draw(){
 background(255);

   ellipse (movx+50,movy+50,50,50);
   fill (255,0,0);
if (cambio==0){
  movx=movx+1;
  fill (100,0,200);
 }
if (movx>700){
cambio=1;


}
if (cambio==1){
  movy=movy+1;
  fill (255,0,0);
 
 
}
if(movy>500){
  cambio=2;
}
if (cambio==2){
  movx=movx-1;
  fill (0,255,255);

}

if (movx==0){
  cambio=3;
}
if (cambio==3){
  movy=movy-1;
  fill (0,255,0);

}
if (movy==0){
  cambio=0;

}
}

