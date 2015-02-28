
PImage cherubArrow;
PImage clouds;
PImage cherubHug;
PImage zeppelin;
PImage ptero;
PImage bat;
PImage city;
PImage dandelion;
PFont oldEnglish;
PImage octo;
PImage moon;

float leadX;
float leadY;

boolean reDraw=true;


float hue1;
float saturation1;
float brightness1;

void drawAttacker(PImage attacker,float x,float y,float aSize,int recursionsHad,int maxRecursions){
  if(recursionsHad<maxRecursions){
    recursionsHad++;
  image(attacker,x,y,aSize,aSize);
 pushMatrix();
 rotate(random(0,2*PI));
  drawAttacker(attacker,x+aSize,y+aSize,aSize*.7,recursionsHad,maxRecursions);
  drawAttacker(attacker,x+aSize,y-aSize,aSize*.7,recursionsHad,maxRecursions);
 popMatrix();
}
}



  


void setup(){
 size(640,480 );
 smooth();
 cherubArrow=loadImage("cherubArrow.png");
 clouds=loadImage("clouds.jpg");
 cherubHug=loadImage("cherubHug.png");
 oldEnglish=loadFont("OldEnglishTextMT-60.vlw");
 zeppelin=loadImage("zeppelin.png");
 ptero=loadImage("ptero.png");
 bat=loadImage("bat.png");
 city=loadImage("city.png");
 dandelion=loadImage("dandelion.png");
 octo=loadImage("octo.png");
 moon=loadImage("moon.jpg");
 textFont(oldEnglish);
 colorMode(HSB,1);


}
void addText(){
  String captions[]={"Perhaps...","They came from above","No one saw it coming","So it goes","Up! in the SKY!"};
  int x=int(random(0,width/2));
  int y=int(random(0,height*2/3));
  fill(hue1,saturation1+.07,brightness1);
  textSize(random(30,70));
  text(captions[int(random(0,captions.length))],x,y,width-x,height-y);
}


void draw(){
 if(reDraw){
 reDraw=false;
 
 
 hue1=random(0,.3);
 saturation1=random(0,.25);
 brightness1=1;
   
 tint(hue1,saturation1,brightness1);  
 background(0); 
  PImage settings[]={clouds,city,moon};
  //tint(1,0,1);
 PImage setting=settings[int(random(0,settings.length))];
 image(setting,0,0,width,height);
 

 PImage attackers[]={zeppelin,cherubArrow,ptero,bat,dandelion,octo};
 PImage attacker=attackers[int(random(0,attackers.length))];
  
 leadX=random(20,width-100);
 leadY=random(0,height-100);
 float leadSize=random(100,275);
 drawAttacker(attacker,leadX,leadY,leadSize,1,6);
 
 addText();
 //text("Perhaps...",100,30);
 
 }
}


void mousePressed(){
 reDraw=true; 
}



