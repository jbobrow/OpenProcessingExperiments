
/*
Jennifer Kaye
jenniferkaye7@gmail.com
Copyright 2011
Parsons MFA D+T Bootcamp
Homework 8/8/11: Gradient
*/

void setup () {
  frameRate (10);
  noLoop ();
  size (256, 256);  
}

void draw () {
for (int i = 0; i < 256; i = i+1) {
  line(0, i, 256, i);
  stroke (i, 0, 0);
  }    
}

