
//face size 

float faceWidth;
float faceHeight;


//face position 

float faceX;
float faceY;


//mouth position 

float mouthX;
float mouthY;



void setup(){
  
  size(400,400);
  background(255);
  smooth();
  
  

 
 faceWidth=250;
 faceHeight=200; 
 
 faceX=0;
 faceY=0;
}  
  
  
  void draw(){
    background(255);
    
 //   faceX = mouseX;
 //   faceY = mouseY;
    
 //   faceWidth = mouseX;
    

    
    //head
  rect(faceX,faceY,faceWidth,faceHeight);
  
  ellipse(faceX+(faceWidth/4),faceY+(faceHeight/2),faceWidth/5,faceWidth/5);
  ellipse(faceX+(faceWidth)-(faceWidth/4),faceY+(faceHeight/2),faceWidth/5,faceWidth/5);
  
  
  
  ellipse(faceX+(faceWidth/4),faceY+(faceHeight/2),faceWidth/10,faceWidth/10);
  ellipse(faceX+(faceWidth)-(faceWidth/4),faceY+(faceHeight/2),faceWidth/10,faceWidth/10);
  
  
  //mouth 
  
  ellipse(faceX+(faceWidth/2),faceY+(faceHeight-(faceHeight/4)),faceWidth/5,faceHeight/15);
  
  
  
  
    //eyes
   // ellipse(width/5,height/3,100,100);
    //ellipse(width/5,height/3,50,50);
  
  
    //ellipse(width/2,height/3,100,100);
    //ellipse(width/2,height/3,50,50);
    
    
    //mouth 
    
 
  
  }


