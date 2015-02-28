
/*
Interaction Venice logo design

The logo of the interaction course, comes out combining 
different logo that each student create for himself/herself.

This is the application with which each student can create 
his personal shape.

names: carla felicetti, taja luxa, helena principato
date: 19/10/2012

Version: 1 

*/

int d = 80;

void setup() {

  size(400, 400);
  background(255);
}

void draw() {
  if (keyPressed) {
    if (key == 97) {//a + h
      fill(0);
      triangle(d, 0, d, d, 2*d, d);
      triangle(d, d, 2*d, d, 2*d, 2*d);
    }
    if (key == 98) { //b
      fill(0);
      triangle(d, 0, 2*d, 0, 2*d, d);
    }
    if (key == 99) { //c
      fill(0);
      triangle(2*d, 0, 2*d, d, 3*d, d);
      triangle(2*d, d, 3*d, d, 3*d, 2*d);
    }
    if (key == 100) {//d + e
      fill(0);
      triangle(2*d, 0, 3*d, 0, 3*d, d);
      triangle(4*d, d, 3*d, d, 3*d, 0);
    }

    if (key == 101) {//e
      fill(0);
      triangle(4*d, d, 3*d, d, 3*d, 0);
    }

    if (key == 102) {//f
      fill(0);
      triangle(3*d, 0, 4*d, 0, 4*d, d);
    }

    if (key == 103) {//g
      fill(0);
      triangle(d, d, 2*d, 2*d, d, 2*d);
      triangle(d, 2*d, 2*d, 2*d, 2*d, 3*d);
    }

    if (key == 104) {//h
      fill(0);
      triangle(d, d, 2*d, d, 2*d, 2*d);
    }

    if (key == 105) {//i+q
      fill(0);
      triangle(2*d, d, 2*d, 2*d, 3*d, 2*d);
      triangle(3*d, 3*d, 2*d, 2*d, 3*d, 2*d);
    }
    if (key == 106) {//j
      fill(0);
      triangle(2*d, d, 3*d, d, 3*d, 2*d);
      triangle(2*d, d, 2*d, 2*d, 3*d, 2*d);
      triangle(2*d, 2*d, 3*d, 2*d, 3*d, 3*d);
    }
    if (key == 108) {//l+s
      fill(0);
      triangle(3*d, d, 3*d, 2*d, 4*d, 2*d);
      triangle(3*d, 2*d, 4*d, 2*d, 4*d, 3*d);
    }
    if (key == 109) {//m
      fill(0);
      triangle(3*d, d, 4*d, d, 4*d, 2*d);
      triangle(4*d, d, 4*d, 2*d, 5*d, 2*d);
    }
    if (key == 110) {//n
      fill(0);
      triangle(d, 2*d, d, 3*d, 2*d, 3*d);
      triangle(0, 2*d, d, 2*d, d, 3*d);
    }
    if (key == 111) {//o
      fill(0);
      triangle(d, 2*d, 2*d, 2*d, 2*d, 3*d);
    }
    if (key == 114) {//r
      fill(0);
      triangle(3*d, 2*d, 3*d, 3*d, 4*d, 3*d);
      triangle(3*d, 3*d, 4*d, 3*d, 4*d, 4*d);
    }
    if (key == 118) {//v
      fill(0);
      triangle(2*d, 3*d, 2*d, 4*d, 3*d, 4*d);
    }
    if (key == 112) {//p
      fill(0);
      triangle(2*d, 2*d, 2*d, 3*d, 3*d, 3*d);
      triangle(2*d, 3*d, 3*d, 3*d, 3*d, 4*d);
      triangle(2*d, 3*d, 2*d, 4*d, 3*d, 4*d);
    }
    if (key == 120) {//x
      fill(0);
      triangle(3*d, 3*d, 3*d, 4*d, 4*d, 4*d);
      triangle(2*d, 3*d, 3*d, 3*d, 3*d, 4*d);
    }

    if (key == 117) {//u
      fill(0);
      triangle(d, 3*d, 2*d, 3*d, 2*d, 4*d);
      triangle(2*d, 3*d, 2*d, 4*d, 3*d, 4*d);
      
    }

    if (key == 116) {//t
      fill(0);
      triangle(d, 3*d, 2*d, 4*d, d, 4*d);
      triangle(d, 4*d, 2*d, 4*d, 2*d, 5*d);
      triangle(d, 3*d, 2*d, 3*d, 2*d, 4*d);
    }
  }
}
