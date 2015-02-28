
// crashCourse processing by Corneel Cannaerts 2014
// loops 

// loops are blocks of code between {} that get repeated a number of times

void setup() {  
  size(600, 400);
}

void draw() {
  background(255);

  //for loop can be read as:
  //make a variable i and asign it value 0 (init)
  //we keep repeating the loop as long as i is smaller than 50 (test)
  //every time we repeat we add one to i (update)

  for (int i=0; i<50; i++) {
    //i can be used inside the loop
    float  x = 50 + i*10;
    line(x, 50, x, 350);
  }
  
  /*
  //a while loop repeats as long as a certain condition is true
  int j =0;
  while (j <50) {
    float  x = 50 + j*10;
    line(x, 50, x, 350);
    j++;
  }
  */
}



