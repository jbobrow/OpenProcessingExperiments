
// Oliver Haimson 
// Assignment 08D
// Copyright 2012

int[] x ={
  197,197,199,200,200,201,201,201,200,202,
  202,202,201,200,199,200,198,194,192,189,
  188,189,191,194,195,198,201,201,203,205,
  203,206,205,203,203,206,209,214,215,217,
  220,221,223,223,222,219,213,208,204,204,
  201,197,192,189,185,182,180,178,176,168,
  161,156,153,154,154,150,147,143,141,134,
  131,127,123,116,109,107,101,87,77,70,65,
  60,59,60,62,65,70,73,73,75,79,84,89,93,
  98,100,101,103,107,108,111,112,112,112,
  114,117,117,115,115,115,111,110,110,110,
  110,109,108,108,109,108,107,106,106,106,
  107,108,109,115,120,128,135,138,145,149,
  153,157,162,166,169,173,176,181,186,191};
 
int[] y ={
  4,9,11,14,18,23,29,35,39,42,46,49,50,52,
  56,60,67,78,82,86,91,99,103,111,118,128,
  137,142,153,163,171,182,191,200,204,206,
  206,208,209,208,209,210,213,217,221,221,
  222,221,221,225,226,227,225,227,226,226,
  224,221,220,222,222,221,222,225,228,228,
  226,228,228,228,228,227,228,228,220,216,
  211,207,201,193,185,175,168,163,161,159,
  159,161,165,170,174,179,183,185,186,186,
  170,156,144,136,125,121,115,112,108,103,
  97,92,87,83,71,66,61,58,56,54,49,45,40,
  37,32,27,23,19,13,9,10,13,17,23,30,32,
  31,29,29,30,31,31,32,28,24,18,13,9};
  
float avgx, avgy;
float [] avgArray = new float[2];
PImage kitten;

void setup() {
  size(300,250);
  smooth();
  kitten = loadImage("http://i45.tinypic.com/10eputy.jpg");
}

void draw() {
  for (int i=0; i<width; i+=50) {
    for (int j=0; j<height; j+=38) {
      image(kitten,i,j);
  }}
  noStroke();
  fill(80);
  beginShape();
  for (int i=0; i<x.length; i++){
    vertex(x[i],y[i]);
  }
  endShape();
  float [] centroid = findCentroid();
  drawHeart(centroid);
}

void drawHeart(float [] array2) {
  float x = array2[0];
  float y = array2[1];
  noStroke();
  fill(173,121,200);
  beginShape();
  curveVertex(x-2,y);
  curveVertex(x,y-3);
  curveVertex(x+3,y-4);
  curveVertex(x+5,y);
  curveVertex(x,y+5);
  curveVertex(x-5,y);
  curveVertex(x-3,y-4);
  curveVertex(x,y-3);
  curveVertex(x+2,y);
  endShape();
}
  
float [] findCentroid() {
  avgx = findAverage(x);
  avgy = findAverage(y);
  avgArray[0] = avgx;
  avgArray[1] = avgy;
  return avgArray;
}

float findAverage(int [] anyArray) {
  int sum=0;
  for (int i=0; i<anyArray.length; i++){
    sum+=anyArray[i];
  }
  float avg = sum/anyArray.length;
  return avg;
}
