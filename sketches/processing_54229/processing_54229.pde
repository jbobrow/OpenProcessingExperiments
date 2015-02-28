
int [] numList = {
  2, 6, 18, 19, 20, 4, 7, 9, 15, 18
};
void setup () {
  size(400, 400);
}

void draw () {
  textSize(24);
  text ("Length of array:", 25, 50);
  text (numList.length, 25, 75);
  text ("Sum of vaulues in array:", 25, 125);
  text (sumNumYum (), 25, 150);
  text ("Average of vaulues in array:", 25, 200);
  text (avgSumNumYum(), 25, 225);
  text ("Sum of num. about average:", 25,275);
  text (aboveAvgSumNumYum(),25,300);
}

int sumNumYum() {
  int sumNum=0;
  for (int i=0;i<numList.length;i++) {
    sumNum+=numList[i];
  }
  return sumNum;
}

float avgSumNumYum() {
  float sumNum=0;
  for (int i=0;i<numList.length;i++) {
    sumNum+=numList[i];
  }
  return sumNum/numList.length;
}

float aboveAvgSumNumYum() {
  float sumNum = 0;
 for (int i=0; i<numList.length;i++){
  if (numList [i]>avgSumNumYum()){
   sumNum=sumNum+numList [i];
  }
 }
return sumNum; 
}


