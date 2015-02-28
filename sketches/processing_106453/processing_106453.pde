

PImage startscreen;
PImage endscreen;
PImage f1;

PFont title;
int stage, herox, heroy, movetox, movetoy;


void setup(){
  stage=1;
  size(950, 400);
  background(#FCFAF2);
  startscreen = loadImage("floaterpool.gif");
  image(startscreen, 0, 0,950,400);
  title = createFont ("Futura", 100, true);
  herox = 500;
  heroy = 200;
  movetox = herox;
  movetoy = heroy;
 }
 void draw(){
   if(stage == 1){
     textAlign (CENTER);
     text("FLOATERS", 400,150);
     
//   text("Start",400,170);
     textSize(50);
     textFont(title);
     if(mousePressed == true){
       stage = 2;
     }
   }  
   if(stage == 2){
     endscreen = loadImage("d12.gif");
     image(endscreen, 0,0,950,400);
     fill(255,255,0);
     stroke(255,255,0);
     rectMode(CENTER);
     //  f1
     f1 = loadImage("f1.gif");
     image(f1,herox,heroy,30,30);
     herox = herox + ((movetox - herox)/(50));
     heroy = heroy + ((movetoy - heroy)/(50));
     fill(255,255,0);
     stroke(0,255,255,25);
     rect(movetox,movetoy,10,10);
   }
 }
void mousePressed(){
  if(mouseButton == LEFT){
      movetox = int(random(0,width));
      movetoy = int(random(0,height));
  }
}
    



