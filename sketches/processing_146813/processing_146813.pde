

boolean flipFlop = false;
int diam;
float randNum;
float randNum2;
float randNum3;
float randNum4;
float randNum5;
float randNum6;
float randNum7;
float randNum8;
void setup(){
  size(300,300);
    
  
}
void draw(){
  background(randNum7,randNum,randNum5);
  if(flipFlop == false){
    diam = 10;
  }else{
   diam = 15;
  }
   
  fill(255,255,255);
  ellipse(15,randNum,diam,diam);
  ellipse(80,randNum2,diam,diam);
  ellipse(randNum3,200,diam,diam);
  ellipse(200,randNum,diam,diam);
  ellipse(290,randNum3,diam,diam);
  ellipse(245,randNum5 ,diam,diam);
  ellipse(randNum5,245,diam,diam);
    
  translate(120,120);
  noStroke();
fill(131,255,233);
ellipse(0,0,50,80);
fill(3,3,3);
ellipse(-10,-10,diam,diam);
ellipse(10,-10,diam,diam);
fill(247,126,50);
ellipse(0,10,30,10);
fill(131,255,233);
ellipse(0,60,70,70);
ellipse(0,120,90,90);
ellipse(-10,200,10,10);
fill(randNum7,randNum5,randNum);
ellipse(2,60,diam,diam);
ellipse(2,90,diam,diam);
ellipse(2,120,diam,diam);
 
 
 
  
  
}
  
void keyPressed(){
  flipFlop =! flipFlop;
  randNum=random(2,80);
  randNum2=random(2,100);
  randNum3=random(0,120);
  randNum4=random(30,100);
  randNum5=random(0,270);
  randNum6=random(0,111);
  randNum7=random(0,240);
  randNum8=random(0,22);
}


