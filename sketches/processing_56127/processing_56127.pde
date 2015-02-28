
int [] numList = {
  2, 6, 18, 19, 20, 4, 7, 9, 15, 18
};

int [] funList = {
  7, 18, 25, 3, 15, 9, 7, 18, 20, 1, 44, 12, 33, 19, 21, 50, 17, 2
};

int [] bumList = {
  22, 4, 13, 12, 8, 3, 24, 25, 16, 88, 61, 20, 1, 26, 15, 11
};

void setup() {
  size(500, 400);
  textSize (24);
}

void draw() {
  text ("Length of Array 1: " + numList.length, 50, 50);
  text ("Length of Array 2: " + funList.length, 50, 80);
  text ("Length of Array 3: " + bumList.length, 50, 110);
  text ("Sum of Array 1: "+sumArray(numList), 50, 140);
  text ("Sum of Array 2: "+sumArray(funList), 50, 170);
  text ("Sum of Array 3: "+sumArray(bumList), 50, 200);
  text ("Average of Array 1: "+avgSum(numList), 50, 230);
  text ("Average of Array 2: "+avgSum(funList), 50, 260);
  text ("Average of Array 3: "+avgSum(bumList), 50, 290);
  text ("Average Sum of Array 1: "+aboveAvg(numList), 50, 320);
  text ("Average Sum of Array 1: "+aboveAvg(funList), 50, 350);
  text ("Average Sum of Array 1: "+aboveAvg(bumList), 50, 380);
}

int sumArray(int []array) {
  int sumNum=0;
  for (int i=0; i<array.length;i++) {
    sumNum+=array[i];
  }
  return sumNum;
}

float avgSum(int [] array) {
  float sumNum=0;
  for (int i=0;i<array.length;i++) {
    sumNum+=array[i];
  }
  return sumNum/array.length;
}

float aboveAvg(int[] array) {
  float sumNum = 0;
 for (int i=0; i<array.length;i++){
  if (array [i]>avgSum(array)){
   sumNum=sumNum+array [i];
  }
 }
return sumNum; 
}


