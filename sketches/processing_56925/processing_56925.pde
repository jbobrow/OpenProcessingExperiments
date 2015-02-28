
// HW #11, Jim Roberts' CFA-757
// Carnegie Mellon University
// Zoe Lu copyright Spring 2012, Pittsburgh PA 15213

final int MAX=20;

//arrays
float [] posX;
float [] posY;
float [] deltaX;
float [] deltaY;
float [] wd;
float [] ht;
color [] colorList;

void setup(){
  size(400,400);
  smooth();
  //set size of each array and initialize each array
  posX = new float[MAX];
  initArrays(posX,0,width);
  posY = new float[MAX];
  initArrays(posY,0,height);
  deltaX = new float[MAX];
  initArrays(deltaX,0,width*.01);
  deltaY = new float[MAX];
  initArrays(deltaY,0,height*.01);
  wd = new float[MAX];
  initArrays(wd,width*.05,width*.2);
  ht = new float[MAX];
  initArrays(ht,height*.02,height*.3);

  colorList = new color[MAX];
  initColor(colorList);

//double check arrays
/*
println(posX);
println(posY);
println(deltaX);
println(deltaY);
println(wd);
println(ht);
println(colorList);
*/

}

void draw(){
  prepWindow();
  drawRect();
//  drawLine();
  moveRect();
}

void drawRect(){
  for(int i=0;i<MAX;i++){
    fill(colorList[i]);
    stroke(255);
    rect(posX[i],posY[i],wd[i],ht[i]);
  }
}

void drawLine(){
  for(int i=1;i<MAX;i++){
//    fill(colorList[i]);
    stroke(colorList[i]);
    line(posX[i-1],posY[i-1],posX[i],posY[i]);
  }
}

void moveRect(){
  for(int i=0;i<MAX;i++){
    posX[i]+=deltaX[i];
    posY[i]+=deltaY[i];
    if(posX[i]>width)
      deltaX[i]*=-1;
    if(posY[i]>height)
      deltaY[i]*=-1;
    if(posX[i]<0)
      deltaX[i]*=-1;
    if(posY[i]<0)
      deltaY[i]*=-1;      
  }
}

void prepWindow(){
  for(int i=0;i<frameCount;i++){
    float c=noise(i/1000)*frameRate*5;
    background(c,180);
//    println(c);
  }
}

void initArrays(float [] myArray, float minVal, float maxVal){
  for(int i=0;i<myArray.length;i++){
    myArray[i]=random(minVal, maxVal);
  }
}

void initColor(color [] myColor){
  for(int i=0;i<myColor.length;i++){
    myColor[i]=color(random(93,255),random(93,255),random(93,255));
  }
}
