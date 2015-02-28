
void setup(){
  size(400,400);
  background(23,52,3);
  rectMode(CORNERS);
}
void draw(){
  gradientBox();
  name();
  smooth();
  frameRate(8);
}
//randomize colors
color randomColors(){
  float R= random(1,250);
  float G =random(1,250);
  float B =random(1,250);
  return color(R,G,B);
}
//randomize location
float randomPlace(){
  float Rand =  random(10,270);
  return Rand;
}
//randomize size
float randomSize(){
  float Rand =  random(1,5);
  return Rand;
}
//makes the boxes
void gradientBox(){
  fill(0);
  int w=0, x=0, y=400,z=400;
  rect(w,x,y,z);
  while(y>=200){
    float rand = randomSize();//changes position of next box
    w+=rand;
    y-=rand;
    x+=rand;
    z-=rand;
    stroke(randomColors());
    if (x>300){
      exit();
    }
    else{
    rect(w,x,y,z);
    } 
  }
}
//creates letters
void name(){
  //m
  stroke(randomColors());
  strokeWeight(10);
  float M= randomPlace();//keeps Letters in proper shape
  line(M, M+50,M, M+130);
  line(M,M+50,M+30,M+130);
  line(M+60,M+50,M+30,M+130);
  line(M+60, M+50, M+60,M+130);
  //A
  stroke(randomColors());
  float A= randomPlace();//keeps Letters in proper shape
  line(A+20, A+80, A+50, A);
  line(A+80, A+80,A+50, A);
  line(A+35, A+55, A+70, A+55);
  //X
  stroke(randomColors());
  float X= randomPlace();//keeps Letters in proper shape
  line(X+90, X, X+130, X+80);
  line(X+90, X+80, X+130, X); 
}
