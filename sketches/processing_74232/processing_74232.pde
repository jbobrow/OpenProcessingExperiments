
//Make A wish
int dir;
int x;
float myNum;
float myNum1;
float myNum2;
float myNum3;
float myNum4;
 
void setup(){
  smooth();
  dir=3;
  x=0;
  size(600,600);
  myNum=0;
}
void draw(){
  background(#050505);
  noStroke();
  
text("Make A Wish", 250,300);
fill(255);
if(mousePressed == true){
  
  fill(255);
  rect(135, 1,3,myNum, myNum);
  myNum+= 2;
  rect(400,1,3,myNum,myNum);
rect(1,1,3,myNum, myNum);
if (myNum>600) 
    myNum=3;
    
    fill(#4FFCEC);
  rect(482, 1,3,myNum1, myNum1);
  myNum1+= 5;
  rect(225,1,3,myNum1,myNum1);
rect(578,1,3,myNum1, myNum1);
if (myNum1>500) 
    myNum1=3;
    
    fill(#F0FFAF);
    rect(70,1,3,myNum2,myNum2);
    myNum2+= 7;
    rect(415,1,3,myNum2,myNum2);
    rect(200,1,3,myNum2,myNum2);
    if(myNum2>600)
    myNum2=3;
    
    fill(#F8CBFF);
    rect(20,1,3,myNum3,myNum3);
    myNum3+= 1;
    rect(530,1,3,myNum3,myNum3);
    rect(320,1,3,myNum3,myNum3);
    if(myNum3>600)
    myNum3=3;
    
     fill(255);
    rect(100,1,3,myNum4,myNum4);
    myNum4+= 4;
    rect(265,1,3,myNum4,myNum4);
    rect(378,1,3,myNum4,myNum4);
    if(myNum4>600)
    myNum4=3;
 
    
    }
 
}
