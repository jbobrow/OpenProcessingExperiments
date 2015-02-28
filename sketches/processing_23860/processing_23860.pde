
PImage bg;
int a; 
import processing.pdf.*;
boolean savePDF = false;

class goccia{
float vy;
float ay;
float px, py;
float kx;
float oldx,oldy;
float w,h;
float d,dx;
float ky = random (0,10);
float kBounce,kkx,kSw;
 
void update(){
 
 vy+=ay;
  py+=vy;
 

 if(py > height+350){
       vy = -(vy/(100*kBounce));
    kx = random (-5,5);
   }
  
  if(vy < 1){
 
       kx = random (0,1);
   }
}
void render(){
  
   stroke (150);
   strokeWeight(0.002+kSw); 
   line (px-kkx-kx,py,px+kkx+kx,py);
}
 
void init (){
 oldy = py = 0;
 oldx = px = random (0,width);
 ay = random (0.9,1.5);
 kx=0;
   }
}
 
int nPioggia = 100;
int frame;
int kkx,kSw;
goccia[] pioggia = new goccia [nPioggia];
 
  
 
 
void setup (){
  
 
 
 size (400,400);
 
 
 for (int i=0;i<nPioggia;i++){
   pioggia[i] = new goccia();
 }
 
 
 for (int i=0;i<nPioggia;i++){
   pioggia[i].init();
}
{
  bg = loadImage("image5.jpg");
  background(bg);
}
 
}
 
 
 
void draw(){
  
 
 
   if (frameCount % 1 == 0){
   frame++;
   int indice = frame % nPioggia;
   pioggia[indice].init();
   }
  
 
 

noFill();
noStroke();
rect(0,0,width*2,height*2);
for (int i=0; i<nPioggia;i++){
pioggia[i].update();
pioggia[i].render();
}
 
//interazioni
 
if (keyPressed==true){
//incrementa lunghezza linee 
    if(key=='v'){
       for (int i=0; i<nPioggia;i++){
       pioggia[i].kkx+=2;
       }
     }
    if(key=='f'){
       for (int i=0; i<nPioggia;i++){
       pioggia[i].kkx=random(-1,20);
       pioggia[i].kSw=0.01; 
       }
     }     
    if(key=='p'){
      for (int i=0; i<nPioggia;i++){
         //if ((pioggia[i].py>300) && (pioggia[i].py<303)){
          noStroke();
          fill(255);
          rect(pioggia[i].px-1,pioggia[i].py-1,2,2);
          pioggia[i].kSw=0;
        //}
      } 
    }
    if(key=='d'){
      for (int i=0; i<nPioggia;i++){
          pioggia[i].kBounce=random(1,100);
         if (pioggia[i].vy<=0){
          pioggia[i].kSw=3;
          
          }
      } 
    }   
}   
   else{
   for (int i=0; i<nPioggia;i++){
   pioggia[i].kkx=0.01;
   pioggia[i].kSw=0;
   pioggia[i].kBounce=3;
   } 
}
 
//smooth();
//saveFrame("line-####.tif");
}
 
 void keyReleased() {
   if (keyCode == BACKSPACE) {
      for (int i=0; i<nPioggia;i++){
         pioggia[i].init();
         }
    }
      
 
 }
   

