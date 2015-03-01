
//---------------------------------//
//"Nees' Squares"//
//Recreated by Brandon Messner//
//Version 2//
//02.10.15//
//---------------------------------//

float r=0; //Determines randomization
int columns= 15;
int rows= 30;
int m=20; //margin size
int s=20; //length/width of square
float n=.02; //Increase this # for more rapid translation randomness!!!
float g=1; //Increase this # for more rapid rotation randomness!!!

void setup() {
  size(400,700);
  background(255);
  noFill();
  noLoop(); //Stops it from being animated
  rectMode(CENTER); //Rotate Center
}

void draw() {
  for(int j=1; j<=rows; j++) {
    r=r+(j/5);
    for(int i=1; i<=columns; i++) {
      float z=random(-r*n,r*n); //The Random Factor "z"
      pushMatrix();
      translate(m+i*s+z, m+j*s+z); //moves the square to it's proper place (m+{i or j}*x) and then random variable (z) tweaks it (+z)
      rotate(radians(random(-r*g,r*g)));
      rect(m,m,s,s);
      popMatrix();
    }
  }
}
