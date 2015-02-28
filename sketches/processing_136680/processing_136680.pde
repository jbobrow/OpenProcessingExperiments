
////
// LAB: Arrays, Simple Sketch
// Patrick J O'Donnel
// Feb 27, 2013
///

void setup() {
  size (400,300);
  background(0);
  frameRate(1);
  noLoop();
  
}

//declare and create array as if a "global" variable
int [] counting = new int [11];
int [] evens = new int [10];
int [] odds = new int [10];
int [] fibon = new int [10];
char [] wow = new char[20];

void draw () {
  
//initilize elements manually
counting [0] = 1;
counting [1] = 2;
counting [2] = 3;
counting [3] = 4;
counting [4] = 5;
counting [5] = 6;
counting [6] = 7;
counting [7] = 8;
counting [8] = 9;
counting [9] = 10;
counting [10] = 11;

//initialize elements manually, in a list
int [] evens = {0, 2, 4, 6, 8, 10, 12, 14, 16, 18};


  //initalize elements with FOR LOOP, and array operation
  for (int n = 0; n < 10; n++) {
    odds [n] = n*2+1;
  }
  
  //initalize elements with WHILE LOOP, and array operations
  fibon [0] = 0;
  fibon [1] = 1;
  
  int b = 2;
  while (b < 10) {
    fibon [b] = fibon [b-1] + fibon [b-2];
    b++;
  }

  
//print lines for array values
  for (int a = 0; a < 10; a++) {
  println( "counting ["+a+"] = " + counting[a] + "  evens["+a+"] = " + evens [a] + "  odds ["+a+"] = " + odds[a] + "  fibonaci ["+a+"] = " + fibon [a]);
  }
 
    text("WOW, ARRAYS!", width/2, height/2);


}
