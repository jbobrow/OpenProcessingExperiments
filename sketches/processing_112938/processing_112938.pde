
/*
bump de bump
Max Bowe
Visual foundation studio
*/
Timer time;
static final int sizeX=400, sizeY=400;
void setup(){
  size(400,400);
  background(23,52,3);
  rectMode(CORNERS);
  time= new Timer(2000);
  time.start();
}
void draw(){
  smooth();
  frameRate(9);
  Box boxy =new Box(0,0,sizeX,sizeY);
  boxy.boxesMove();
  name(giveName('n','y','u'));
 if ((mouseX<20||mouseX>380)||(mouseY<20||mouseY>380)){
  explosion(); 
  }
  if (time.isFinished()){
    explosion();
    explosion();
    explosion();
    explosion();
    time.start();    
  }
 
 
}
//randomize colors
color randomColors(){
  float R= random(1,250);
  float G =random(1,250);
  float B =random(1,250);
  return color(R,G,B);
}
char[] giveName(char a, char b, char c){
  char[] nameArray= new char[3];
  nameArray[0]=a;
  nameArray[1]=b;
  nameArray[2]=c;
  return nameArray;
}
//randomize location
float randomPlace(){
  float Rand =  random(10,390);
  return Rand;
}
//randomize size
float randomSize(){
  float Rand =  random(1,5);
  return Rand;
}
//makes the boxes
//void gradientBox(){
//  Colors(0);
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
void explosion(){
  frameRate(7);
  strokeWeight(10);
  stroke(randomColors());
  float x=randomPlace();
  float y= randomPlace();
  ellipseMode(CORNERS);
  
  strokeWeight(4);
  ellipse(x-30,y-30,x+30,y+30);
  strokeWeight(5);
  line(x,y,x+20,y+20);
  line(x,y,x-20,y+20);
  line(x,y,x-20,y-20);
  line(x,y,x+20,y-20);
  line(x-20,y,x+20,y);
  line(x,y-20,x,y+20);
}
void name(char[] nameArray){
  strokeWeight(10);
  //m
  float x= mouseX;//keeps Letters in proper shape
  float y=mouseY; 
  for(int i=0; i<nameArray.length; i++){
   if(nameArray[i]=='a'){
        //A
    stroke(randomColors()); ; line(x, y+80, x+30, y);
    stroke(randomColors()); ; line(x+60, y+80,x+30, y);
    stroke(randomColors()); ; line(x+10, y+55, x+50, y+55);
    }
    else if(nameArray[i]=='b'){
    //B
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x+60, y, x+60, y+80);
    stroke(randomColors()); ; line(x,y,x+60,y);
    stroke(randomColors()); ; line(x,y+40,x+60,y+40);
    stroke(randomColors()); ; line(x,y+80,x+60,y+80);
  }
  else if(nameArray[i]=='c'){
   //C
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x,y+80,x+60,y+80);
    stroke(randomColors()); ; line(x,y,x+60,y);
  }
  else if(nameArray[i]=='d'){
  //D
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x+60, y+20, x+60, y+60);  
    stroke(randomColors()); ; line(x,y+80, x+60,y+60);
    stroke(randomColors()); ; line(x,y,x+60,y+20);
  }
  else if(nameArray[i]=='e'){
  //E
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x,y,x+60,y);
    stroke(randomColors()); ; line(x,y+40,x+60,y+40);
    stroke(randomColors()); ; line(x,y+80,x+60,y+80);
  }
  else if(nameArray[i]=='f'){
  //F
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x,y,x+60,y);
    stroke(randomColors()); ; line(x,y+40,x+60,y+40);
  }
  else if(nameArray[i]=='g'){
  //G
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x+60, y+40, x+60, y+80);
    stroke(randomColors()); ; line(x,y+80, x+60,y+80);
    stroke(randomColors()); ; line(x,y,x+60,y);
    stroke(randomColors()); ; line(x+30,y+40,x+60,y+40);
  }
  else if(nameArray[i]=='h'){
  //H
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x+60, y, x+60, y+80);
    stroke(randomColors()); ; line(x,y+40,x+60,y+40);
  }
  else if(nameArray[i]=='i'){
  //I
    stroke(randomColors()); ; line(x,y+80,x+60,y+80);
    stroke(randomColors()); ; line(x,y,x+60,y);
    stroke(randomColors()); ; line(x+30,y,x+30,y+80);
  }
  else if(nameArray[i]=='j'){
  //J
    stroke(randomColors()); ; line(x,y+80,x+30,y+80);
    stroke(randomColors()); ; line(x+30,y,x+30,y+80);
    stroke(randomColors()); ; line(x,y,x+60,y);
  }
  else if(nameArray[i]=='k'){
  //K
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x,y+40,x+60,y);
    stroke(randomColors()); ; line(x,y+40,x+60,y+80);
  }
  else if(nameArray[i]=='l'){
  //L
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x,y+80,x+60,y+80);
  }
  else if(nameArray[i]=='m'){
  //M
    stroke(randomColors()); ; line(x, y,x, y+80);
    stroke(randomColors()); ; line(x,y,x+30,y+80);
    stroke(randomColors()); ; line(x+60,y,x+30,y+80);
    stroke(randomColors()); ; line(x+60,y, x+60,y+80);
  }
  else if(nameArray[i]=='n'){
  //N
    stroke(randomColors()); ; line(x, y,x, y+80);
    stroke(randomColors()); ; line(x,y,x+60,y+80);
    stroke(randomColors()); ; line(x+60,y,x+60,y+80);
  }
 else if(nameArray[i]=='o'){
 //O
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x+60, y, x+60, y+80);
    stroke(randomColors()); ; line(x,y+80, x+60,y+80);
    stroke(randomColors()); ; line(x,y,x+60,y);
 }
 else if(nameArray[i]=='p'){
 //P
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x+60, y, x+60, y+40);
    stroke(randomColors()); ; line(x,y,x+60,y);
    stroke(randomColors()); ; line(x,y+40,x+60,y+40);
 }
  else if(nameArray[i]=='q'){
  //Q
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x+60, y, x+60, y+80);
    stroke(randomColors()); ; line(x,y+80, x+60,y+80);
    stroke(randomColors()); ; line(x,y,x+60,y);
    stroke(randomColors()); ; line(x+30,y+40,x+60,y+80);
  }
  else if(nameArray[i]=='r'){
  //R
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x+60, y, x+60, y+40);
    stroke(randomColors()); ; line(x,y,x+60,y);
    stroke(randomColors()); ; line(x,y+40,x+60,y+40);
    stroke(randomColors()); ; line(x,y+40,x+60,y+80);
  }
  else if(nameArray[i]=='s'){
  //S
    stroke(randomColors()); ; line(x,y, x, y+40);
    stroke(randomColors()); ; line(x+60, y+40, x+60, y+80);
    stroke(randomColors()); ; line(x,y,x+60,y);
    stroke(randomColors()); ; line(x,y+40,x+60,y+40);
    stroke(randomColors()); ; line(x,y+80,x+60,y+80);
  }
  else if(nameArray[i]=='t'){
  //T
    stroke(randomColors()); ; line(x+30,y,x+30,y+80);
    stroke(randomColors()); ; line(x,y,x+60,y);
  }
  else if(nameArray[i]=='u'){
  //U
    stroke(randomColors()); ; line(x,y, x, y+80);
    stroke(randomColors()); ; line(x+60, y, x+60, y+80);
    stroke(randomColors()); ; line(x,y+80, x+60,y+80);
  }
  else if(nameArray[i]=='v'){
  //V
    stroke(randomColors()); ; line(x,y, x+30, y+80);
    stroke(randomColors()); ; line(x+60, y, x+30, y+80);
  }
  else if(nameArray[i]=='w'){
  //W
    stroke(randomColors()); ; line(x, y,x, y+80);
    stroke(randomColors()); ; line(x+30,y+20,x,y+80);
    stroke(randomColors()); ; line(x+30,y+20,x+60,y+80);
    stroke(randomColors()); ; line(x+60,y, x+60,y+80);
  }
 else if(nameArray[i]=='x'){
  //X
    stroke(randomColors()); ; line(x, y, x+40, y+80);
    stroke(randomColors()); ; line(x, y+80, x+40, y); 
 }
  else if(nameArray[i]=='y'){
  //Y
    stroke(randomColors()); ; line(x,y,x+30,y+40);
    stroke(randomColors()); ; line(x+70,y,x+30,y+40);
    stroke(randomColors()); ; line(x+30,y+40,x+30,y+80);
  }
  else if(nameArray[i]=='z'){
  //Z
    stroke(randomColors()); ; line(x,y,x+60,y);
    stroke(randomColors()); ; line(x,y+80,x+60,y+80);
    stroke(randomColors()); ; line(x,y+80,x+60,y);
    } 
    x+=80;
  }
//  stroke(randomColors());  stroke(randomColors()); ; line(M, D,M, D+80);
//  stroke(randomColors());  stroke(randomColors()); ; line(M,D,M+30,D+80);
//  stroke(randomColors());  stroke(randomColors()); ; line(M+60,D,M+30,D+80);
//  stroke(randomColors());  stroke(randomColors()); ; line(M+60,D, M+60,D+80);
//  //A
//  
//  float A= M+60;//keeps letters on same vert line
//  stroke(randomColors());  stroke(randomColors()); ; line(A, M+80, A+30, M);
//  stroke(randomColors());  line(A+60, M+80,A+30, M);
//  stroke(randomColors());  line(A+15, M+55, A+50, M+55);
//  //X
//  float X= A+60;//keeps letters on same vert plane
//  stroke(randomColors());  line(X, D, X+40, D+80);
//  stroke(randomColors());  line(X, D+80, X+40, D); 
}

class Timer {
 int time; 
 int limit;
 
 Timer(int timeLimit){
   limit=timeLimit; 
  }
  void start(){
   time=millis(); 
  }
  boolean isFinished() {
  int passedTime=millis()-time;
  if (passedTime > limit){
      return true;
     } 
  else{
     return false;
   }
  }
}
