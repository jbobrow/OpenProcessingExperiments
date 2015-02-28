
//Ashley Wong amwong
//Copyright Pittsburgh 2012

int [] n={1,1,2,3,5,8,13,21,34,55};

void setup() {
  size (600,400);
  background(25,59,150);
  fill(175,120,0);
  textSize(20);
}

void draw() {

   text("length of array: " + n.length, width/5, height/5);
   text("sum of entries: " + getSum(), width/5, 2*height/5);
   text("average of entries: " + getAverage(), width/5, 3*height/5);
   text("sum of entries greater than average: "+getGreaterSum(), width/5, 4*height/5);
}

int getSum() {
  int sum=0;
  for(int i=0; i<n.length; i++) {
    sum+= n[i];
  }
  return sum;
}

int getAverage() {
  int average=0;
  for(int i=0;i<n.length;i++) {
    average=getSum()/n.length;
  }
  return average;
}

int getGreaterSum() {
  int gSum=0;
   for(int i=0;i<n.length;i++) {
     if(n[i]>getAverage()) {
       gSum+=n[i];
     }
   }
   return gSum;
}
