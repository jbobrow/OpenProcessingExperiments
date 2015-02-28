
//CJ Jarmuth

//declare global variables
float eyeRed = 255; 
float eyeGreen = 255;
float eyeBlue = 255;
float eyeOuter = 50;
float eyeInner = 40;
float browMove = -55;
float mouHeight = 50;
float mouLines = 5;
float mouRed = 255;
float mouGreen = 255;
float mouBlue = 255;
float antRed = 255;
float antGreen = 255;
float antBlue = 255;
float antSize = 30;
float antWidth = 15;
float earHeight = 50;
float earWidth = 20;
float earHeighttwo = 20;
float earWidthtwo = 10; 
boolean clicked = false;

//runs once
void setup(){
  size(300,300);
  background(149,153,207);

}

void keyPressed(){
  background(149,153,207);
  clicked =! clicked;
  eyeRed = random(0,255);
  eyeGreen = random(0,255);
  eyeBlue = random(0,255);
  mouHeight = random(15,50);
  mouRed = random(0,255);
  mouGreen = random(0,255);
  mouBlue = random(0,255);
  browMove = random(-75,-30);
  antRed = random(0,255);
  antGreen = random(0,255);
  antBlue = random(0,255);
  antSize = random(10,50);
  eyeOuter = random(5,50);
  antWidth = antSize/2;
  eyeInner = eyeOuter/1.25;
  earHeight = random(10,70);
  earWidth = random(10,20);
  earHeighttwo = random(5,30);
  earWidthtwo = random(5,20);
}

//runs forever
void draw(){
  
   
  translate(150,150);
  rectMode(CENTER);
  fill(150,150,150);
  rect(0,0,200,200);
  
  //ears
  rectMode(CENTER);
  fill(150);
  rect(-130,0,earWidthtwo,earHeighttwo);
  
    rectMode(CENTER);
  fill(150);
  rect(130,0,earWidthtwo,earHeighttwo);
  
  rectMode(CENTER);
  fill(0);
  rect(110,0,earWidth,earHeight);
  
  rectMode(CENTER);
  fill(0);
  rect(-110,0,earWidth,earHeight);
  
  //mouth
  rectMode(CENTER);
  fill(mouRed,mouGreen,mouBlue);
  rect(0,50,150,mouHeight);
  
  rectMode(CENTER);
  fill(0);
  rect(60,50,5,mouHeight);
  
  rectMode(CENTER);
  fill(0);
  rect(30,50,5,mouHeight);
  
  rectMode(CENTER);
  fill(0);
  rect(0,50,5,mouHeight);
  
  rectMode(CENTER);
  fill(0);
  rect(-30,50,5,mouHeight);
  
  rectMode(CENTER);
  fill(0);
  rect(-60,50,5,mouHeight);
  
  //eyes...kinda
  fill(0,0,0);
  ellipse(50,-15,eyeOuter,eyeOuter);
  
  fill(eyeRed,eyeGreen,eyeBlue);
  ellipse(50,-15,eyeInner,eyeInner);
  
  fill(0,0,0);
  ellipse(-50,-15,eyeOuter,eyeOuter);
  
  fill(eyeRed,eyeGreen,eyeBlue);
  ellipse(-50,-15,eyeInner,eyeInner);
  
  //antenna
  rectMode(CENTER);
  fill(150,150,150);
  rect(0,-115,antWidth,30);
  
  fill(antRed,antGreen,antBlue);
  ellipse(0,-130,antSize,antSize);
  
  //eyebrows
  rectMode(CENTER);
  fill(92);
  rect(50,browMove,60,20);
  
 
  rectMode(CENTER);
  fill(92);
  rect(-50,browMove,60,20);
  
  //neck
  rectMode(CENTER);
  fill(150,150,150);
  rect(0,115,50,30);
  
  rectMode(CENTER);
  fill(150,150,150);
  rect(0,153,250,45);
  
  rectMode(CENTER);
  fill(0);
  rect(0,105,50,2);
  
  rectMode(CENTER);
  fill(0);
  rect(0,115,50,2);
  
  rectMode(CENTER);
  fill(0);
  rect(0,125,50,2);
}



