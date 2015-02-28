

int circleX = 0;
int circleY = 150;
int circleA = 1000;
int circleB = 150;
int circleS = 250;
int circleD = 150;
int circleF = 750;
int circleG = 150;
float circleColour = 0;
float change = 1.5;
float circleSize = 50;
float circleH = random(0,200);

void setup() {
  size (1000, 300);
  smooth();
  frameRate(60);
  
  background(mouseX*mouseY);
  
  
}

void draw() {

  //background(mouseX*mouseY);
fill(255);
strokeWeight(20);
line(100,100,300,300);
line(random(100),100,random(300),300);
line(100,100,600,700);

 
 //rectangle
 fill(0);
 rectMode(CORNER);

 rect(random(20),random(0),random(20),random(300));
 rect(60,0,random(40),random(300));
 rect(120,0,20,300);
 rect(160,0,100,300);
 rect(280,0,random(80),random(300));
 rect(420,0,40,300);
 rect(480,0,20,300);
 rect(random(520),random(0),40,300);
 rect(600,0,40,300);
 rect(random(680),random(0),40,300);
 rect(random(760),random(0),40,300);
 rect(820,0,20,300);
 rect(random(860),random(0),20,300);
 rect(random(900),random(0),random(20),random(300));
 
 rect(920,0,20,300);
 rect(940,0,40,300);
 
 
  noStroke();
  //fill(circleColour);
  fill(0);
  ellipse(circleX,circleY,circleSize,circleSize);
  //fill (circleColour);
  ellipse(circleA,circleB,circleSize,circleSize);
  
  

  
  
  //circle
  noStroke();
  //yellow circles
  fill(#ffbd4b,150);
  ellipse(500,150,200,200);
  
  ellipse(circleX,circleY,200,200);
  ellipse(circleA,circleB,200,200);
  
  //red circles
  //middle 2
  fill(#ff4b4b,150);
  ellipse(250,150,200,200);
  ellipse(750,150,200,200);
  
  ellipse(circleS,circleD,100,100);
  ellipse(circleF,circleG,100,100);
   
  //end circles 
   fill(#ff4b4b,200);
  ellipse(1000,150,200,200);
  ellipse(0,150,200,200);
  
  //fill(#ffbd4c,150);
  //ellipse(random(1000),random(300),50,50);

  
  
  
  // Display rectangle with CENTER mode
  noFill();
  rectMode(CENTER);
  rect(0,0,25,200);
  ellipse(0,0,25,100);
  
 
  
 

 circleX = circleX+1;
  circleA = circleA-1;
 circleColour = circleColour + change;
 circleSize = circleSize + change/9;
 circleS = circleS+2;
 circleF = circleF-2;

 
 
}

void mousePressed() {
  
  background(255);
}




