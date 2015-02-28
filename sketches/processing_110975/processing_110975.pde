
/*
HW 3
Max Bowe
Visual foundation studio
*/
static final int sizeX=400, sizeY=400;
void setup(){
  size(400,400);
  background(23,52,3);
  rectMode(CORNERS);
}
void draw(){
  smooth();
  frameRate(9);
  Box boxy= new Box(0,0,sizeX,sizeY);
  boxy.boxesMove();
  name();
  
}
//randomize colors
color randomColors(){
  float R= random(1,250);
  float G =random(1,250);
  float B =random(1,250);
  return color(R,G,B);
}
//randomize location
//float randomPlace(){
//  float Rand =  random(10,280);
//  return Rand;
//}
//randomize size
float randomSize(){
  float Rand =  random(1,5);
  return Rand;
}
//makes the boxes
//void gradientBox(){
//  fill(0);
//  int w=0, x=0, y=400,z=400;
//  rect(w,x,y,z);
//  while(y>=200){
//    float rand = randomSize();//changes position of next box
//    w+=rand;
//    y-=rand;
//    x+=rand;
//    z-=rand;
//    strokeWeight(1.5);
//    stroke(randomColors());
//    rect(w,x,y,z);
//  }
//}
class Box{
 int w=0, x=0,y=sizeX,z=sizeY;
   Box(int w, int x, int y, int z){
   x=x;
   y=y;
   w=w; 
   z=z;
   }
   void boxMove(){
    float rand = randomSize();
    w+=rand;
    y-=rand;
    x+=rand;
    z-=rand;
    strokeWeight(1.5);
    stroke(randomColors());
    rect(w,x,y,z);
   
   }
  void boxesMove(){
    fill(0);
   while(y>=sizeY/2){
    boxMove();
  }
 
}
}
//creates letters
//class Letter(){
//  int x;
//  int y;
//  char letter;
//  Letter(char a; int x; int y;){
//    letter=a;
//    int x=x;
//    int y=y;
//  }
//  
//}
//class Name(){
//   Letter Letter1;
//   Letter Letter2;
//   Letter Letter3;
//
//   Name(Letter1(x,y), Letter2(x+50,y), Letter3(x+100,y){
//     
//   }
//}
void name(){
  strokeWeight(10);
  //m
  float M= mouseX;//keeps Letters in proper shape
  float D=mouseY; 
  stroke(randomColors());  line(M, D,M, D+80);
  stroke(randomColors());  line(M,D,M+30,D+80);
  stroke(randomColors());  line(M+60,D,M+30,D+80);
  stroke(randomColors());  line(M+60,D, M+60,D+80);
  //A
  
  float A= M+60;//keeps letters on same vert line
  stroke(randomColors());  line(A, M+80, A+30, M);
  stroke(randomColors());  line(A+60, M+80,A+30, M);
  stroke(randomColors());  line(A+15, M+55, A+50, M+55);
  //X
  float X= A+60;//keeps letters on same vert plane
  stroke(randomColors());  line(X, D, X+40, D+80);
  stroke(randomColors());  line(X, D+80, X+40, D); 
}



