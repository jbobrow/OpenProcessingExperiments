
 //lyndsey dulfer
//my great sketch
// declare global variables

float eyeSize=5;
float earsWiggle=15;
float stickOut;      
float eyeColor=10;
float eyeWhite=10;
float tonGue;
float tongueLine;
float eyeBrow=5;
float eyeSkin;
float eyeSkinh;
float hairLength=215;
float hairTop=60;


//runs once
void setup(){
  size(300,300);
  background(100,100,170);
  noStroke();
 }
void keyPressed(){
  eyeSize=random(3,10);
  earsWiggle=random(10,70);
  eyeWhite=random(15,40);
  eyeColor=random(10,15);
  eyeBrow=random(1,20);
  hairLength=random(180,230);
  hairTop=random(60,80);
 
   
} 
//runs forever  
void draw(){
  makeface();

  
}
void makeface(){
 background(100,100,170);
  translate(150,150);
  fill(247,220,161);
  ellipse(0,0,120,200);
      
  fill(247,210,173);
  ellipse(-40,10,20,30);
  ellipse(40,10,20,30);
  
  fill(255,255,255);
  ellipse(20,-20,20,eyeWhite);
  ellipse(-20,-20,20,eyeWhite);
  
  fill(121,206,212);
  ellipse(-20,-20,eyeColor,eyeColor);
  ellipse(20,-20,eyeColor,eyeColor);
  
  fill(0,0,0);
  ellipse(20,-20,eyeSize,eyeSize);
  ellipse(-20,-20,eyeSize,eyeSize);
  
  fill(250,235,202);
  rect(-5,-19,10,50);
  ellipse(-7,27,9,9);
  ellipse(7,27,9,9);
  ellipse(0,30,9,9);
  
  fill(107,77,11);
  rect(10,-40,27,eyeBrow);
  rect(-33,-40,27,eyeBrow);
  ellipse(0,-80,150,hairTop);
  
  fill(207,114,131);
  ellipse(0,55,40,15);
  ellipse(-15,53,20,10);
  ellipse(15,53,20,10);
  
  fill(247,220,161);
  rect(-66,-55,130,15);
  
  fill(107,77,11);
  ellipse(-70,20,30,hairLength);
  ellipse(70,20,30,hairLength);
  
  fill(247,161,214);
  ellipse(0,68,stickOut,stickOut);
  
  fill(150,65,80);
  rect(-22,52,47,3);
  
  fill(247,220,161);
  ellipse(23,-33,eyeSkin,eyeSkinh);
  ellipse(-21,-33,eyeSkin,eyeSkinh);
  
  fill(247,220,161);
  ellipse(-60,10,earsWiggle,40);
  ellipse(60,10,earsWiggle,40);
  
  fill(227,197,141);
  ellipse(60,8,10,20);
  ellipse(-60,8,10,20);
  
  fill(121,206,212);
  ellipse(60,22,5,5);
  ellipse(-60,22,5,5);
  
  fill(247,220,161);
  ellipse(55,8,10,20);
  ellipse(-55,8,10,20);
  
  fill(107,77,11);
  ellipse(-60,-45,30,70);
  ellipse(60,-45,30,70);
  
  fill(196,124,169);
  rect(-2,55,tonGue,tongueLine);
  

  
  
  
}


