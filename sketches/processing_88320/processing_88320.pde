
class eyes {
  float slow;
  float xloc;
  float yloc;
  
  float blinkup1x;
  float blinkup1y;
  float blinkup2x;
  float blinkup2y;
  
  float blinkdown1x;
  float blinkdown1y;
  
  float blinkdown2x;
  float blinkdown2y;
 
 float blinkmovex1;
float blinkmovey1;
 
float blinkmovex2;
float blinkmovey2;

float thing;
float irisx;
float irisy;
float integerx;
float integery;
 
 float c;
 
 
boolean blinke;
boolean downed;
boolean up;
boolean whatever;

 float blinkup1x1;
  float blinkup1y1;
  float blinkup2x1;
  float blinkup2y1;
  
 
 
  eyes() {
    thing=random(2,10);
    slow=17;
  blinke=false;
downed=false;
 up=false;
 whatever=false;
       blinkup1x=-5;
   blinkup1y=-30;
   blinkup2x=25;
  blinkup2y=1;
  
   blinkup1x1=blinkup1x;
   blinkup1y1=blinkup1y;
   blinkup2x1=blinkup2x;
  blinkup2y1=blinkup2y;
  

  blinkdown1x=5;
  blinkdown1y=20;
  blinkdown2x=-17;
  blinkdown2y=15;
    
    
 blinkmovex1=blinkup1x-blinkdown2x;
 blinkmovey1=blinkup1y-blinkdown2y;
 
  blinkmovex2=blinkup2x-blinkdown1x;
 blinkmovey2=blinkup2y-blinkdown1y;
  
  }
  
  void display()  {
    fill(90);
    stroke(0,0,0);
    strokeWeight(.5);
    
    beginShape();
    vertex(xloc-30,yloc);
    bezierVertex( xloc+blinkup1x, yloc+blinkup1y, xloc+blinkup2x,yloc+blinkup2y,xloc+30, yloc);
    bezierVertex( xloc+blinkdown1x, yloc+blinkdown1y, xloc+blinkdown2x, yloc+blinkdown2y, xloc-30, yloc);
    endShape(); 
   
   
   
    integerx=mouseX-xloc;
    irisx=map(integerx,0,width,0,5);
     integery=mouseY-yloc;
    irisy=map(integery,0,height,0,5);
    fill(#B6B6C4);
     ellipse(xloc+irisx,yloc+irisy,10,10);
    
    
   
    noStroke();
    fill(0);
     beginShape();    
    vertex(xloc-30,yloc);
    bezierVertex( xloc+blinkup1x, yloc+blinkup1y, xloc+blinkup2x,yloc+blinkup2y,xloc+30, yloc);
    bezierVertex( xloc+blinkup2x1, yloc+blinkup2y1, xloc+blinkup1x1, yloc+blinkup1y1, xloc-30, yloc);
    endShape(); 
   

  }
  
  
  
  
  
  
  
  
  
  void go(float thingx, float thingy) {
    xloc=thingx;
    yloc=thingy;
   
   
  }
  
  
  void blink() {
    if(whatever==false && blinke==false && up==false){
      c=c+1;
    }
    
    if(c/60==floor(thing)) {
      whatever=true;
    }
    
    if( whatever==true) {
      blinke = true;
      whatever=false;
      thing=random(3,10);
      c=0;
    }
    
    if(blinke==true) {
      blinkup2x1=blinkup2x1-blinkmovex2/slow;
     blinkup2y1=blinkup2y1-blinkmovey2/slow;
     blinkup1x1=blinkup1x1-blinkmovex1/slow;
     blinkup1y1=blinkup1y1-blinkmovey1/slow;
    }
    
    
   
    
    if(blinkup2y1>=blinkdown1y &&
     blinkup1y1>=blinkdown2y
     ) {
    blinke=false;
       up=true;
     }
     
    
     
   if(up==true) {
            blinkup2x1=blinkup2x1+blinkmovex2/slow;
     blinkup2y1=blinkup2y1+blinkmovey2/slow;
     blinkup1x1=blinkup1x1+blinkmovex1/slow;
     blinkup1y1=blinkup1y1+blinkmovey1/slow;
     
     
     if(blinkup2y1<=blinkup2y ||
     blinkup1y1<=blinkup1y) {
       up=false;
     }
   }
     
     
      
      
      
    
  }
    
}

