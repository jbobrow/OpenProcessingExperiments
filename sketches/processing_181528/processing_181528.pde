
/* 
Donahue_Visually represent 60 seconds
Experimenting with time variables and conditionals 
the lines come in a different intervals and end at one minute
*/

int duration=1000;
int duration2=1000;
int duration3=1000;
int duration4=1000;
int duration5=1000;
int duration6=1000;
int startTime, startTime2,startTime3,startTime4,startTime5,startTime6;
int w,h,j,g,i,k,m,n;
int da=10;
int pause=1000;
int pause2=1000;
int pause3=3000;
int pause4=3000;

float startX, startY,start2X, start2Y,start3X, start3Y,start4X, start4Y,start5X, start5Y,start6X, start6Y; //of line
float currentX, currentY,current2X, current2Y,current3X, current3Y,current4X, current4Y,current5X, current5Y,current6X, current6Y;
float destX, destY,dest2X, dest2Y,dest3X, dest3Y, dest4X, dest4Y,dest5X, dest5Y, dest6X, dest6Y; //of line
float circleX, circleY, circle2X, circle2Y,circle3X, circle3Y, circle4X, circle4Y,circle5X, circle5Y, circle6X, circle6Y;


void setup(){
  size (400,400);
  w=10;
  h=10;
  
  //startX variables
  j=h;
  startX=10;
  startY=10;
  destX=width-25;
  destY=10;
  currentX=startX;
  currentY=startY;
  circleX=10;
  circleY=10;
  
  //start2X variables
  g=w;
  start2X=24;
  start2Y=10;
  dest2X=24;
  dest2Y=height-12;
  current2X=start2X;
  current2Y=start2Y;
  circle2X=24;
  circle2Y=10;
  
  //start3X variables
  i=h;
  start3X=24;
  start3Y=10;
  dest3X=24;
  dest3Y=height-12;
  current3X=start3X;
  current3Y=start3Y;
  circle3X=24;
  circle3Y=10;
  
  //start4X variables
  k=w;
  start4X=10;
  start4Y=10;
  dest4X=width-25;
  dest4Y=10;
  current4X=start4X;
  current4Y=start4Y;
  circle4X=10;
  circle4Y=10;
  
  //start5X variables
  m=h;
  start5X=24;
  start5Y=10;
  dest5X=24;
  dest5Y=height-12;
  current5X=start5X;
  current5Y=start5Y;
  circle5X=24;
  circle5Y=10;
  
  //start6X variables
  n=w;
  start6X=10;
  start6Y=10;
  dest6X=width-25;
  dest6Y=10;
  current6X=start6X;
  current6Y=start6Y;
  circle6X=10;
  circle6Y=10;
  
 
  
  startTime=millis();
  startTime2=millis();
  startTime3=millis()+pause;
  startTime4=millis()+pause2;
  startTime5=millis()+pause3;
  startTime5=millis()+pause4;
}

