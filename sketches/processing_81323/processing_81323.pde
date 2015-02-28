
/*
Program Title: A2-5
 Program Description: Create a function that returns the smallest value in a bi-dimensional 
 array of integers. Give it the following signature: int minimum(int[][]matrix); 
 By Amber Choo, October 4th, 2012
 Comments: This array generates random numbers between 10-100. The smallest number is returned and drawn. 
 This was way too hard. The other assignments were alright, but this one almost made me cry!!
 */

void setup() {
background(minimum); //fill color determined by the smallest number drawn from array! ohoho
size(300,280); //300x280 pixels
PFont f = createFont("Impact",100,true); //set the font characteristics for all numbers
textFont(f,100); //font size is 100pt
fill(255); //white
text(minimum,width/2,height/2+30); //prints the smallest number super big on the screen
textFont(f,25); //font size is now 25pt
fill(190); //light grey
//print all of the generated numbers in the array:
text(matrix[0][0],30,30);
text(matrix[0][1],30,60);
text(matrix[0][2],30,90);
text(matrix[1][0],30,120);
text(matrix[1][1],30,150);
text(matrix[1][2],30,180);
text(matrix[2][0],30,210);
text(matrix[2][1],30,240);
text(matrix[2][2],30,270);
}

float a = random(10,100); //creates value (1 of 9) for array
float b = random(10,100); 
float c = random(10,100);
float d = random(10,100); //creates value (4 of 9) for array
float e = random(10,100); 
float f = random(10,100);
float g = random(10,100); //creates value (7 of 9) for array
float h = random(10,100); 
float i = random(10,100);
int j = int(a);  //converts value (1 of 9) for array to int format
int k = int(b); 
int l = int(c); 
int m = int(d);  //converts value (4 of 9) for array to int format
int n = int(e); 
int o = int(f); 
int p = int(g);  //converts value (7 of 9) for array to int format
int q = int(h); 
int r = int(i);  


int[][] matrix = {{j,k,l},{m,n,o},{p,q,r}}; //put the random values we generated above into the bi-dimensional array matrix
int minimum=minimum(matrix); //minimum is declared and converted from int to int[][]
int minimum(int[][] matrix) { //the signature. we will use minimum to call the smallest value out from matrix
  int low = 100; //declare int low, value = 100
  for (int z = 0; z < matrix.length; z++) { //for loop will scan all rows and columns (z,y)
    for (int y = 0; y < matrix.length; y++) {  
      if (matrix[z][y] < low) { //if a value in the array is less than int low,
        low = matrix[z][y]; //have int low equal it's value! 
      }
      println("Generated Number: "+matrix[z][y]); //this will print all the numbers the array generates for reference in the output
    }
  } println("Smallest number: "+low); //output will also reveal the smallest number.
 return low; //the smallest number is returned. - we can now call minimum to see this value
} 


