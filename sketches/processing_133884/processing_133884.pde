
import ddf.minim.*;
AudioSnippet monson;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;

float bx,by;

float vx=3,vy=2;

int ancien_x=0,ancien_y=0;

int attend=1;

int couleur;


void setup () {
minim = new Minim(this);
monson = minim.loadSnippet("monson.mp3");

  
  size (700,600);
  background (0);
  couleur = color(random(50,200),0,random(50,185));
   bx=random(width);
 by=random(height);
 vx=random(6)+1;
 vy=random(6)+1;
   
}


void draw () {
  
 bx=bx + vx;
 by=by + vy;
 

 
  if(bx>width-40 || bx<0){ 
   vx=-vx;
   couleur= color(random(50,200),0,random(0,185)); 
    monson.play();    
   }
  
   if(by>height-40 || by<0){ 
     vy=-vy;
   couleur= color(random(50,200),0,random(0,185)); 
    monson.play();
 }
 
  if(abs(mouseX-bx)<15 && abs(mouseY-by)<15){
   if(attend==0){
     vx=(ancien_x-mouseX)+0.5;
     vy=(ancien_y-mouseY)+0.5;
     vy=-vy;
     vx=-vx;
     attend=0;
   } 
 } 
 else {
   attend=0;
 }
 
  ancien_x=mouseX;
 ancien_y=mouseY;


  fill (couleur);
  stroke (20);
   ellipse(bx+20,by+20,40,40);

   
}


void stop() {
  monson.close();
minim.stop();
super.stop();

}
