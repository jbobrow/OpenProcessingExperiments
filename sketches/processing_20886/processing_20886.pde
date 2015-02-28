
int rad;
PFont xFont;

int secXPos;
int secX=1;
int secHolder=2;
int secNumberOfRebounds=1;

int minXPos;
int minX=1;
int minHolder=2;
int minNumberOfRebounds=1;

float hourXPos;
int hourX=1;
int hourHolder=2;
int hourNumberOfRebounds=1;



void setup(){
 size(600,600);
 background(255);
 smooth();
 frameRate(15);
 
 rad= 40;
 xFont=loadFont("ArialMT-24.vlw");
 
 secXPos= 0;
 minXPos=0;
 hourXPos=0;
 
  
  
}


void draw(){
  
  fill(255,40);
  noStroke();
  textFont(xFont);
  
  rect(0,0,width,height);
  
      
      stroke(0);
      ellipse(secXPos,height/2-100,rad,rad);
      fill(0);
      text(secNumberOfRebounds,secXPos-6,(height/2)-90);  
        if(secXPos>600&&secHolder>1){
          secX=2;
          secHolder=1;
           if (secNumberOfRebounds<59){
           secNumberOfRebounds=secNumberOfRebounds+1;
           }else{
           secNumberOfRebounds=1;
           }
        }
        if (secXPos<0&&secHolder<2){
           secX=1;
           secHolder=2; 
           if (secNumberOfRebounds<59){
           secNumberOfRebounds=secNumberOfRebounds+1;
           }else{
           secNumberOfRebounds=1;
           }
        }
        if(secX<2){
          secXPos=secXPos+67;
        }else {
          secXPos=secXPos-67;
        }
        
  
      fill(255,40);
      stroke(0);
      ellipse(minXPos,height/2,rad,rad);
      fill(0);
      text(minNumberOfRebounds,minXPos-6,(height/2)+10);  
        if(minXPos>600&&minHolder>1){
          minX=2;
          minHolder=1;
          minNumberOfRebounds=minNumberOfRebounds+1;
        }
        if (minXPos<0&&minHolder<2){
           minX=1;
           minHolder=2; 
           minNumberOfRebounds=minNumberOfRebounds+1;
        }
        if(minX<2){
          minXPos++;
        }else {
          minXPos--;
        }
        
        
      fill(255,40);
      stroke(0);
      ellipse(hourXPos,height/2+100,rad,rad);
      fill(0);
      text(hourNumberOfRebounds,hourXPos-6,(height/2)+110);  
        if(hourXPos>600&&hourHolder>1){
          hourX=2;
          hourHolder=1;
          hourNumberOfRebounds=hourNumberOfRebounds+1;
        }
        if (hourXPos<0&&hourHolder<2){
           hourX=1;
           hourHolder=2; 
           hourNumberOfRebounds=hourNumberOfRebounds+1;
        }
        if(hourX<2){
          hourXPos=hourXPos+0.166666666666666666666666666666;
        }else {
          hourXPos--;
        }
  
  
  
  
  
  println(secXPos);
  println(minXPos);
  println(secHolder);

}

