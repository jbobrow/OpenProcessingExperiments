
Amanda[] buggy=new Amanda [4];
void setup()
{
  size(800,800);
  smooth();
  for(int i=0; i<buggy.length; i++){
    buggy[i]=new Amanda((i+1)*150, 400,(i+1));
  }
 }
  
 

void draw () {
  background(247, 221, 168);
  
  for(int i=0; i<buggy.length; i++)
 {
   buggy[i].buggyCreate();
   buggy[i].createLegs();
   buggy[i].createArms();
   buggy[i].keyPressed();
   buggy[i].eyeClose();
 }
  /*GRID
  strokeWeight(1);
   for (int i=5; i< width; i=i+5)
     {
      line (i,0, i, height);
      line(0, i, width, i);
     }
 */
  
 //ends draw
 }
 

 
 
 /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ CLASS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
class Amanda {
  float centerX, centerY;
  float eyeShake;
  float kneeRX, kneeLX, kneeY;
  float ankleRX, ankleLX, ankleY;
  float elbowLX, elbowRX, elbowY;
  float wristLX, wristRX, wristY;
  boolean timeToFall, jumped;
  boolean eyeCloseL, eyeCloseR;
  int jumpTime, fallTime, power;
  float startY;
  int buggyName;

  Amanda (float _centerX, float _centerY, int _buggyName) {
    centerX=_centerX;
    centerY=_centerY;
    startY=_centerY;
    buggyName=_buggyName;
    
    eyeShake=0;
    
    //variables for legs
    kneeRX=centerX+40;
    kneeLX=centerX-40;
    kneeY=centerY+65;
    ankleRX=centerX+48;
    ankleLX=centerX-48;
    ankleY=centerY+103;
    
    //variables for arms
    elbowLX=centerX-48;
    elbowRX=centerX+48;
    elbowY=centerY-3;
    wristLX=centerX-43; 
    wristRX=centerX+43;
    wristY=centerY+10;
  
    timeToFall=false;
    jumped=false;
    jumpTime=0;
    fallTime=0; 
    power=0;
    
    eyeCloseR=false;
    eyeCloseL=false;
    }
  
  /*function to check if an arrow key has been pressed
 and moves in appropriate direction*//////////////////////////////////////////////////////
  void keyPressed ()
     {
   /*move right if the right arrow is pressed and the bug is still in the screen*/
       if (keyPressed==true && keyCode==RIGHT && centerX+55<=width) {
         centerX=centerX+1;
         kneeRX=kneeRX+1;
         kneeLX=kneeLX+1;
         ankleRX=ankleRX+1;
         ankleLX=ankleLX+1;
         wristRX+=1;
         wristLX+=1;
         elbowRX+=1;
         elbowLX+=1;  
       }
       
       /*move left if the left arrow is pressed and the bug is still in the screen*/
       else if(keyPressed==true && keyCode==LEFT && centerX-55>=0) {
         centerX=centerX-1;
         kneeRX=kneeRX-1;
         kneeLX=kneeLX-1;
         ankleRX=ankleRX-1;
         ankleLX=ankleLX-1;
         wristRX-=1;
         wristLX-=1;
         elbowRX-=1;
         elbowLX-=1;
       }
     
     /*squat if down is pressed and the bug is at the starting height*/
      else if (keyPressed==true && keyCode==DOWN && centerY>=startY && centerY<=startY+55){
        timeToFall=false;
        //move bug down
        centerY=centerY+1;
        /*count to determine how long jump will be and how long fall will need 
        to be to return to the original height*/
        jumpTime=jumpTime+1;
        fallTime=fallTime-1;
        //store the amount of time the bug will fall
        power=jumpTime;
       }
    /*jump to original starting height. jumpPower will be back to 0 once initial height is reached*/   
     else if (keyCode==UP && jumpTime!=fallTime && centerY>=startY)
       {
         centerY=centerY-1;
         //continue to jump depending on how far the bug squatted
         jumpTime=jumpTime-1;
         //
         if(jumpTime!=fallTime) {
           fallTime=fallTime+1;
         //print(centerY);
         } 
       jumped=true;
       
       }
       
     /*jump past starting height*/  
     else if(jumpTime==fallTime  && jumped==true && power>0){ 
       power=power-1;
       centerY=centerY-3;
       ankleY=ankleY-3;
       kneeY=kneeY-3;
       wristY-=3;
       elbowY-=3;
       
       //eyes shake 
       eyeShake=random(-2,2); 
     }
     
     /*fall to starting height*/
     else if (centerY<startY && power==0) {
       centerY=centerY+1;
       ankleY=ankleY+1;
       kneeY=kneeY+1;
       wristY+=1;
       elbowY+=1;
       
       //eyes shake less
       eyeShake=random(-1,1);
     }
   }

