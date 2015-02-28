

int[] a = {
  4, 5, 6, 7, 8, 9, 10, 11, 12, 13
};
int max;
int m;
int loop = 1;


void setup() {
  size(500, 500);
  rect(100, 100, 20, 20);
  background(255);
  //a ;
  int x = (int)random(15, 30);
  for (int i = 0; i < x; i++) {
    int n1 = (int)random(a.length);
    int n2 = (int)random(a.length);
    int t = a[n1];
    a[n1] = a[n2];
    a[n2] = t;
  }



  frameRate(1.5);
  m = a.length;
}


void draw() {
  if (m>0) {



    if (loop == 1) {
      max = 0;
      for (int i = 1; i < m; i++) {
        if (a[i] > a[max]) {
          max = i;
        }
      }



      if (max == m-1) {
        loop=0;
        m--;
      }else if(max == 0){
        loop = 2;
      }
      else
        flip(max+1);
    }
    if (loop == 2) {
      //lag();
      flip(m);

      m--;
    }
    loop++;
    if (loop == 3)
    loop = 1;
    display();
  }
  else{
    fill(0);
    textSize(32);
    text("DONE", 200, 450);
  }
  
  




  
}






void flip(int n) {
  int[] a2 = new int[n];
  for (int i = 0; i < n; i++) {
    a2[n-i-1] = a[i];
  }

  for (int i = 0; i < n; i++) {
    a[i] = a2[i];
  }
}


void display() {
  background(255);
  fill(255, 255, 0);
  rectMode(CENTER);
  for (int i = 0; i < a.length; i++) {
    rect(250, 100+i*30, a[i]*30, 15);
  }
}

void lag() {
  for (long i = 0; i < (long)30000000*100; i++) {
    float x = PI*PI/PI+PI;
    x = x*x;
    x = x/2;
    x = x+1;
  }
}



