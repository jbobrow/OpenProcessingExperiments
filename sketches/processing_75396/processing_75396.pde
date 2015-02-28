
//Dakotah Konicek    dkonicek
//Copyright © 2012 Dakotah Konicek
//HW9
//

int [] values = {4,89,57,89,38,867,174,39,46,2111,77,48};

void setup() {
 size (400,400);
fill(0);
text("Length of array:" + values.length, 150,20);
text("Sum of values in array:" + getSum(),150,35);
text("Average of values in array:" + getAverage(), 150, 50);
text("Sum of values greater than average:" + getSumAverage(),150,65);
}



int getSumAverage() {
 float a = getAverage();
  int sum=0;
   for ( int i=0; i<values.length; i++) {
   if (values [i]>a){
     sum+=values [i];
  }}
  return sum;
}

int getSum() {
  int sum=0;
  for (int i=0; i<values.length; i++) {
    sum+=values[i];
  }
  return sum;
}

float getAverage() {
  float sum = 0;
  for ( int i=0; i<values.length; i++) {
    sum+=values [i];
  }
  return sum/values.length;
}


