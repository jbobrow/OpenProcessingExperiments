
// Created by Tim Tai
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// The Gropius House by Walter Gropius

int a = 150;
int b = 200;  
int c = 15; 
int d = 70;
int e = 140;  
float f = 32.5;  
int g = 50;  
float h = 82.5;
int i = 55;  
int j = 45;
float k = 67.5;  
int l = 75;
int m = 5;
int n = 85; 

float grid = 150;

void setup () {

  stroke(0);
  size(600, 600);
  background(255);
  smooth();
  frameRate (15);
}


void draw () {


  stroke(0);
  strokeWeight(0); 
  fill(125, 15);
  rect(0, 0, width, height);

  int x = mouseX;
  int y = mouseY; 

  translate (grid, grid);
  grid ++;
  scale (0.5);

  strokeWeight(1.5);

  fill(x, y*2);
  rect(a, b, a, a-c);     //large division_1
  rect(a*2, b, a, a-c);     //large division_2  
  rect(a+d, b-e, a-d, e);     //extension  
  rect(a, b-f, a*2, f);     //porch  
  rect(a, b, a, g);     //left rect_1  
  rect(a, b+g, h, i);     //left rect_2 
  rect(a+h, b+g, j, k);     //staircase
  rect(a*2, b+k, k, k);     //right rect_1
  rect(a*3, b+j, l, m);     //right extension
  rect(a-n, b-f, n, m);     //left extension

  a --;
  b --;
  c --;
  d --;
  e --;
  f --;
  g --;
  i --;
  j --;
  k --;
  l --;
  m --;
  n --;

}


void mousePressed() {

  strokeWeight(20);
  stroke(225, 30, 0, 200);

  rect(a, b, a, a-c);
  rect(a*2, b, a, a-c);
  rect(a+d, b-e, a-d, e);
  rect(a, b-f, a*2, f);
  rect(a, b, a, g);
  rect(a, b+g, h, i);
  rect(a+h, b+g, j, k);
  rect(a*2, b+k, k, k);
  rect(a*3, b+j, l, m);
  rect(a-n, b-f, n, m);

  scale (1.5);
  strokeWeight(2);
  fill(0, 0);

  rect(a, b, a, a-c);     
  rect(a*2, b, a, a-c);   
  rect(a+d, b-e, a-d, e);
  rect(a, b-f, a*2, f);
  rect(a, b, a, g);
  rect(a, b+g, h, i);
  rect(a+h, b+g, j, k);
  rect(a*2, b+k, k, k);
  rect(a*3, b+j, l, m);
  rect(a-n, b-f, n, m);
}


void keyPressed() { 
save ("one.jpg");
}


