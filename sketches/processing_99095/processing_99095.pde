
import java.util.*;
//fields
int[] arr = new int[16];
ArrayList <Integer> arr2 = new ArrayList <Integer>();
int count = 0;
int arr2size = 0;
int q = 0;
boolean done = false;
int i = 0;

void setup(){
  size(850,850);
  background(255,0,0);
  frameRate(3);
  for(int i = 0; i < 16; i++){
  arr2.add(i,(50*(i+1)));
  }
  arr2size = arr2.size();
  for(int j = 0; j < arr2size; j++){
    int a = (int)(random(arr2.size()));
    arr[j] = arr2.get(a);
    arr2.remove(a);
  }
}
void draw(){
  if (done == true) {
    background(0, 255, 0);
  }
  else {
    background(255, 0, 0);
    fill(0);
    line(50+50*i, 0, 50+50*i, 855);
  }
  rectMode(CORNERS);
  fill(0, 0, (int) arr[0]/4 + 55);
  rect(25, 0, 75, arr[0]);
  fill(0, 0, (int) arr[1]/4 + 55);
  rect(75, 0, 125, arr[1]);
  fill(0, 0, (int) arr[2]/4 + 55);
  rect(125, 0, 175, arr[2]);
  fill(0, 0, (int) arr[3]/4 + 55);
  rect(175, 0, 225, arr[3]);
  fill(0, 0, (int) arr[4]/4 + 55);
  rect(225, 0, 275, arr[4]);
  fill(0, 0, (int) arr[5]/4 + 55);
  rect(275, 0, 325, arr[5]);
  fill(0, 0, (int) arr[6]/4 + 55);
  rect(325, 0, 375, arr[6]);
  fill(0, 0, (int) arr[7]/4 + 55);
  rect(375, 0, 425, arr[7]);
  fill(0, 0, (int) arr[8]/4 + 55);
  rect(425, 0, 475, arr[8]);
  fill(0, 0, (int) arr[9]/4 + 55);
  rect(475, 0, 525, arr[9]);
  fill(0, 0, (int) arr[10]/4 + 55);
  rect(525, 0, 575, arr[10]);
  fill(0, 0, (int) arr[11]/4 + 55);
  rect(575, 0, 625, arr[11]);
  fill(0, 0, (int) arr[12]/4 + 55);
  rect(625, 0, 675, arr[12]);
  fill(0, 0, (int) arr[13]/4 + 55);
  rect(675, 0, 725, arr[13]);
  fill(0, 0, (int) arr[14]/4 + 55);
  rect(725, 0, 775, arr[14]);
  fill(0, 0, (int) arr[15]/4 + 55);
  rect(775, 0, 825, arr[15]);
  q++;
  for(i = 0; i < arr.length-1; i++){
    if(arr[i] > arr[i+1]){
     int temp = arr[i];
     arr[i] = arr[i+1];
     arr[i+1] = temp;  
     count++;
    }
    if(count == 1){
      count = 0; 
      return;
    }
  }
  if(q >= 16){
    done = true;
  }
}

