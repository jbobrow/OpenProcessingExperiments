
void setup()
{
 size (480,320); //set the size
smooth();       // turn on smoothing
}

float mousejam; // counter for mouse clicks
float colorjam=0; // counter for 


void draw()
{
 
   background (150);
   
 int x = 320;   //inverts y-axis from illustrator coordinates

float eye=mousejam/2.5;  //eye diametere tied to mouse click 
float xp= mousejam*2;   // red bar height tied to mouse click
float mgc=mousejam*1.7; //green bar height tied to mouse click
float pwr=mousejam*1.5; //blue bar height tied to mouse click
strokeWeight(3); //stroke weight for body
strokeJoin(ROUND);//round out the the design of the robot by capping stroke joints


fill(#9B9B9B);  //set arm and leg color in hex rgb code



ellipse(179.031,x-146.805,48.756,81.243);//left arm
ellipse(277.45,x-146.805,48.754,81.243);//right arm
ellipse(191.38,x-80.01,34.128,134.588);//left leg
ellipse(269.04,x-80.01,34.128,134.588);//right let

fill(#D6D6D6);
beginShape();   //vertex shape for body of robot
vertex(175.38,x-193.16);
vertex(207.29,x-242.41);
vertex(252.43,x-242.41);
vertex(284.35,x-193.16);
vertex(284.35,x-123.5);
vertex(252.43,x-74.24);
vertex(207.29,x-74.24);
vertex(175.38,x-123.5);
endShape(CLOSE);


fill(#FFFFFF);
beginShape();  //tummy
vertex(193.74,x-186.57);
vertex(214.9,x-219.22);
vertex(244.82,x-219.22);
vertex(265.98,x-186.57);
vertex(265.98,x-140.39);
vertex(244.82,x-107.74);
vertex(214.9,x-107.74);
vertex(193.74,x-140.39);
endShape(CLOSE);

fill(#9B9B9B);
beginShape();  //head shape
vertex(152.76,x-290.01);
vertex(191.13,x-290.01);
vertex(213.39,x-312.27);
vertex(246.33,x-312.27);
vertex(268.59,x-290.01);
vertex(306.96,x-290.01);
vertex(306.96,x-187.2);
vertex(152.76,x-187.2);
endShape(CLOSE);


fill(#000000); 
rectMode(CENTER);
rect(229.861, x-249.07,135.184,68.778); //tv head
rect(229.861,x-199.1,96.141,5.711); // mouthshape

fill(#FFD400);
ellipse(168.421,x-204.812,eye,eye); //eyes
ellipse(291.302,x-204.812,eye,eye);

  if( pwr+mgc+xp>= 62*3){      // limits eyeball size
    eye=15;
  }

beginShape();       //head triangle
vertex(229.41,x-309.39);
vertex(241,x-289.3);
vertex(217.81,x-289.3);
endShape(CLOSE);
  
beginShape();    //right head wing thing
vertex(307.96,x-261.05);
vertex(320.37,x-261.05);
vertex(320.37,x-237.01);
vertex(307.13,x-223.77);
endShape(CLOSE);

beginShape();   // left head wing thing
vertex(139.52,x-261.05);
vertex(151.92,x-261.05);
vertex(152.765,x-223.77);
vertex(139.52,x-237.01);
endShape(CLOSE);
 


  
  if (xp>=62){
    rect(183,x-249,32,62);  //if counter is full draw a static yellow rect
  }
  else{                   // counter is being added to draw a red rect based on clicks
    fill(255,0,0);
  rect(183,x-249,32,xp);
}
  
  
  if(mgc>=62){
    rect(230,x-249,32,62);
  }
  else{
  fill(0,255,0);
  rect(230,x-249,32,mgc);
  }
 
 
 if(pwr>=62){
   rect(277,x-249,32,62);
 }
 
 else{
  fill(0,0,255);
  rect(277,x-249,32,pwr);
 }
  
   if (millis() % 2 == 1){  //using millis timer and modulus to reduce counter at a rate
   mousejam-=.2;
   if (mousejam<0){
     mousejam=0;          // prevents counter from dipping below zero
   }
 
   colorjam-=1;
   if (colorjam<0){
     colorjam=0;}
   
 
   } 
  
  println(millis());
}
 
  void mousePressed() //on mouse pressed add to counters
  {
    mousejam+=2;
   // colorjam+=5; 
    
  }
  
  
  
  
  

