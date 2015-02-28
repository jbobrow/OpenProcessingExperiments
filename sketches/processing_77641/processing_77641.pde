
/*Steven Ko
 suyunk@andrew.cmu.edu
 copyright ©  Steven Ko || OCT 2012 Pittsburgh PA 15213 All Rights Reserved
 */

//array of random 10 values
int[] a = {
  int(random(1, 100)), 
  int(random(1, 100)), 
  int(random(1, 100)), 
  int(random(1, 100)), 
  int(random(1, 100)), 
  int(random(1, 100)), 
  int(random(1, 100)), 
  int(random(1, 100)), 
  int(random(1, 100)), 
  int(random(1, 100))
};

int sum, avg, sumHigh;
PFont f;
float n, m;

void setup() {
  size(600, 400);
  background(0);
  translate (80, -30);

  f = loadFont ("LucidaConsole-32.vlw");
  n = 30;          //variables for text alignment
  m = 40;


  textFont (f, 22);
  text(a.length, width/2+m, height/2 );
  sum = calcSum();
  text(sum, width/2+m, height/2+n);
  avg = calcAvg();
  text(avg, width/2+m, height/2+2*n);
  sumHigh = calcGreater();
  text(sumHigh, width/2+m, height/2+3*n);

  textAlign(RIGHT);
  text("length : ", width/2+m, height/2);
  text("sum : ", width/2+m, height/2+n);
  text("average : ", width/2+m, height/2+2*n);
  text("sum of greater values : ", width/2+m, height/2+3*n);
}


int calcSum() {
  for (int i = 0; i<a.length; i++) {
    sum += a[i];
  }
  return sum;
}

int calcAvg() {
  for (int i = 0;i<a.length;i++) {
    avg = sum/a.length;
  }
  return avg;
} 

int calcGreater() {
  for (int i = 0;i<a.length;i++) {
    if (a[i]/avg > 0) {
      sumHigh += a[i];
    }
  }
  return sumHigh;
}




