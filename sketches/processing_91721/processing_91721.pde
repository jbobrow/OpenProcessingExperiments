
size(200,200);
background(37,234,12);
int cols = width;
int rows = height;

// Declare 2D array
int[][] myArray = new int[cols][rows];

// Initialize 2D array values
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    myArray[i][j] = int(random(502));
  }
}

// Draw points
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    stroke(myArray[i][j]);
    point(i,j);
  }
}

fill(242,207,174);
stroke(242,207,174);
rect(0,45,200,20);
rect(90,45,20,100);
rect(90,145,150,20);
ellipse(90,45,100,100);

stroke(2,5,54);
fill(5,55,175);
ellipse(0,190,120,135);

fill(90,92,95);
stroke(0);
rect(110,105,10,40);
rect(5,65,40,10);
rect(80,105,10,40);
rect(110,165,40,10);
rect(150,65,40,10);

fill(237,161,103);
ellipse(90,45,80,80);
fill(242,207,174);
ellipse(90,45,50,50);

fill(28,160,11);
ellipse(190,25,30,30);
ellipse(167,14,20,20);
ellipse(151,32,30,30);
ellipse(147,112,30,30);
ellipse(167,124,20,20);
