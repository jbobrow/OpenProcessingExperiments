
//Homework_2 Lightning Balls
//Denali Schmidt

int x;
int y;
int directionx;
int directiony;
int a;
int b;
int directiona;
int directionb;
int A;
int B;
int directionA;
int directionB;
int C;
int D;
int directionC;
int directionD;

void setup(){
  size (600,600);
  smooth();
  x= 25;
  y= 25;
directionx= 4;
directiony= 3;
  a= 40;
  b= 40;
directiona= 4;
directionb= 3;
A=20;
B=20;
directionA=1;
directionB=3;
C=50;
D=50;
directionC=1;
directionD=3;
}

void draw(){              //circle #1
background(223,256,11,20);
noStroke();
ellipse(x,y,50,50);
  
   x+=directionx;
   y+=directiony;
 
if(y>(height-25)){
   directiony= -2;
rect(directionx,directiony,500,500);
fill(random(255),random(255),random(255));
 }
if(x>(width-25)){ 
    directionx= -1;
rect(300,300,500,500);
fill(random(255),random(255),random(255));
 }
if(y<25){
   directiony=3;
rect(300,300,500,500);
fill(random(255),random(255),random(255));
}
if(x<25){
   directionx=4;
rect(directionx,directiony,600,400);
fill(random(255),random(255),random(255));
 }
 
 

ellipse(a,b,40,40);{              //circle #2

  
   a+=directiona;
   b+=directionb;
 
if(b>(height-25)){
   directionb= -3; 
rect(directionx,directiony,600,400);
 background(0);
fill(random(255),random(255),random(255));
 }
if(a>(width-25)){ 
    directiona= -1;
     background(0);
rect(directionx,directiony,600,400);
fill(random(255),random(255),random(255));
 }
if(b<25){
    directionb=3;
rect(directionx,directiony,600,400);
 background(0);
fill(random(255),random(255),random(255));
}
 if(a<25){
   directiona=4;
    background(0);
rect(directionx,directiony,600,400);
fill(random(255),random(255),random(255));

 }



}
ellipse(A,B,20,20);               //circle #3

  
 A+=directionA;
 B+=directionB;

 if(B>(height-25)){
 directionB= -5; 
 background(255);
 fill(random(255),random(255),random(255));
 }
 if(A>(width-25)){ 
  directionA=-21;
   background(255);
 fill(random(255),random(255),random(255));

 }
 if(B<25){
  directionB=3;
   background(255);
  fill(random(255),random(255),random(255));
}
  if(A<25){
 directionA=6;
  background(255);
fill(random(255),random(255),random(255));
}

ellipse(C,D,50,50);               //circle #3
ellipse(A,B,45,45);

if (mousePressed){
  fill(255);
} else {
  noFill();
}
 C+=directionC;
 D+=directionD;

 if(D>(height-25)){
 directionD= -5; 
 background(255);
 fill(random(255),random(255),random(255));
 }
 if(C>(width-25)){ 
  directionC=-21;
   background(255);
 fill(random(255),random(255),random(255));

 }
 if(D<25){
  directionD=3;
   background(255);
  fill(random(255),random(255),random(255));
}
  if(C<25){
 directionC=6;
  background(255);
fill(random(255),random(255),random(255));
 
 }
} 



 
 
  



