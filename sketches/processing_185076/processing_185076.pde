
 //House Variables
 float houseW=random(150,260);
 float houseH=houseW*1.25;
 float houseX;
 float houseY;
 float doorH=houseH*.25;
 float doorW=houseW*.2;
 float doorX;
 float doorY;
 float doorknobX;
 float doorknobY;
 float doorknobH=doorH/6;
 float doorknobW=doorW/5;
 float porchstepH=doorH*.25;
 float porchstepW=doorW*1.25;
 float porchstepX;
 float porchstepY;
 float garageH=houseH*.6;
 float garageW=houseW*.8;
 float garageX;
 float garageY;
 float garagedoorH=garageH*.8;
 float garagedoorW=garageW*.85;
 float garagedoorX;
 float garagedoorY;
 float garagelineA1X;
 float garagelineA1Y;
 float garagelineA2X;
 float garagelineA2Y;
 float garagelineB1X;
 float garagelineB1Y;
 float garagelineB2X;
 float garagelineB2Y;
 float window1H=doorH*.6;
 float window1W=houseW/3;
 float window1X;
 float window1Y;
 float window2H=doorH/2;
 float window2W=window2H;
 float window2X;
 float windowpane1X;
 float windowpane2X;
 float windowpane1Y;
 float windowpane2Y;
 float chimneyX;
 float chimneyY;
 float chimneyH;
 float chimneyW;
 float window2Y;

//sun rotation variables
 int cx, cy;
 float secondsRadius;
 int millisoff;
 
 //Declaring classes
 
 Cloud myCloud;
 Cloud myCloud2;
 Bird myBird;


 
 //declare star class
Ball [] ballCollection = new Ball [35];
 
 Ball2 [] ballCollection2 = new Ball2 [35];
 

