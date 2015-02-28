
/*Project 2C Exercise
Code by Jennifer Nowack
York University: 211448347
YSDN-1006*/

//first line 
float x1 = 10;
float x2 = 70;
float x3 = 130;
float x4 = 190;
//second line
float x11 = 10;
float x12 = 70;
float x13 = 130;
float x14 = 190;
//third line
float x21 = 10;
float x22 = 70;
float x23 = 130;
float x24 = 190;

void setup() {
  size(180, 180);
  noStroke();
}

void draw() {
  background (40, 86, 32);
  
  fill (82, 10, 25);
  //first row circle1
  ellipse (x1, 30, 50, 50); 
  x1 = x1+1;
  if (x1>200){
    x1=-40;
   }  
  //first row circel2 
  ellipse (x2, 30, 50, 50);
   x2 = x2+1;
  if (x2>200){
    x2=-40;
   }  
  //first row circle3
  ellipse (x3, 30, 50, 50);
  x3 = x3+1;
  if (x3>200){
  x3=-40;
  }  
  //first row circle4
  ellipse (x4, 30, 50, 50);
  x4 = x4+1;
  if (x4>200){
    x4=-40;
  }
  
  fill (50, 10, 60);
  //second row circle1
  ellipse (x11, 90, 50, 50); 
  x11 = x11+2;
  if (x11>200){
    x11=-40;
   } 
  //second row circle2
  ellipse (x12, 90, 50, 50);
   x12 = x12+2;
  if (x12>200){
    x12=-40;
   }  
  //second row circle3
  ellipse (x13, 90, 50, 50);
   x13 = x13+2;
  if (x13>200){
    x13=-40;
   }
  //second row circle4
  ellipse (x14, 90, 50, 50);
   x14 = x14+2;
  if (x14>200){
    x14=-40;
   }
   
   fill (100, 40, 70);
   //third row circle1
   ellipse (x21, 150, 50, 50); 
  x21 = x21+0.5;
  if (x21>200){
    x21=-40;
   }
   //third row circle2
   ellipse (x22, 150, 50, 50); 
  x22 = x22+0.5;
  if (x22>200){
    x22=-40;
   }
   //third row circle3
   ellipse (x23, 150, 50, 50); 
  x23 = x23+0.5;
  if (x23>200){
    x23=-40;
   }
   //third row circle4
   ellipse (x24, 150, 50, 50); 
  x24 = x24+0.5;
  if (x24>200){
    x24=-40;
   }
}

 


