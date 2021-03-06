

boolean flipFlop = false;
int eyeBallDiam = 80;
int blueEyeDiam = 35;
int blackEyeDiam = 20;
int greenDiam1 = 15;
int greenDiam2 = 30;
int greenDiam3 = 10;
int greenDiam4 = 40;
int greenDiam5 = 40;
int greenDiam6 = 10;
int brownPants = 65;
int whitePants = 65;
int blackPants = 95;


void setup(){
  size(300,300, P2D);
}
void draw(){
  background(59,255,250);
  if (flipFlop == false){
    eyeBallDiam = 80;
    blueEyeDiam = 35;
    blackEyeDiam = 20;
    greenDiam1 = 15;
    greenDiam2 = 30;
    greenDiam3 = 10; 
    greenDiam4 = 40;
    greenDiam5 = 40;
    greenDiam6 = 10;
    brownPants = 65;
    whitePants = 65;
    blackPants = 95;
  }
  else{
    eyeBallDiam = 40;
    blueEyeDiam = 15;
    blackEyeDiam = 5;
    greenDiam1 = 45;
    greenDiam2 = 10;
    greenDiam3 = 40;
    greenDiam4 = 10;
    greenDiam5 = 10;
    greenDiam6 = 40;
    brownPants = -40;
    whitePants = -40;
    blackPants = -10;
  }
  
  translate(150,150);
  noStroke();
  fill(255,243,0);
  rect(-100,-150,200,300,10);
  
  //spots
  fill(116,193,100);
  ellipse(-50,-130,greenDiam1,greenDiam1);
  ellipse(70,-139,greenDiam2,greenDiam2);
  ellipse(70,10,greenDiam3,greenDiam3);
  ellipse(70,50,greenDiam4,greenDiam4);
  ellipse(-70,0,greenDiam5,greenDiam5);
  ellipse(-80,30,greenDiam6,greenDiam6);
  
  //white eyes
  pushMatrix();
  translate(-45.5,-75);
  fill(255,255,255);
  ellipse(0,0,eyeBallDiam,eyeBallDiam);
  fill(0,0,0);
  rect(0,-60,5,20);
  rotate(PI/4);
  rect(0,-60,5,20);
  rotate(PI*1.5);
  rect(0,-60,5,20);
  popMatrix();
  
  pushMatrix();
  translate(45.5,-75);
  fill(255,255,255);
  ellipse(0,0,eyeBallDiam,eyeBallDiam);
  fill(0,0,0);
  rect(0,-60,5,20);
  rotate(PI/4);
  rect(0,-60,5,20);
  rotate(PI*1.5);
  rect(0,-60,5,20);
  popMatrix();
  
  
  
  //blue eyes
  fill(23,58,227);
  ellipse(-37.5,-75,blueEyeDiam,blueEyeDiam);
  ellipse(37.5,-75,blueEyeDiam,blueEyeDiam);
  
  //black eyes
  fill(0,0,0);
  ellipse(-37.5,-75,blackEyeDiam,blackEyeDiam);
  ellipse(37.5,-75,blackEyeDiam,blackEyeDiam);
  
  
  //pants brown
  fill(185,127,0);
  rect(-100,brownPants,200,200);
  fill(0,0,0);
  rect(-44,-135,5,20);
  rect(44,-135,5,20);
  
  //pants white
  fill(255,255,255);
  rect(-100,whitePants,200,25);
  
  //pants black
fill(0,0,0);
rect(-100,blackPants,25,15);
rect(-60,blackPants,25,15);
rect(-20,blackPants,25,15);
rect(20,blackPants,25,15);
rect(60,blackPants,25,15);

}

void keyPressed(){
  flipFlop =! flipFlop;
}


