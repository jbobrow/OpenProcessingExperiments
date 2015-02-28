
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 15-7: Displaying the pixels of an image

PImage lowRes;
PImage original;

int x1;
int y1;

int x2;
int y2;

int lowResColor;
int c ;

float distance;

int[] xx1 = new int[100];
int[] yy1 = new int[100];

int[] xx2 = new int[100];
int[] yy2 = new int[100];

color[] cc1 = new color[100];

int numberOfLines = 0;

int R;
int G;
int B;

int BD;

void setup() {
  size(800, 600);
  //original = loadImage(".jpg");
  lowRes = loadImage("candy.jpg");

  // Input
  setupSerial(0);
}


void draw() {

  image(lowRes, 0, 0);

  // In put PRESSURE SENSOR
  int[] values = getSerialValues();


  if ( values.length > 0 ) {

    R = round( map( values[0], 0, 265, 0, 255) );
    G = round( map( values[1], 0, 265, 0, 255) );
    B = round( map( values[2], 0, 265, 0, 255) );

    BD = round( map( values[3], 0, 9, 9, 0) );
  }

  // pick one pixel randomly
  //x1 = round( random(0, lowRes.width) );
  //y1 = round( random(0, lowRes.height) );

  // loop over the source image
  // with two for loops, like below
  for (int y1 = 0; y1< lowRes.height; y1++ ) {
    for (int x1 = 0; x1 < lowRes.width; x1++ ) {

      // for each i,j pixel in the source image,
      // get the color of that pixel

      if ( dist( R, G, B, red(lowResColor), green(lowResColor), blue(lowResColor) ) <= 0 ) {
        lowResColor = lowRes.get(x1, y1);
      }

      // then check the "distance" between that color and R,G,B:
      // if ( dist( R,G,B, red(c),green(c),blue(c) ) < 10 ) {
      //
      // }
    }
  }

  // pick other pixel randomly
  //x2 = round( random(0, lowRes.width) );
  //y2 = round( random(0, lowRes.height) );

  // read the other pixel
  for (int i = y2; i < lowRes.height; i++ ) {
    for (int j = x2; j < lowRes.width; j++ ) {

      if ( dist( R, G, B, red(c), green(c), blue(c) ) <= 0 ) {
        color c = lowRes.get(j, i);
      }

      if ( lowResColor == c ) {

        xx1[numberOfLines] = x1;  
        yy1[numberOfLines] = y1;
        xx2[numberOfLines] = j;
        yy2[numberOfLines] = i;

        cc1[numberOfLines] = c;

        numberOfLines = numberOfLines + 1;



        if (xx1.length <= numberOfLines) {
          xx1 = expand(xx1);
          yy1 = expand(yy1);
          xx2 = expand(xx2);
          yy2 = expand(yy2);

          cc1 = expand(cc1);
        }

        i= lowRes.height;
        j= lowRes.width;
      }
    }
  }

  // arrays

  int i = 0;

  while (i < numberOfLines ) {

    //connecting pixels

      strokeCap(SQUARE);

    distance = dist(xx1[i], yy1[i], xx2[i], yy2[i])/100;
    strokeWeight(distance);

    noFill();
    stroke(R, G, B);
    bezier(10*BD, 100*BD, xx1[i], yy1[i], xx2[i], yy2[i], 100*BD, 10*BD); 

    /*beginShape();
     vertex(xx1[i], yy1[i]);
     vertex(xx2[i], yy2[i]);
     endShape();
     */

    i = i + 1;
  }
}