  /*Draws the zoog. All pieces are relative to the center of the bug defined as centerX and centerY*////////////////////////////
 void buggyCreate ()
 {
   ellipseMode(CENTER);
    
   //body, 
   noStroke();
   fill(48, 28, 32);
   ellipse(centerX,centerY,60,120);
 
   //segment: top
   fill(93,63,62);
   beginShape();
   vertex(centerX-25,centerY-30);
   bezierVertex(centerX-5,centerY,centerX+5,centerY,centerX+25,centerY-30);
   endShape();
  
    fill(48,28,32);
    beginShape();
    vertex(centerX-25,centerY-30);
    bezierVertex(centerX-5,centerY-15,centerX+5,centerY-15,centerX+25,centerY-30);
    endShape();
  
    //segment: middle
    fill(93,63,62);
    beginShape();
    vertex(centerX-30,centerY-4);
    bezierVertex(centerX-5,centerY+29,centerX+5,centerY+29,centerX+30,centerY-4);
    endShape();
  
    fill(48,28,32);
    beginShape();
    vertex(centerX-30,centerY-4);
    bezierVertex(centerX-5,centerY+14,centerX+5,centerY+14,centerX+30,centerY-4);
    endShape();
  
    //segment: bottom
    fill(93,63,62);
    beginShape();
    vertex(centerX-27,centerY+25);
    bezierVertex(centerX-2,centerY+54,centerX+2,centerY+54,centerX+27,centerY+25);
    endShape();
  
    fill(48,28,32);
    beginShape();
    vertex(centerX-27,centerY+25);
    bezierVertex(centerX-5,centerY+38,centerX+5,centerY+38,centerX+27,centerY+25);
    endShape();
  
    //head
    fill(93, 63, 62);
    ellipse(centerX,centerY-60,100,40);
    
    //nose
    noStroke();
    fill(104, 109, 100);
    ellipse(centerX,centerY-60,20,10);
 
    //smile
    fill(255);
    beginShape();
    vertex(centerX-10,centerY-50);
    bezierVertex(centerX-5,centerY-45,centerX+5,centerY-45,centerX+10,centerY-50);
    endShape();
 
  //draw eyes
 
    fill(0);
    stroke(0);
    fill(204, 209, 168);
    ellipse(centerX+20,centerY-78,20,30);
  
    //eyeballs (right then left)
    stroke(0);
    fill(204, 209, 168);
    ellipse(centerX+20,centerY-78,20,30);
    ellipse(centerX-20,centerY-78,20,30);
 
    //iris (right then left)
    fill(130, 173, 154);
    ellipse(centerX+17,centerY-84,12,15);
    ellipse(centerX-23, centerY-84,12,15);  
 
    //pupil
    fill(0);
    ellipse(centerX+17+eyeShake,centerY-84,4,4);
    ellipse(centerX-23+eyeShake,centerY-84,4,4);
  
  
  //cover eye if mouse is on either eye
   if (eyeCloseL==true)
   {
    fill(100);
    stroke(100);
    ellipse(centerX-20,centerY-78,20,30);
    stroke(50);
    strokeWeight(2);
    line(centerX-30, centerY-78, centerX-10, centerY-78);
  }
   else if(eyeCloseR==true){
     fill(100);
     stroke(100);
     ellipse(centerX+20,centerY-78,20,30);
     stroke(50);
     strokeWeight(2);
     line(centerX+10, centerY-78, centerX+30, centerY-78);
   }
 
    
  }
 
 
 /*function to create arms and hands*/////////////////////////////////////////////////////
 void createArms(){
   //upper arms (l then r)
   stroke(0);
   strokeWeight(4);
   line(centerX-28, centerY-20, elbowLX, elbowY);
   line(centerX+28, centerY-20, elbowRX, elbowY);
 
 
  //forearms (l then r)
  strokeWeight(2);
  line(elbowLX, elbowY, wristLX, wristY);
  line(elbowRX, elbowY, wristRX, wristY);
    
  //hands (l then r)
  ellipseMode(CENTER);
  strokeWeight(1);
  fill(212, 186, 133);
  ellipse(elbowLX, wristY+5, 18, 10);
  ellipse(elbowRX, wristY+5, 18, 10);
}
 
 
 
 /*function to create legs and feet*/////////////////////////////////////////////////////
 void createLegs() {
 
   //upper legs (l then r)
  stroke(0);
  strokeWeight(4);
  line(centerX-20, centerY+45, kneeLX, kneeY);
  line(centerX+20, centerY+45, kneeRX, kneeY);

 
//lower legs (l then r)
  strokeWeight(2);
  line(kneeLX, kneeY, ankleLX, ankleY);
  line(kneeRX, kneeY, ankleRX, ankleY);
  
//feet (l then r)
  ellipseMode(CORNER);
  strokeWeight(1);
  fill(212, 186, 133);
  ellipse(ankleLX-26, ankleY, 30, 10);
  ellipse(ankleRX-4, ankleY, 30, 10);
}

 /*function to close eyes if mouse is near*/////////////////////////////////////////////////////
 
 void eyeClose()
 {
   if ((dist(mouseX, mouseY, centerX-20, centerY-78))<=15){
     
       eyeCloseL=true;
   
     }
     else if(dist(mouseX, mouseY, centerX+20, centerY-78)<=15){
       eyeCloseR=true;
     }
     else{
       eyeCloseL=false;
       eyeCloseR=false;
     }
     
   
 }

}


 
    

  
   