void draw(){
  background(16,78,109);
  
  //stroke (10);
  //line (startX,j,startX+50,j);
  
  //start X
  for(float j=circleY; j<=height; j=j+14){//repeating the circles down, on either side
     noFill();
     stroke(16,78,70);
     ellipse (circleX,j,w,h); //left circles
     // is right circle's y above aka > startY
     if (startY>=j){ //determing what color the circle should be 
       //println("hi");
       // if yes draw red
        fill(176,   196,   222);
        noStroke();
        ellipse (circleX+(width-25),j,w,h); //right 
         }
     else { //if no, draw light blue
        //println(5);
        noFill();
        ellipse (circleX+(width-25),j,w,h);
       }//end of else statement
     }
     
  if (millis() <startTime + duration){ //are we done yet?
    
     stroke (176,196,222);
     line (currentX,startY,currentX+50,startY); //draw intial line 
     //startX=startX+da;
     
     float xVelocity= (destX-startX)/duration; //determine velocity 
     
     currentX=startX + xVelocity * (millis()-startTime); //determine position 
     
     if (destX+xVelocity*(millis()-startTime) >= destX){ //determine when the line reaches the circle on the right
       fill (245,134,123);
       ellipse (circleX+(width-25),destY,10,10); //draw ellipse 
     }
  }//end of if statement 
  
   else{ //otherwise relocate the line to the next Y value 
    startX=startX;
    startY=startY+14;
    destX=destX;
    destY=destY+14;
    startTime=millis();
  }
 
     //start2X
     for(float g=circle2X; g<=(width-26); g=g+14){ //repeating the circle across the top and bottom 
       noFill();
       stroke(176,196,222);
       ellipse (g,circle2Y,w,h); //top circles 
       // is right circle's X right of start2X?
       if (start2X>=g){ //determining what color the bottom circles should be drawn 
         // if yes draw red
          fill(176, 196, 222);
          ellipse (g,circle2Y+(height-22),w,h); //right 
         }
         else {//if no, drawn light blue
          noFill();
          ellipse (g,circle2Y+(height-22),w,h);
         }
     }
     
     
    if (millis() <startTime2 + duration2){ //are we done yet?
    
     stroke (176,196,222);
     line (start2X,current2Y, start2X, current2Y+50); //draw the vertical line 
     
     float yVelocity= (dest2Y-start2Y)/duration2; //determine velocity 

     current2Y=start2Y + yVelocity * (millis()-startTime2); //determine position 
     
     if (dest2Y+yVelocity*(millis()+startTime2) >= dest2Y){ //determine when the line hits the bottom circle
       fill (245,134,123);
       ellipse (dest2X,circleY+(height-22),10,10); //draw red circle 
     }
   }//end of if statement 
  
  else{ //otherwise relocate the vertical line to the next X location 
    start2X=start2X+14;
    start2Y=start2Y;
    dest2X=dest2X+14;
    dest2Y=dest2Y;
    startTime2=millis();
  }
  
  
  
  //start3X
     for(float i=circle3X; i<=(width-26); i=i+14){ //repeat circles horizontally on both sides 
       noFill();
       stroke(176,196,222);
       ellipse (i,circle3Y,w,h); //top
       // is right circle's X right of start3X 
       if (start3X>=i){
         // if yes draw red, if no, draw light blue 
          fill(176, 196, 222);
          ellipse (i,circle3Y+(height-22),w,h); //bottom 
         }
         else {
          noFill();
          ellipse (i,circle3Y+(height-22),w,h);
         }
     }
     
     
    if (millis() <startTime3 + duration3+pause2){ //are we done yet?
    
     stroke (176,196,222);
     line (start3X,current3Y, start3X, current3Y+50); //draw line
     
     float yVelocity= (dest5Y-start3Y)/duration3;

     current3Y=start3Y + yVelocity * (millis()-startTime3);
     
     if (dest3Y+yVelocity*(millis()+startTime3) >= dest3Y){ //when the line reaches the circle, draw red circle 
       fill (245,134,123);
       ellipse (dest3X,circle3Y+(height-22),10,10);
     }
   }//end of if statement 
  
  else{ //relocate the line to the next X value 
    start3X=start3X+14;
    start3Y=start3Y;
    dest3X=dest3X+14;
    dest3Y=dest3Y;
    startTime3=millis();
  }
  
  //start4X
  for(float k=circle4Y; k<=height; k=k+14){ //draw the circles vertically on both sides 
     noFill();
     stroke(176,196,222);
     ellipse (circle4X,k,w,h); //left circles 
     // is right circle's Y above start4Y
     if (start4Y>=k){
       // if yes draw red, if no, draw white/empty
        fill(176, 196, 222);
        noStroke();
        ellipse (circle4X+(width-25),k,w,h); //right yes 
         }
       else {
        noFill();
        ellipse (circle4X+(width-25),k,w,h); //right no 
       }
     }
     
  if (millis() <startTime4 + duration4+pause2){ //are we done yet?
    
     stroke (176,196,222);
     line (current4X,start4Y,current4X+50,start4Y); //draw line

     float xVelocity= (dest4X-start4X)/duration4;
     
     current4X=start4X + xVelocity * (millis()-startTime4);
     
     if (dest4X+xVelocity*(millis()-startTime4) >= dest4X){ //if the line has reached the circle, fill with red 
       fill (245,134,123);
       ellipse (circle4X+(width-25),dest4Y,10,10);
     }
  }
  
  
   else{ //otherwise move to the next Y value
    start4X=start4X;
    start4Y=start4Y+14;
    dest4X=dest4X;
    dest4Y=dest4Y+14;
    startTime4=millis();
  }
  
  
  //start5X
     for(float m=circle5X; m<=(width-26); m=m+14){ //repeating the circles horizontally 
       noFill();
       stroke(176,196,222);
       ellipse (m,circle5Y,w,h); //top
       // is right circle's X right of start5X
       if (start5X>=m){
         // if yes draw red, if no, draw blue
          fill(176, 196, 222);
          ellipse (m,circle5Y+(height-22),w,h); //bottom yes
         }
         else {
          noFill();
          ellipse (m,circle5Y+(height-22),w,h); //bottom no 
         }
     }//end of for statement
     
     
    if (millis() <startTime5 + duration5+pause3){//are we done yet 
    
     stroke (176,196,222);
     line (start5X,current5Y, start5X, current5Y+50); //draw line 
     
     float yVelocity= (dest5Y-start5Y)/duration5;

     current5Y=start5Y + yVelocity * (millis()-startTime5);
     
     if (dest5Y+yVelocity*(millis()+startTime5) >= dest5Y){ //if the line has reached the cirlce, draw red circle 
       fill (245,134,123);
       ellipse (dest5X,circle5Y+(height-22),10,10);
     }
   }//end of if statement 
  
  else{
    start5X=start5X+14;
    start5Y=start5Y;
    dest5X=dest5X+14;
    dest5Y=dest5Y;
    startTime5=millis();
  }
  
  //start6X
  for(float n=circle6Y; n<=height; n=n+14){//repeat circles vertically 
     noFill();
     stroke(176,196,222);
     ellipse (circle6X,n,w,h); //left
     // is right circle's Y above start6Y
     if (start6Y>=n){
       // if yes draw red, if no, draw light blue 
        fill(176, 196, 222);
        noStroke();
        ellipse (circle6X+(width-25),n,w,h); //right 
         }
       else {
        noFill();
        ellipse (circle6X+(width-25),n,w,h);
       }
     }
     
  if (millis() <startTime6 + duration6+pause4){ //are we done 
    
     stroke (176,196,222);
     line (current6X,start6Y,current6X+50,start6Y);

     float xVelocity= (dest6X-start6X)/duration6;
     
     current6X=start6X + xVelocity * (millis()-startTime6);
     
     if (dest6X+xVelocity*(millis()-startTime6) >= dest6X){ //if line has reached circle, draw red 
       fill (245,134,123);
       ellipse (circle6X+(width-25),dest6Y,10,10); //ellipse
     }
  }
  
  
   else{
    start6X=start6X;
    start6Y=start6Y+14;
    dest6X=dest6X;
    dest6Y=dest6Y+14;
    startTime6=millis();
  }
  
  
  
}//end of draw2


