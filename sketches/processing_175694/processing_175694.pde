
/* Comparing different averaging methods
 06Dec14 
 Red Curve - Divide last N readings by N
 Green Curve - Subtract sum/N from sum and add in latest
 Press N/n for Noise up/down, F/f for Filter Size up/down
 */

/////////////////////////////////////////////////////
int filterSize = 50; // samples to average over
int noise = 30;  // max noise level either side of signal
int signal = 300;  // nominal input signal
/////////////////////////////////////////////////////

float[] wtarray = new float[1000];    //make it big enough to cope!
PFont body;
int wtptr;
float wt, wtsum, y1, y2;
int x, xMax;      

void setup() {
  size(1000, 400);
  xMax=width;  
  body = loadFont("ArialMT-48.vlw");
  textFont(body); 
  noLoop();
}

void draw() {
  background(200);
  fill(0, 0, 0);
  textSize(18);
  text("Averaging Algorithms:" + "   Signal = " + signal  + "   Noise < " + noise  + "   Samples = " + filterSize, 30, 30);

  stroke(150, 150, 150);                 // colour for x-y grid
  // draw horiz lines
  for (int i=0; i<height; i+=50) {
    line(20, height-i-20, width, height-i-20);
    fill(0, 0, 0);
    textSize(10);
    text(i, 0, height-i-20);
  }
  // and vert lines
  line(0, height-20, width, height-20);
  for (int i=0; i<xMax; i+=50) {
    line(i+20, 0, i+20, height-20);
    fill(0, 0, 0);
    textSize(10);
    text(i, i+20, height-10);
  }

  wtptr=0;
  wtsum=0;
  y2=0;
  for (int i=0; i<filterSize; i++) {
    wtarray[i]=0;
  }
  for (x=0; x<xMax; x++) {
    wt = signal + random(-noise, +noise);  // simulate a noisy input

    // average last N samples
    wtarray[wtptr]=wt;
    wtptr++;  
    if (wtptr==filterSize) wtptr=0;
    wtsum=0;
    for (int i=0; i<filterSize; i++) {
      wtsum += wtarray[i];
    }
    y1 = (wtsum/filterSize);

    // do av by subtracting current average and adding in latest
    y2 = y2 + wt - y2/filterSize; 

    // plot results
    stroke(250, 50, 50);
    ellipse(x+20, height-20-y1, 2, 2);
    stroke(50, 150, 50);
    ellipse(x+20, height-20-(y2/filterSize), 2, 2);
  //  x++;
  }
}

void keyPressed() {
  if ((key == 'n') && ( noise > 0)) {
    noise--; 
    redraw();
  } else if ((key == 'N') && (filterSize >10)) {
    noise++;
    redraw();
  } else if ((key == 'F') && (filterSize <500)) {
    filterSize++;
    redraw();
  } else if ((key == 'f') && (filterSize <500)) {
    filterSize--;
    redraw();
  } else if (key == 's') saveFrame("Averages"+".jpg");
}


