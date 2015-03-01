
//Assignment 1: Media Arts & Practice 404 Tactical Media
//McKenzie Carlile

int color1;
int color2;
int color3;
int color4;
int color5;
int color6;
int i1 = 0;
int i2 = 1;
int i3 = 2;
int i4 = 3;
int i5 = 4;
int i6 = 5;
int savedTime;
int totalTime = 50;


color [] colarray = { 
  color(255, 153, 0), color(238, 61, 35), 
  color(204, 31, 54), color(103, 55, 148), color(52, 77, 161), 
  color (17, 153, 71)
};

void setup () {
  size (800, 500, P2D);
  background(0);
  savedTime = millis();
}

void draw () {
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    if (i1 >= 5) {
      i1=0;
    } else {
      i1++;
    }
    if (i2 >= 5) {
      i2=0;
    } else {
      i2++;
    }
    if (i3 >= 5) {
      i3=0;
    } else {
      i3++;
    }
    if (i4 >= 5) {
      i4=0;
    } else {
      i4++;
    }
    if (i5 >= 5) {
      i5=0;
    } else {
      i5++;
    }
    if (i6 >= 5) {
      i6=0;
    } else {
      i6++;
    }
    savedTime = millis();
  }

  //begin feathers
  noStroke();
  color1 = color(colarray[i1]);
  fill (color1);
  ellipse(160.17, 345.501, 124.334, 124.334);
  triangle(193.5, 292.917, 160.167, 407.668, 364.428, 407.564);
  color2 = color(colarray[i2]);
  fill (color2);
  triangle(266.875, 187, 177.665, 267.667, 355.434, 387.954);
  ellipse(211.501, 215.501, 124.334, 124.334);
  color3 = color(colarray[i3]);
  fill (color3);
  triangle(387.742, 146.124, 267.25, 156, 356.91, 361.364);
  ellipse(326.168, 136.167, 124.334, 124.334);
  color4 = color(colarray[i4]);
  fill (color4);
  triangle(521, 154.5, 399.861, 143.236, 431.402, 361.176 );
  ellipse (461.668, 136.167, 124.334, 124.334);
  color5 = color(colarray[i5]);
  fill (color5);
  triangle(614.5, 264.25, 520.001, 189.333, 432.463, 388.064);
  ellipse (576.335, 215.167, 124.334, 124.334);
  color6 = color(colarray[i6]);
  fill (color6);
  triangle(423.387, 407.628, 592.334, 294.168, 628, 407.688);
  ellipse (627.335, 345.501, 124.334, 124.334);
  //begin head
  fill(0);
  triangle(400.361, 159.736, 429.5, 162, 405, 190.5);
}

//Source 1986 NBC Logo found here: http://vector-magz.com/search/nbc-logo-peacock-video-download/



