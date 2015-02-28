
/* @pjs preload="qu.png, w1.png, w2.png, w3.png, w4.png, wor.png"; 
 */

void setup(){
  size(1000,120);
  noCursor();
  frameRate(6);
}
  PImage w1;
PImage w2;
  PImage w3;
PImage w4;
PImage qu;
PImage wor;
int gif=1;
  int pa=100;
  int count;
  float px;
  float p=1 ;
boolean next=false;



void draw(){

      w1=loadImage("w1.png");
      w2=loadImage("w2.png");
           w3=loadImage("w3.png");
      w4=loadImage("w4.png");
    qu=loadImage("qu.png");
    wor=loadImage("wor.png");

  
    background(255);
    rectMode(CENTER);
    rect(width/2,height/2,999*pa/100,100);

  
  gif=-gif;
    imageMode(CORNER);

if(p==1){
  if(gif==-1){
  
  image(w1,width/2-(width/2-px)*pa/100,20,51*pa/100,100);

  }else if(gif==1){
      image(w2,width/2-(width/2-px)*pa/100,20,51*pa/100,100);
  }
}

else if(p==-1){
  if(gif==-1){
  
  image(w3,width/2-(width/2-px)*pa/100,20,51*pa/100,100);

  }else if(gif==1){
      image(w4,width/2-(width/2-px)*pa/100,20,51*pa/100,100);
  }
}

  
  
      imageMode(CORNER);

  image(qu,(width/2+100)-(width/2-840)*pa/100,59,50*pa/100,50);
  image(wor,(width/2+50)-(width/2-890)*pa/100,59,50*(100-pa)/100,50);
        
        
//    line(940,59,990,59);
//    line(940,109,990,109);
    
    line((width/2+100)-(width/2-840)*pa/100,59,(width/2+100)-(width/2-840)*pa/100,109);
    line((width/2+50)-(width/2-890)*pa/100,59,(width/2+50)-(width/2-890)*pa/100,109);
    
    line((width/2+100)-(width/2-890)*pa/100,59,(width/2+100)-(width/2-890)*pa/100,109);

    
    
    
    
    if (px>=889){
    count++;
    if(count>12){
    next=true;}
    }
    if(next==true){
     if(pa>0){
      pa=pa-2; 
     }
    }
    

  
}





void keyPressed(){
  if(px>=0 &&px<=949){
 if (key =='d'){
   px=px+4;
 p=1;
 }
   
 else if(key=='a'){
   px=px-4;
 p=-1;
 }
  }
  else if(px<0){px=0;}
  else if(px>949){px=949;}
   
  
  
}


