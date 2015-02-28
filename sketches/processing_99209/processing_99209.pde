
import sprites.utils.*;
import sprites.maths.*;
import sprites.*;

import java.lang.Math;

int listSize = 200;
int[] list = new int[listSize];
int[] sList = new int[listSize];
int[] qList = new int[listSize];
int[] iList = new int[listSize];
//selection sort variables
int sCheck = 0;
int sPos = 0;
int sMin;
//insertion sort variables
int iNext = 2;
int iIns = 1;
//bogosort variables?
//quicksort variables
int qPivot = -1;
int qLMark;
int qRMark;
int[][] qSubs = new int[(int)(log(listSize)/log(2))+1][];


void setup() {
  size(1230,460);
  background(0);
  frameRate(15);
  noSmooth();
  textAlign(CENTER,CENTER);
  for(int i=0; i<listSize; i++){
    sList[i] = (int)random(0,listSize*2);
    qList[i] = sList[i];
    iList[i] = sList[i];
  }
  //System.out.println(qSubs[1].length + ";" + qSubs.length);
}

void draw() {
  //System.out.println(frameRate);
  background(0);
  stroke(255);
  text("SelectionSort(above) versus QuickSort(below) Each step of selection sort corresponds to each step of quicksort.",width/2+20,445);
  sSort();
  qSort();
  iSort();
}

void sSort() {
  stroke(255);
  for(int i=0; i<listSize; i++)
    line(i*3+11,425,i*3+11,425-sList[i]);
    
  if(sPos<listSize-1){
    stroke(255,0,0);
    pointer(sMin*3+11,428);
    line(sMin*3+11,425,sMin*3+11,425-sList[sMin]);
    
    stroke(255,255,0);
    pointer(sCheck*3+11,428);
    line(sPos*3+11,425-sList[sMin],listSize*3+11,425-sList[sMin]);
    
    if(sList[sMin] > sList[sCheck])
      sMin = sCheck;
      
    if(sCheck >= listSize-1){
      int temp = sList[sPos];
      sList[sPos] = sList[sMin];
      sList[sMin] = temp;
      sPos++;
      sCheck = sPos;
      sMin = sPos;
    }
    
    sCheck++;
  }
}

void qSort() {
  stroke(255);
  for(int i=0; i<listSize; i++)
    line(i*3+11,875,i*3+11,875-qList[i]);
  if (qPivot == -1)
    qPivot = findPivot(qList);
  //System.out.println(qPivot);
  
  stroke(255,0,0);
  line(qPivot*3+11,875,qPivot*3+11,875-qList[qPivot]);
  line((int)(qList.length/2)*3+11,875,(int)(qList.length/2)*3+11,875-qList[(int)(qList.length/2)]);
  
}

void iSort(){
  stroke(255);
  for(int i=0; i<listSize; i++)
    line(i*3+11+width/2,425,i*3+11+width/2,425-iList[i]);
    
  if(iNext<=listSize){
    stroke(255,0,0);
    pointer(iIns*3+11+width/2,428);
    line(iIns*3+11+width/2,425,iIns*3+11+width/2,425-iList[iIns]);
    
    stroke(255,255,0);
    line(iIns*3+11+width/2,425-iList[iIns],11+width/2,425-iList[iIns]);
    
    if(iIns>0 && iList[iIns]<iList[iIns-1]){
      int temp = iList[iIns];
      iList[iIns] = iList[iIns-1];
      iList[iIns-1] = temp;
      iIns--;
    }else{
      iIns = iNext;
      iNext++;
    }
  }
}

void pointer(int x, int y){ //draw a pointer at specified location
  line(x,y,x,y+5);
  line(x-1,y+1,x-1,y+5);
  line(x+1,y+1,x+1,y+5);
  line(x-2,y+2,x-2,y+5); 
  line(x+2,y+2,x+2,y+5);
}

int findPivot(int[] xList){
  if(xList[0]<=max(xList[xList.length-1],xList[(int)(xList.length/2)])
  && xList[0]>=min(xList[xList.length-1],xList[(int)(xList.length/2)]))
    return 0;
  else if(xList[xList.length-1]<=max(xList[0],xList[(int)(xList.length/2)])
  && xList[xList.length-1]>=min(xList[0],xList[(int)(xList.length/2)]))
    return xList.length-1;
  else
    return (int)(xList.length/2);
}

int[] copyList(int[] list, int start, int end){
  return list;
}

void keyPressed() {
  if (key == CODED && keyCode == UP)
    frameRate(frameRate*2);
  if (key == CODED && keyCode == DOWN)
    frameRate(frameRate/2);
}


