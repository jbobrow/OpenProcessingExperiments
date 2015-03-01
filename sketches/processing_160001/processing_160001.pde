
/* @pjs preload="bookshelf.jpg" ; */

//load here
PImage books ;

int rightI = 15 ;
int leftI = 45 ;
int paperA = 60 ;
int farPaperY = 200;
int farPaperX = 0;
int paperC=161 ;
int downL = 60;
int leftL = 0;
int distantX = 200;
int distantY = 200;
int newX = 50;
int newY = 100;
int lastX = 0;
int lastY = 120;

void setup() {
  size(680, 400) ;
  books = loadImage("bookshelf.jpg") ;
}

void draw() {
  background(0) ;
  fill(175, 0, 0) ;
  for (int patternY = 0; patternY < 30; patternY++) {
    for (int patternX = 0; patternX < 40; patternX++) {
      rect(20*patternX, 20 * patternY, 10, 10) ;
    }
  }
  for (int patternR = 0; patternR < 30; patternR++) {
    for (int patternD = 0; patternD < 40; patternD++) {
      rect((20*patternD)+10, (20 * patternR) + 10, 10, 10) ;
    }
  }
  fill(75, 0, 0) ;
  for (int patternZ = 0; patternZ < 30; patternZ++) {
    for (int patternA = 0; patternA < 40; patternA++) {
      rect((20*patternA)+10, (20 * patternZ), 10, 10) ;
    }
  }
  for (int patternW = 0; patternW < 30; patternW++) {
    for (int patternB = 0; patternB < 40; patternB++) {
      rect((20*patternB), (20 * patternW) + 10, 10, 10) ;
    }
  }
  fill(150) ;
  rect(30, 20, 620, 115) ;
  fill(255) ;
  ellipse(300, 30, 40, 40) ;
  ellipse(380, 30, 40, 40) ;
  fill(0) ;
  ellipse(300, leftI, 10, 10) ;
  leftI= leftI - 1 ;
  if (leftI < 15) {
    leftI= 45 ;
  }
  ellipse(380, rightI, 10, 10) ;
  rightI= rightI + 1 ;
  if (rightI > 45) {
    rightI= 15;
  }
  fill(150) ;
  quad(300, 65, 380, 65, 460, 140, 220, 140) ;
  rect(220, 80, 240, 120) ;
  fill(0, 0, 100, 30) ;
  triangle(225, 85, 225, 195, 340, 140) ;
  triangle(225, 85, 455, 85, 340, 140) ;
  triangle(455, 85, 455, 195, 340, 140) ;
  triangle(455, 195, 225, 195, 340, 140) ;
  for (int booksUL = 0; booksUL < 5; booksUL++) {
    image(books, (35*booksUL)+10, 200, 35, 70) ;
    image(books, (35*booksUL)+10, 300, 35, 70) ;
    image(books, (35*booksUL)+495, 200, 35, 70) ;
    image(books, (35*booksUL)+495, 300, 35, 70) ;
  }
  for (int booksM = 0; booksM < 3; booksM++) {
    image(books, (35*booksM)+210, 250, 35, 70) ;
    image(books, (35*booksM)+365, 250, 35, 70) ;
  }
  image(books, 322, 300, 36, 70) ;
  fill(255);
  rect(340+paperA, 140+paperA, 10, 10);
  paperA = paperA - 1 ;
  if (paperA < 0) {
    paperA = 60;
  }
  rect(240+farPaperX, 140+farPaperY, 8, 11) ;
  farPaperX = farPaperX + 2 ;
  if (farPaperX > 100) {
    farPaperX = 0;
  }
  farPaperY = farPaperY - 4;
  if (farPaperY < 0) {
    farPaperY = 200;
  }
  rect(326, 140+paperC, 7, 10) ;
  paperC = paperC - 1;
  if (paperC < 0) {
    paperC = 160 ;
  }
  rect(40+leftL, 140+downL, 10, 7) ;
  leftL= leftL + 5;
  if (leftL > 300) {
    leftL = 0;
  }
  downL = downL - 1;
  if (downL < 0) {
    downL = 60 ;
  }
  rect(340+distantX, 140+distantY, 15, 9) ;
  distantX= distantX-3;
  if (distantX < 0) {
    distantX = 200 ;
  }
  distantY= distantY-3;
  if (distantY < 0) {
    distantY = 200 ;
  }
  rect(340+newX, 140+newY, 11, 12) ;
  newX= newX - 1;
  if (newX<0) {
    newX = 50;
  }
  newY= newY - 2;
  if (newY<0) {
    newY = 100;
  }
  rect(220+lastX, 140+lastY, 7, 4) ;
  lastX= lastX + 3;
  if (lastX > 120) {
    lastX=0;
  }
  lastY= lastY - 3;
  if (lastY < 0) {
    lastY = 120;
  }
  fill(160) ;
  ellipse(340, 140, 70, 60) ;
}



