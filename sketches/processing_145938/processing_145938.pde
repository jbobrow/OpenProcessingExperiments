
boolean flipFlop = false;
int eyeBallDiam;
float randNum3;
float randNum;
float randNum2;
float randNum4;
float randNum5;
float randNum6;
 
 
void setup(){
  size(300,300);
}
 
 
 
 
 
 
void draw(){
  background(randNum3,randNum4,randNum5);
   
  if (flipFlop == false){
    eyeBallDiam = 30;
  }
  else{
    eyeBallDiam=60;
  }
  


 
     
   
   
  translate(150,150);
  noStroke();
   ellipse (randNum6,randNum5,randNum3,randNum6);
  ellipse( randNum, randNum, randNum, randNum);
  fill(245,224,35);
  ellipse(30,-70,50,50);
  ellipse(-40,70,50,50);
  ellipse(40,-80,40,40);
  ellipse(20,-90,30,30);
  ellipse(50,-80,50,50);
  ellipse(0,0,150,200);
   ellipse (-30,-70,50,40);
  ellipse(-40,-70,50,30);
  fill(295,92,62);
  triangle(-20, 20, 10, 10, 10, 30);
   rect(-60, -10, 20, 10);
  rect(42, -10, 20, 10);
  fill(255,255,255);
  ellipse(-50.5,15,randNum2,randNum2);
  ellipse(50.5,15,randNum2,randNum2);
  fill(295,92,62);
  ellipse(-2,60,10,randNum);
  ellipse(-50,15,eyeBallDiam,eyeBallDiam);
  ellipse(50,15,eyeBallDiam,eyeBallDiam);
   fill(255,255,255);
  ellipse (-50,20,20,10);
  ellipse (50,20,20,10);
  fill(3,0,0);
  ellipse (-50,20,10,10);
  ellipse (50,20,10,10);
  
 

}
 
 
void keyPressed () {
  flipFlop =! flipFlop;
   randNum = random (0,60);
 randNum2 = random (0,50);
 randNum3= random (0,255);
 randNum4 = random (0,255);
 randNum5 = random (0,255);
 randNum6= random (-200,200);
}
