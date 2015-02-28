
float[] posX=new float[9];
float[] xVel=new float[9];
float[] posY=new float[9];


float startingTime= 0;
//PFont myfont=loadFont("BankGothic.vlw");



boolean printVictory = false;
boolean weHaveAWinner = false;


void setup(){
  size(500,500);
  smooth();
  
  for(int i=0;i<9;i++){
  posX[i]=40*(1+i);
  xVel[i]=random(5,10);
  posY[i]=10;}

}

void draw(){
 background(255);
 
 

 if (second()-startingTime==2) {
       fill(255,200,33);
       noStroke();
       ellipse(400, 50, 30, 30);
       ellipse(400, 20, 30, 30);
              
  }

 if (second()-startingTime==1) {
       
       fill(255,90,33);
       noStroke();
       ellipse(400, 20, 30, 30);
       ellipse(400, 50, 30, 30);
       ellipse(400, 80, 30, 30);}
       


 if (second()-startingTime==3) {
       fill(82,200,35);
       noStroke();
       ellipse(400, 20, 30, 30);}
  
 if (second()-startingTime==4) {    
 noFill();
 stroke(2);
 movement();
 for(int i=0;i<9;i++){
 stroke(0);
 ellipse(posX[i],posY[i],10,10);}
 
 for(int i=0;i<9;i++){
   if(posY[i]>=500){
   printVictory=true;}
 }
 if(printVictory==true&&weHaveAWinner==false){
   println("vivtory");
   printVictory=false;
   weHaveAWinner=true;
 }
 
 
  
       
       
 
 
} 
 
}

void movement(){
  for(int i=0;i<9;i++){
    posY[i]=posY[i]+xVel[i];
  }
  
 
}


  void mouseClicked(){
  startingTime=second();}


