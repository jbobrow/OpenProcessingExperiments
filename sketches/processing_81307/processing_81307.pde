
/*
title: A2‐05
 description: Create a function that returns the smallest value in
 a bi－dimensional array of integers.  Give it the following
 signature:  int minimum(int[][] matrix);  
 Demonstrate its use in your code. 
 created: September 28, 2012
 by: Xiaolan Wang xiaolanw@sfu.ca
 */

/*
the whole big grass lawn is composed by hNum*vNum pieces of small grass lawns
 these lawns have different humidity
 */
int hNum; 
int vNum;
int[][] humidity; 

//initialize sketch
void setup() {
  //set sketch window size and background color
  size(500, 500);
  background(255);

  //turn off shape stroke rendering
  noStroke();

  //the total quantity of the small lawns is 500 (10*50)
  hNum = 10;
  vNum = 5;
  int[][] humidity = new int[hNum][vNum];

  /*
  randomly initialize the humidity of each small lawn,
   color them green , the degree of green depends on the lawn's humidity
   */
  for (int i=0;i<humidity.length;i++) {
    for (int j=0;j<humidity[i].length;j++) {
      humidity[i][j] = int(random(150, 255)); //randomly assign a value(which is between 150 and 255) to each lawn's humidity
      fill(80, humidity[i][j], 0); //according to the humidity, color each lawn green in different degree
      rect(i*50, j*100, 50, 100); //draw small lawn
    }
  }

  /*
 select the driest lawn(whose humidity is least), if its humidity is less than 200,
   water the lawn. here means color it blue to show that the lawn is being watered.
   */
  if (mininum(humidity)<200) {
    for (int i=0;i<humidity.length;i++) {
      for (int j=0;j<humidity[i].length;j++) {
        if (humidity[i][j]==mininum(humidity)) { //find the lawn whose humidity is least 
          fill(0, 0, 200);   //color the lawn blue, means it is being watered
          rect(i*50, j*100, 50, 100);
        }
      }
    }
  }
}

/*
mininum() function returns the smallest value of a bi－dimensional 
 array of integers
 */
int mininum(int[][] matrix) {
  int i, j, mini;     
  mini = matrix[0][0]; //initialize 'mini' by assigning the value of matrix[0][0] to it
  for ( i=0; i<matrix.length; i++) {    
    for ( j=0; j<matrix[i].length; j++) {
      if (mini > matrix[i][j]) { //compare each value in the matrix to mini, 
                                 //if it is less than mini, 
        mini = matrix[i][j];     //update mini by assigning the value to it
      }
    }
  }
  return mini; //return the value of mini
}



