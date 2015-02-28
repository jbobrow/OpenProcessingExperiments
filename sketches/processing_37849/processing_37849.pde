
//Bryan Williams
//September 18, 2011
//Computational Methods
//Homework 4.2

size (480, 600);
colorMode (RGB, height);
smooth();
rectMode(CENTER);

//This is for the background
for (int A=0; A<height; A++) {
  for (int B=0; B<height; B++) {
    noSmooth();
    stroke(0, A, B);
    point(A, B);
  }
}

//Below is the code for the grid of rectangles 
for (int A = 20; A < width; A+=40) {         
  for (int B = 5; B < height; B+=40) { 
    strokeWeight(random(.4));  
    stroke (RGB, height, B);     
    rect (A, B, random(20), random(B)); //vertical rectangles
    noStroke();  
    fill (random(A), height, B, random(255));     
    rect (A, B, 40, 20); //Horizontal rectangles
  }
}


