
//CJ Jarmuth

//declare global variables
float eyeRed = 255; 
float eyeGreen = 255;
float eyeBlue = 255;
float browMove = -55;
float mouWidth = 50;
float mouRed = 255;
float mouGreen = 255;
float mouBlue = 255;
float antRed = 255;
float antGreen = 255;
float antBlue = 255;
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
  mouWidth = random(15,50);
  mouRed = random(0,255);
  mouGreen = random(0,255);
  mouBlue = random(0,255);
  browMove = random(-45,-60);
  antRed = random(0,255);
  antGreen = random(0,255);
  antBlue = random(0,255);
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
  rect(-130,0,10,20);
  
    rectMode(CENTER);
  fill(150);
  rect(130,0,10,20);
  
  rectMode(CENTER);
  fill(0);
  rect(110,0,20,50);
  
  rectMode(CENTER);
  fill(0);
  rect(-110,0,20,50);
  
  //mouth
  rectMode(CENTER);
  fill(mouRed,mouGreen,mouBlue);
  rect(0,50,150,mouWidth);
  
  rectMode(CENTER);
  fill(0);
  rect(60,50,5,mouWidth);
  
  rectMode(CENTER);
  fill(0);
  rect(30,50,5,mouWidth);
  
  rectMode(CENTER);
  fill(0);
  rect(0,50,5,mouWidth);
  
  rectMode(CENTER);
  fill(0);
  rect(-30,50,5,mouWidth);
  
  rectMode(CENTER);
  fill(0);
  rect(-60,50,5,mouWidth);
  
  //eyes...kinda
  fill(0,0,0);
  ellipse(50,-15,50,50);
  
  fill(eyeRed,eyeGreen,eyeBlue);
  ellipse(50,-15,40,40);
  
  fill(0,0,0);
  ellipse(-50,-15,50,50);
  
  fill(eyeRed,eyeGreen,eyeBlue);
  ellipse(-50,-15,40,40);
  
  //antenna
  rectMode(CENTER);
  fill(150,150,150);
  rect(0,-115,15,30);
  
  fill(antRed,antGreen,antBlue);
  ellipse(0,-130,30,30);
  
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



