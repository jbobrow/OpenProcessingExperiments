
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
*Pierre MARZIN, started as a variation and drifted away...
 *
 */
/* @pjs preload="loup.jpg"; */
int []rowPix;
int [][]index;
PImage myImg;
PImage newimg;
float pixelColor;
int scanline, column;  // vertical position
int droite, gauche, amp;

void setup() {
  size(480, 360);
  rowPix=new int[height];
  index=new int[height][width];
  for (int j=0; j<width; j++) {
    for (int i=0; i<height; i++) {
      index[i][j]=j+i*width;
    }
  }
  frameRate(200);
  amp=65;
  //myImg = loadImage("nasaImage.jpg");
  myImg = loadImage("loup.jpg");

  newimg=createImage(width, height, RGB);
  newimg.loadPixels();
  for (int i=0; i<newimg.pixels.length; i++) {
    newimg.pixels[i]=color(0, 0);
  }
  newimg.updatePixels();
  stroke(255, 0, 0);
}
void draw() {
  float ratio=(1-sin(3*PI/2+frameCount/amp))/2;

  if (frameCount==1) {
    myImg.resize(width, height);
    myImg.loadPixels(); 
    //image(myImg, 0, 0);
    sortPix();
  } else {
    for (int j=0; j<width; j++) {
      for (int i=0; i<height; i++) {
        //int postemp=int((ratio*index[i][j]/width+(amp-ratio)*i)/amp);
        //int postemp=int((ratio*index[i][j]/width+(amp-ratio)*i)/amp);
        int postemp=int(map(ratio,0,1,i,index[i][j]/width));
        newimg.pixels[j+i*width]=myImg.pixels[postemp*width+j];
      }
    }
    newimg.updatePixels();
    image(newimg, 0, 0);
  }
  //text(ratio,50,50);
}

void sortPix() {
  newimg.loadPixels();  
  for (int j=0; j<width; j++) {
    for (int i=0; i<height; i++) {
      rowPix[i]=myImg.get(j, i);
    }
    quicksort(rowPix, 0, rowPix.length-1, j);
  }
}
void quicksort(int[]tableau, int debut, int fin, int col) {

  if (debut<fin) {
    int indicePivot=partition(tableau, debut, fin, col);
    quicksort(tableau, debut, indicePivot-1, col);
    quicksort(tableau, indicePivot+1, fin, col);
  }
}

int partition(int[]t, int debut, int fin, int col) {

  int valeurPivot=t[debut];
  int indd=index[debut][col];
  int d=debut+1;
  int f=fin;
  while (d<f) {
    while (d<f&&t[f]>=valeurPivot)f--;
    while (d<f&&t[d]<=valeurPivot)d++;
    int temp=t[d];
    int tempindex=index[d][col];
    t[d]=t[f];
    t[f]=temp;
    index[d][col]=index[f][col];
    index[f][col]=tempindex;   
    droite=d;
    gauche=f;
  }
  if (t[d]>valeurPivot)d--;
  t[debut]=t[d];
  t[d]=valeurPivot;
  index[debut][col]=index[d][col];
  index[d][col]=indd;
  droite=d;
  gauche=d;
  return d;
}


