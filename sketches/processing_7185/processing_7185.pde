
int eyeSize = 90; 
int eyePosXL=220; 
int eyePosY = 240; 
int eyePosXR = 420; 
int pupilSize = 30; 
int blinkTime; 
int blinkOpen = 0; 
int eyeRed =1; 
int eyeRedR =1; 
int overPupil = 0; 
int overPupilR = 0; 
int f; 
boolean follow = true; 
float pupilX; 
float pupilY; 
float pupilXR; 
float pupilYR; 
float pupilDist; 
float speed; 
boolean sleep = false; 
boolean sleepR = false; 
void setup(){ 
 size(640,480); 
 smooth(); 
} 
 
void draw(){ 
 background(220); 
 noStroke(); 
 fill(255); 
 //white part of eye 
 ellipse(eyePosXL,eyePosY,eyeSize,eyeSize); 
 ellipse(eyePosXR,eyePosY,eyeSize,eyeSize); 
 speed = dist(pmouseX,pmouseY,mouseX,mouseY); 
 if(speed>80){ 
   pupilSize=10; 
 } 
 //Makes the eye move smooth but still center when the mouse is rightabove the pupil 
 if(follow){ 
 pupilY = 210 + map(mouseY,0,480,0,60); 
 pupilYR = 210 + map(mouseY,0,480,0,60); 
 if(eyePosXL > mouseX){ 
   pupilX = map(mouseX,0,eyePosXL,eyePosXL-30,eyePosXL); 
 }else if(mouseX >350){ 
   pupilX = eyePosXL+30; 
 }else{ 
   pupilX = map(mouseX,eyePosXL,350,eyePosXL,eyePosXL+30); 
 } 
 
 if(mouseX > eyePosXR){ 
   pupilXR = map(mouseX,eyePosXR,640,eyePosXR,eyePosXR+30); 
 }else if(290 >mouseX){ 
  pupilXR = eyePosXR-30; 
 }else{ 
    pupilXR = map(mouseX,eyePosXR,290,eyePosXR,eyePosXR-30); 
  }  
 } 
  //Making sure that the pupil is inside the white of the eye 
 pupilDist=dist(eyePosXL,eyePosY,pupilX,pupilY); 
 if(pupilDist>31){ 
   //Pupil is outside white 
  if(pupilX>200){ 
    pupilX = pupilX - ((pupilDist-29)/2); 
  }else{ 
    pupilX = pupilX + ((pupilDist-29)/2); 
  } 
  if(240>pupilY){ 
    pupilY= pupilY + ((pupilDist-29)/2); 
  }else{ 
    pupilY= pupilY - ((pupilDist-29)/2); 
  } 
 } 
  
 pupilDist=dist(eyePosXR,eyePosY,pupilXR,pupilYR); 
 if(pupilDist>31){ 
   //Pupil is outside white 
  if(pupilXR>440){ 
    pupilXR = pupilXR - ((pupilDist-29)/2); 
  }else{ 
    pupilXR = pupilXR + ((pupilDist-29)/2); 
  } 
  if(240>pupilY){ 
    pupilYR= pupilYR + ((pupilDist-29)/2); 
  }else{ 
    pupilYR= pupilYR - ((pupilDist-29)/2); 
  } 
 } 
 fill(eyeRed,0,0); 
 ellipse(pupilX,pupilY,pupilSize,pupilSize); 
  fill(eyeRedR,0,0); 
 ellipse(pupilXR,pupilYR,pupilSize,pupilSize); 
 
 fill(255);
 ellipse(pupilX-5,pupilY-5,5,5);
ellipse(pupilXR-5,pupilYR-5,5,5);  
  
 //if over pupil close left eye 
 
 if(dist(mouseX,mouseY,pupilX,pupilY)<16){ 
   overPupil++;     
   fill(220); 
   if(overPupil<20){ 
     ellipse(eyePosXL,eyePosY+(3*overPupil)-60,eyeSize+100,eyeSize+10); 
      
   }else{ 
     ellipse(eyePosXL,eyePosY,eyeSize,eyeSize+10); 
     sleep=true; 
     sleepR=false; 
     blinkOpen = 0; 
   }    
 }else{    
    overPupil = 0; 
} 
//if over pupil close right eye 
 
 if(dist(mouseX,mouseY,pupilXR,pupilYR)<16){ 
   overPupilR++;     
   fill(220); 
   if(overPupilR<20){ 
     ellipse(eyePosXR,eyePosY+(3*overPupilR)-60,eyeSize+100,eyeSize+10); 
      
   }else{ 
     ellipse(eyePosXR,eyePosY,eyeSize,eyeSize+10); 
     sleepR=true; 
     sleep=false; 
     blinkOpen = 0; 
   }    
 }else{    
    overPupilR = 0; 
} 
  
  
  
//is he asleep? 
 if((mouseX == pmouseX && mouseY == pmouseY)){ 
    
   blinkTime++; 
   if(blinkTime > 180){ 
     //background(220); 
     //noFill(); 
     fill(220); 
     //stroke(9); 
     if(240 > blinkTime){ 
       ellipse(eyePosXL,eyePosY-60+(blinkTime-180),eyeSize+100,eyeSize+10); 
       ellipse(eyePosXR,eyePosY-60+(blinkTime-180),eyeSize+100,eyeSize+10); 
     }else{ 
       ellipse(eyePosXL,eyePosY,eyeSize,eyeSize+10); 
       ellipse(eyePosXR,eyePosY,eyeSize,eyeSize+10); 
       sleep=true; 
       sleepR=true; 
       blinkOpen = 0; 
        
        
     } 
 
   } 
 }else{ 
    
    blinkTime=0; 
 } 
  //opening eyes 
 if(sleep && dist(mouseX,mouseY,pupilX,pupilY)>16){ 
     if(blinkOpen<15){ 
       fill(220); 
       ellipse(eyePosXL,eyePosY-blinkOpen*4,eyeSize+100,eyeSize+10); 
       //ellipse(eyePosXR,eyePosY-blinkOpen*4,eyeSize+100,eyeSize+10); 
       blinkOpen++; 
       eyeRed=250;        
     }  
   } 
 if(sleepR && dist(mouseX,mouseY,pupilXR,pupilY)>16){ 
     if(blinkOpen<15){ 
       fill(220); 
       //ellipse(eyePosXR,eyePosY-blinkOpen*4,eyeSize+100,eyeSize+10); 
       ellipse(eyePosXR,eyePosY-blinkOpen*4,eyeSize+100,eyeSize+10); 
       blinkOpen++; 
       eyeRedR=250;        
     }  
        
  } 
 if(eyeRed > 0){ 
   eyeRed--; 
  } 
  if(eyeRedR > 0){ 
   eyeRedR--; 
  } 
 if(pupilSize < 31){ 
   pupilSize++; 
  } 
 
  //eyebrows
  stroke(#7C4B01);
  strokeWeight(5);
  noFill();
  bezier(280, map(mouseY,0,480,180,200), map(mouseY,0,480,270,240), map(mouseY,0,480,130,160), map(mouseY,0,480,160,140), 170, 150,map(mouseY,0,480,180,170));
  bezier(360, map(mouseY,0,480,180,200), map(mouseY,0,480,350,380), map(mouseY,0,480,130,160), map(mouseY,0,480,480,500), 170, 490,map(mouseY,0,480,180,170));


  
} 


