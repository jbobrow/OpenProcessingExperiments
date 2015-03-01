
float count=0;
float count2=0;
float blockX= 50;
float blockY = 250;
float blockSize = 30;
float bX;
float bY;
float blockR;
float blockU;
int x=0;
int y=0;
float blockspeed =10;
color bvalue = color(#171CFA);
PImage fail; 
PImage sticker;
PFont myFont;

String z="Use arrow keys to move the block into the rectangular hole";
String i2="Wait until the 'holes' appear";
String z2="Remember you have limited amout of time!";
color cvalue =color(0);

float qX;
float qY;
float qx=150;
float qy=100;
float qs=25;



//float qh=25;
void setup(){
  size(500,500);
 //rectMode(CENTER);
  colorMode(HSB);
  myFont = createFont("ChaparralPro-Bold",32);

  fail =loadImage("fail.jpg");
  sticker =loadImage("sticker.png");
  imageMode(CENTER);
  smooth();
  noStroke();
  
}

void draw(){
  //background//
 fill(255);
  rect(0,0,width,height);
  //background
  if(count2>=0){
  count2+=.00050;
for (int i=0; i<=width; i+=30){
  for(int j=0; j<=height; j+=30){
    fill(random(i),random(j),random(88,255));
    rect(i,j,30,30);}}
  }
  
  
  //instruction//
textFont(myFont);
  fill(0);
  textAlign(CENTER);
  textSize(19);
  textLeading(10);
  text(i2,3,5,500,40);
  textSize(19);
  text(z2,3,20,500,40);
  
  fill(0);
  textAlign(LEFT);
  textSize(18);
  textLeading(10);
  text(z,3,460,500,40);
  
//obstacles//

obstaX=random(0,width);
obstaY=random(0,height);


rect(obstaX,obstaY,blockSize,blockSize);



  //moving block//
   blockR=x*blockspeed;
   blockU=y*blockspeed;
   bX=blockX+blockR;
   bY=blockY+blockU;
   fill(bvalue);
  rect(bX,bY,blockSize,blockSize);
  
  
  
  //holes
   count+=0.030;
   if(count>=0){
   if(count>4.0){
     r=0;
     qX=qx+r;
     qY=qy+r;
     fill(cvalue);
     rect(qX,qY,blockSize,blockSize);

   } 
     
    if(count>11.0 ){
     r=300;
     qX=qx+r/6;
     qY=qy+r;
     fill(cvalue);
     rect(qX,qY,blockSize,blockSize);}
   
    if (count>22.0){
     r=150;
     qX=qx+r;
     qY=qy-r/3;
     fill(cvalue);
     rect(qX,qY,blockSize,blockSize);
   }
   /* exceeding the max time period of the game
    if (count>28){
     r=250;
     qX=qx+r;
     qY=qy+r/5;
     fill(cvalue);
     rect(qX,qY,blockSize,blockSize);
   }
   */
   }
   if(bX!=qX && bY!=qY &&count>=10 &&count<11){
     
     image (fail, width/2,height/2);
     
   }
   if(bX!=qX && bY!=qY &&count>=21 &&count<22){
     
     image (fail, width/2,height/2);
     
   }
   /*
   if(bX!=qX && bY!=qY &&count>=27 &&count<28){
     
     image (fail, width/2,height/2);
     
   }
   */
   if(bX==qX && bY ==qY && count>=28){
     image (sticker, width/2, height/2);} 
     
   
   //color change
   if(bX==qX && bY==qY &&count<11.0){
     stroke(0);
     strokeWeight(5);
   cvalue=255;
   bvalue=(#EE17FA);}  
   else if(bX==qX && bY==qY&& count>11){
     stroke(0);
     strokeWeight(5);
   cvalue=255;
     bvalue =(#17FAB7);}
   else if (bX==qX && bY==qY&& count>20.0 ){
     stroke(0);
     strokeWeight(5);
   cvalue=255;; bvalue=(#171CFA);}
 
   else {cvalue=0;noStroke(); }
  
  
//obstacles//

/*
fill(random(355),random(100),random(100));
obstaX=random(0,width);
obstaY=random(0,height);
rect(obstaY,obstaX,blockSize,blockSize);
rect(obstaX,obstaY,blockSize,blockSize);
rect(obstaX,obstaY,blockSize,blockSize);
*/

//



}

void keyPressed(){
if(key == CODED){
    if(keyCode == RIGHT){
      
      x+=1;} 
      if(keyCode ==UP){
       y-=1;}
       if(keyCode==DOWN){
         y+=1;}
         if(keyCode==LEFT){
           x-=1;}
       
        
}
}



