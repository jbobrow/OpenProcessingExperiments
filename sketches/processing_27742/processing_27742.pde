
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

boolean start = true;
color from = color(255,0,0);
color to = color(0);
float lerpChangeA=0;
float rateOfChange=0.01;

int count=0;
color lerpa;
color from2 = color(0);
color to2 = color(255);
float lerpChangeB=0;
color lerpb;
boolean lerpTrue=true;

Minim minim;
AudioPlayer river;

void setup(){


  size(500,500);
  smooth();
  background(0);



 lerpa= lerpColor(from, to, lerpChangeA);
  lerpb= lerpColor(from2, to2, lerpChangeB);
  
  minim = new Minim(this);
  river = minim.loadFile("river.wav");
  


}

void draw(){
   lerpChangeA= lerpChangeA+rateOfChange;
  lerpa= lerpColor(from, to, lerpChangeA);
  if (lerpChangeA>1){lerpChangeA=0;lerpTrue=false;}
  
    if  (mousePressed){
    
   
    
  }else{river.pause();}
}

  

  
void mouseReleased(){
  
  count=count+1;
    if(count==6){
    river.rewind();
    count = 0;
    }
  }

void mouseDragged(){
  
 river.setGain(-20); 
 

   if  (mouseButton == LEFT)
   { noStroke();
   
    fill(255,7,7,200);
    ellipse(mouseX,mouseY,30,30);
    
river.play();
   noStroke();
fill(0,5);
rect(0,0,width,height); 
 noStroke();
    fill(255,7,7,200);
    
    ellipse(mouseX,mouseY,30,30);
}

if (mouseButton == RIGHT)
 
   {noStroke();
   fill(0,30);
   ellipse(mouseX,mouseY,200,200);
   cursor(CROSS);}

 
}





