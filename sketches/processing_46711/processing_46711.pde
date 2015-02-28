
/*

Data Visualization based on #myrandomnumber Tutorial
by Jer Thorp (blprnt@blprnt.com)
URL: http://blog.blprnt.com/blog/blprnt/your-random-numbers-getting-started-with-processing-and-data-visualization
April, 2010

I had trouble with accessing the Google spreadsheet, so this one stores the data in this file.

This file, #1, does just a dot plot of real and random data.
 
*/

int[] numbers = {1, 1, 1, 1, 2, 2, 2, 3, 4, 4, 4, 4, 5, 6, 6, 6, 6, 7, 7, 7, 8, 8, 9, 11, 12, 12, 12, 12, 13, 13, 13, 
  14, 14, 15, 15, 15, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 18, 18, 19, 19, 19, 19, 19, 20, 21, 21, 21, 23, 23, 23, 
  23, 23, 24, 25, 25, 25, 25, 26, 26, 26, 26, 27, 27, 27, 28, 28, 29, 32, 32, 32, 33, 33, 33, 35, 35, 36, 36, 37, 37, 
  37, 37, 37, 37, 37, 37, 39, 39, 39, 40, 41, 41, 42, 42, 42, 42, 42, 42, 42, 42, 42, 43, 43, 43, 43, 45, 46, 47, 47, 
  47, 47, 52, 52, 52, 53, 54, 54, 55, 55, 55, 55, 56, 57, 57, 57, 57, 57, 59, 60, 60, 61, 61, 64, 64, 64, 64, 64, 65, 
  66, 66, 66, 66, 66, 66, 67, 67, 67, 67, 67, 67, 69, 69, 69, 69, 69, 69, 71, 72, 72, 72, 72, 72, 72, 73, 73, 73, 74, 
  74, 74, 75, 76, 76, 77, 77, 77, 77, 77, 77, 77, 78, 78, 78, 79, 79, 81, 81, 81, 81, 83, 83, 83, 84, 84, 86, 87, 87, 
  87, 88, 88, 88, 89, 93, 93, 93, 94, 95, 96, 97, 97, 97, 97, 97, 97, 98, 99, 99};

int labelSpacing = 100; //Amount of space for labels on the left of the data.
size(800 + labelSpacing, 100);
background(0);
smooth();

PFont font;
font = loadFont("GillSans-14.vlw");
textFont(font);
fill(180);
text("observed", 10, height*1/3 + 3);
text("random", 10, height*2/3 + 3);

fill(255, 40);
noStroke();

//This draws the observed data
for (int i = 0; i < numbers.length; i++) {
  ellipse(numbers[i] * 8 + labelSpacing, height*1/3, 8, 8);
  }
  
//This draws random data for comparison
for (int i = 0; i < numbers.length; i++) {
  ellipse(ceil(random(0, 99)) * 8 + labelSpacing, height*2/3, 8, 8);
  }