void setup(){
  size(800,600);
  
  //sun 
  
  int s = second();
  while(s ==second ());
  millisoff = millis();
  
  int radius = min(width, height) / 3;
  secondsRadius = radius * 1;
  
  cx = width / 2;
  cy = height / 2;
  
    //initialize stars
    
  for( int i = 0; i< ballCollection.length; i++){
ballCollection[i] = new Ball(random(0,width),random(0,300));
}

  for( int i = 0; i< ballCollection2.length; i++){
ballCollection2[i] = new Ball2(random(0,width),random(0,300));
}

  
  
//Make house bits relative

 houseX= width - houseW*2; houseY=height-houseH;
  
  doorX= houseX+houseW/4; doorY=houseY+houseH/1.5;
  
  doorknobX=doorX+doorW/5; doorknobY=doorY+doorH/2;
  
porchstepX= houseX+houseW/4-doorW*.1; porchstepY=houseY+houseH/1.5+doorH;
  
  garageX=houseX-garageW; garageY=houseY+(houseH-garageH);

 garagedoorX=garageX+garageW*.05; garagedoorY=garageY+garageW*.16;

garagelineA1X=garagedoorX; garagelineA1Y=garagedoorY+garagedoorH/4;
garagelineA2X=garagedoorX+garagedoorW; garagelineA2Y=garagelineA1Y;

garagelineB1X=garagedoorX; garagelineB1Y=garagelineA1Y;
garagelineB2X=garageX+garageW; garagelineB2Y=garagelineA1Y;


window1X=houseX+houseW/3; window1Y=houseY+houseH*.2;
window2X=houseX+houseW*.75; window2Y=houseY+houseH*.75;
windowpane1X=window1X; windowpane1Y=window1Y+window1H/2;
windowpane2X=window1X+window1W; windowpane2Y=windowpane1Y;


chimneyX=houseX+houseW; chimneyY=houseY-.25*houseH;
chimneyH=houseH*1.25; chimneyW=houseW/6;


myBird = new Bird();
  myCloud = new Cloud();
  myCloud2 = new Cloud();

} 
 
   
void draw(){

   background(0);

//make stars happen
  for( int i = 0; i< ballCollection.length; i++){
ballCollection[i].display();
  }
 
   for( int i = 0; i< ballCollection2.length; i++){
ballCollection2[i].display();
  }
 


  //background and sun

//make sky light and dark in stages

   
   if (second()<15) {
        fill(#FFA434);
  rect(0,0,800,300); 
   }
   
  if (second()>45){
      fill(#FFA434);
  rect(0,0,800,300);
   }
   
   
   
 if (second()<12.5) {
        fill(#22D394);
  rect(0,0,800,300);
     
   }
   
  if(second()>47.5){
      fill(#22D394);
  rect(0,0,800,300);

   }

   if (second()<10) {
           fill(#38F0DF);
  rect(0,0,800,300);
 
 }
  if (second()>50){
        fill(#38F0DF);
  rect(0,0,800,300);

   }
     
   if (second()<7.5){  
         fill(#5ADED1);
  rect(0,0,800,300);
 
 
   }
   if(second()>52.5){
      fill(#5ADED1);
  rect(0,0,800,300);
 
   }
   
 if (second()<5){  
       fill(#4AC2E5);
  rect(0,0,800,300);
 }
 
 if (second()>55){
      fill(#4AC2E5);
  rect(0,0,800,300);
  
 }

 if (second()<2.5 || second()>57.5){//1
      fill(#83F6FF);
  rect(0,0,800,300);
 }
 
 
 //Sun spinning
fill(255,200,50);
float s = ((second() - 15 + ((millis() - millisoff) % 1000) / 1000.0) / 60.0);
ellipse(cx + cos(s * TWO_PI) * secondsRadius, cy +sin(s* TWO_PI) *secondsRadius, 60,60);
//moon
fill(#EAEAEA);
ellipse(cx + cos(s * TWO_PI) * -secondsRadius, cy +sin(s* TWO_PI) *-secondsRadius, 60,60);

//Drawing the ground changing colors




if (second()<45){
      fill(#105F0D);
  rect(0,300,800,300);
}

if (second()>45) {
fill(#12B40B);
 rect(0,300,800,300);

}
 
 
 
if (second()>15){
      fill(#105F0D);
  rect(0,300,800,300);
}
if(second()<15)  {
fill(#12B40B);
 rect(0,300,800,300);

}
 




//drawing a tree

fill(#987637);
rect(100,250,10,200);
fill(#1C6719);
triangle(105,210,90,260,120,260);
triangle(105,250,75,290,130,290);
triangle(105,270,55,330,150,330);
triangle(105,300,40,390,180,390);

  
  //house

fill(#CBA9E3);
  rect(houseX,houseY,houseW,houseH);
//door
fill(#B4997E);
  rect(doorX,doorY,doorW,doorH);

//roof
fill(#767471);
triangle(houseX,houseY,houseX+houseW/2,height-houseH*1.25,houseX+houseW,houseY);
//porchstep
fill(#767471);
rect(porchstepX,porchstepY,porchstepW,porchstepH);
//porchroof
fill(#817E7A);
triangle(doorX-doorW*.25,doorY,doorX+doorW*1.25,doorY,doorX+doorW/2,doorY-.2*doorH);
//garage
fill(#CBA9E3);
rect(garageX,garageY,garageW,garageH);
//garage roof
fill(#817E7A);
triangle(garageX-garageW*.05,garageY,garageX+garageW,garageY,garageX+garageW,garageY-garageH*.25);
//garage door
fill(#DED5CC);
rect(garagedoorX,garagedoorY,garagedoorW,garagedoorH);
//garagelines
fill(#454829);
line(garagelineA1X,garagelineA1Y,garagelineA2X,garagelineA2Y);
line(garagelineB1X,garagelineB1Y,garagelineB2X,garagelineB2Y);
//doorknob
fill(#D6D088);
ellipse(doorknobX,doorknobY,doorknobW,doorknobH);


if (second()>24) {
  //window1
fill(#E0F222);
stroke(0);
rect(window1X,window1Y,window1W,window1H);
//window2
ellipse(window2X,window2Y,window2W,window2H);
} else{
    //window1
fill(#BCD7E5);
stroke(0);
rect(window1X,window1Y,window1W,window1H);
//window2
ellipse(window2X,window2Y,window2W,window2H);}
line(windowpane1X,windowpane1Y,windowpane2X,windowpane2Y);

//chimney
noStroke();
fill(#B74661);
rect(chimneyX,chimneyY,chimneyW,chimneyH);



//run my classes in front of house


 myCloud.run();
 myCloud2.run();
 myBird.run();

}


//Bird variables

 float birdHeadW=20;
 float birdHeadH=20;
 float birdHeadSpeedX=2;
float birdHeadSpeedY=1;
//Bird location


 float birdHeadX=random(1,800);
 float birdHeadY=random(40,130);

float birdBodyY;
float birdBodyX;
float birdBeakX;
float birdBeakY;
float birdWingX;
float birdWingY;
float birdTailX;
float birdTailY;
float birdEyeX;
float birdEyeY;

class Bird{

 

//Functions
  void run(){
   display();
   move();
  bounce();
  }

  void bounce(){

      if (birdHeadY>height){
    birdHeadSpeedY=birdHeadSpeedY*-1;
  }
        if (birdHeadY<0){
    birdHeadSpeedY=birdHeadSpeedY*-1;
  }
        if (birdHeadX<0){
    birdHeadSpeedX=birdHeadSpeedX*-1;
  }
 

 if (birdHeadX>width){
    birdHeadSpeedX=birdHeadSpeedX*-1;
  }
}
    void move(){

      
  birdHeadX=birdHeadX+birdHeadSpeedX;
  birdHeadY=birdHeadY+birdHeadSpeedY;
 //make the parts of bird move relative to head
birdBodyY=birdHeadY;
birdBodyX=birdHeadX-24;
birdBeakX=birdHeadX+10;
birdBeakY=birdHeadY;
birdWingX=birdBodyX;
birdWingY=birdBodyY+15;
birdTailX=birdBodyX-15;
birdTailY=birdBodyY-5;
birdEyeX=birdHeadX+4;
birdEyeY=birdHeadY-4;
    
  }


  void display(){
    
    


//bird stuff
fill(#FF825F);
ellipse(birdBeakX,birdBodyY,20,5);
fill(#FC1212);
ellipse(birdHeadX,birdHeadY,20,20);
ellipse(birdBodyX,birdBodyY,40,20);
ellipse(birdWingX,birdWingY,20,30);
ellipse(birdTailX,birdTailY,20,10);
fill(#404B83);
ellipse(birdEyeX,birdEyeY,3,3);

  }  
   
}



class Cloud{
 //global variables
 

 float cloudH=random(30,60); //50
 float cloudW=cloudH*4;   //200
 

 

 //defining my cloud locations
 float cloudP1X=random(1,800);
 float cloudP1Y=random(40,130);
 float cloudP2X=cloudP1X+cloudH*.8;
 float cloudP2Y=cloudP1Y-cloudH*.8;
 float cloudP3X=cloudP2X+cloudH;
 float cloudP3Y=cloudP2Y+cloudH;
 float cloudP4X=cloudP3X+cloudH*1.2;
 float cloudP4Y=cloudP3Y-cloudH*.8;
 

 
 
 //Functions
  void run(){
   display();
   move();
  repeat();
  }

  void repeat(){
//cloud cycle
if (cloudP1X>width+100)
cloudP1X=-100;
if (cloudP2X>width+100)
cloudP2X=-100;
if (cloudP3X>width+100)
cloudP3X=-100;
if (cloudP4X>width+100)
cloudP4X=-100;
  }
  
  void move(){
  //cloud
cloudP1X=cloudP1X+1;
cloudP2X=cloudP2X+1;
cloudP3X=cloudP3X+1;
cloudP4X=cloudP4X+1;
  }
  
  void display(){

fill(#F4F5ED);
noStroke();
ellipse(cloudP1X,cloudP1Y,cloudW,cloudH);
ellipse(cloudP2X,cloudP2Y,cloudW,cloudH);
ellipse(cloudP3X,cloudP3Y,cloudW,cloudH);
ellipse(cloudP4X,cloudP4Y,cloudW,cloudH);
  }  


}





class Ball{
 //global variables
 float x = 0;
 float y = 0;
 float speedX = 2;
 float speedY = 4;
 //constructor
 Ball(float _x, float _y){
  
  x = _x;
  y= _y;
   
 }
 
 
 
 //Functions
  void run(){
   display();

  }

  void display(){
fill(#83F6FF);
  ellipse(x,y,mouseX/300,mouseX/300);
  }  
  
  

   
}

class Ball2{
 //global variables
 float x = 0;
 float y = 0;
 float speedX = 2;
 float speedY = 4;
 //constructor
 Ball2(float _x, float _y){
  
  x = _x;
  y= _y;
   
 }
 
 
 
 //Functions
  void run(){
   display();

  }

  void display(){
fill(#83F6FF);
  ellipse(x,y,-1*mouseY/300,-1*mouseY/300);
  }  
  
  

   
}



