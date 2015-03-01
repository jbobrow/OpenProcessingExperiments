
//Hilariously enough, throughout the test,
//I kept thinking that my daily would have to be about making circles appear and disappear outside of clicking on them.
//It's pretty simple, but I totally blanked on how to do it, and couldn't find many good resources for remembering it on the fly.
int count = 0;
int theSize1 = 0;
int theSize2 = 0;
int theSize3 = 0;
int theSize4 = 0;
int theSize5 = 0;

void setup() {
  size(600, 600);
}
void draw() {
  background(0);
  theSize1+=5;
  if (theSize1 > 50) {
    theSize1 = 0;
  }
  if (theSize1 > 49) {
    theSize2+=1;
  }
  if (theSize2 > 38) {
    theSize2 = 0;
  }
   if (theSize1 > 15) {
    theSize3+=3;
  }
  if (theSize3 > 38) {
    theSize3 = 0;
  }
   if (theSize1 > 25) {
    theSize4+=3;
  }
  if (theSize4 > 38) {
    theSize4 = 0;
  }
   if (theSize1 > 48) {
    theSize5+=8;
  }
  if (theSize5 > 38) {
    theSize5 = 0;
  }
  ellipse(300, 300, theSize1, theSize1); // draw ellipse
  ellipse(60, 300, theSize2, theSize2);
  ellipse(300, 60, theSize3, theSize3);
  ellipse(540, 300, theSize4, theSize4);
  ellipse(300, 540, theSize5, theSize5);
}

