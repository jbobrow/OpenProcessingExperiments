
int [] array1 = {
  2, 14, 15, 18, 1, 8, 9, 10, 4, 20
};

void setup () {
  size (400, 600); 
  background (#FCE3E3);
  textSize ( 16);
  fill (90);
}

void draw () {
text ("Length of the array is: "+getLength(array1), 100,250);
  text ("Sum of the array: "+ getSum (array1), 100, 300);
  text ("Average of the array: " + getAverage (array1), 100, 350);
  text ("Greater sum of the array: "+ getGreaterSum (array1), 100, 400);
  noLoop ();
}

int getLength (int [] rita) {
  return rita.length;
}

int getSum (int [] rita) {
  int sum =0;
  for (int i = 0; i< rita.length; i++) {
    sum = sum + rita[i];
  }
  return sum;
}


float getAverage (int [] rita) {
  float average = 0;
  average = getSum(rita)/(rita.length*1.0);

  return average;
}


int getGreaterSum (int [] rita) {
  int greaterSum = 0;
  for (int i = 0; i< rita.length; i++) {
    if (rita[i] > getAverage(rita)) {
      greaterSum = greaterSum + rita[i];
    }
  }
  return greaterSum;
}


