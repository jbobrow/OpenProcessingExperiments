
/*
 *Postcard from Clevedon Near Bristol UK
 *final submission for an amazing course
 *started as a complete beginner
 *and after six weeks I can send this postcard
 * thank you so much Monash University Creative Programming Course Leaders
 */

/*@pjs preload="clevedonbeach.jpg";*/
//  pictures taken near my home

PImage bg;
PImage myImg_1;
PImage myImg_2;

// set up scanner for 1 pixel camera running horizontally
color[] pixelColors;
int scanLine;

float[] x;
float[] y;
float[] dx;
float[] dy;
float[] bx;
float[] by;
float[] xInc;
float[] yInc;
//float[] ang;
//float[] ang_inc;
int numArray;
int framewidth =750;
int frameheight=500;
float circle_size = 5;

void setup() {
  size(750, 500);
  bg =loadImage("clevedonbeach.jpg");
  // sound library installed for javascript following directions from Abe Pazos on funprogramming.org

  myImg_1 =loadImage("IMG_1.JPG");
  myImg_3 =loadImage("IMG_3.JPG");
  background(bg);
  pixelColors = new color[20];
  scanLine = 0;
  smooth(4);

  numArray = 40;

  // allocate arrays
  x= new float[numArray];
  y= new float[numArray];
  xInc= new float[numArray];//scanner moving
  yInc= new float[numArray];// scanner moving  
  dx  = new float [numArray];
  dy  = new float [numArray];
  bx  = new float [numArray]; 
  by  = new float [numArray];

  // random starting position and direction
  for (int i=0; i<numArray; i++) {
    x[i] = random(framewidth);
    y[i] = random(frameheight);
    // dx and dy are the small change in position each frame
    dx[i] = random(-10, 10);
    dy[i] = random(-10, 10);
  }
}


void draw() { 

  scanLine ++;

  if (scanLine > height) {
    scanLine = 0;
  }

  for (int i=1; i<numArray; i++) {
    x[i] += xInc[i];
    y[i] += yInc[i];
    pixelColors[i] = myImg_1.get(scanLine, 36+i*36); 

    for (int j=1; j<i; j++) {
      x[j] += xInc[j];
      y[j] += yInc[j];

      pixelColors[j] = myImg_3.get(scanLine, 36+j*36);
    }
  }

  for (int i=0; i<numArray; i++) { 

    // as blend doesn't work in javascript, slowly fade the image over time
    if (frameCount%10 == 0) {
      fill(bg, 1);
      rect(0, 0, width, height);
      float rad = radians(frameCount);

      // calculate new position
      x[i] += dx[i];
      y[i] += dy[i];

      float max = 1;
      float min = -1;

      //When the shape hits the edge of the window, it reverses its direction and changes velocity
      if (x[i] > framewidth-50 || x[i] < 50) {
        dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
      }

      if (y[i] > frameheight-50 || y[i] < 50) {
        dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
      }

      bx[i] = x[i] + frameCount*sin(rad);
      by[i] = y[i] + frameCount*cos(rad);


      float radius = sin(rad*0.1);
      float handX  = bx[i] + 100*radius*sin(rad*3);
      float handY  = by[i] + 100*radius*cos(rad*3);

      if (frameCount%2 == 0) {
        fill( pixelColors[i], random(80, 100));
      } else {
        fill(pixelColors[j], random(80, 100));
      }
      stroke(0);
      strokeWeight(1);
      bezier(bx[i], by[i], bx[i]+random(50), by[i]+random(50), handX-random(50), handY-random(50), handX, handY);
      bezier(bx[i], by[i], bx[i]-random(50), by[i]-random(50), handX+random(50), handY+random(50), handX, handY);


      for (int k=0; k<(numArray*4); k++) {
        
          strokeWeight(1);
          if (k%2==0) {
            stroke(pixelColors[i], 80/k);
          } else {
            stroke(pixelColors[j], 80/k);
          }
        if (mousePressed==true) {
        noFill();
        ellipse(mouseX, mouseY, circle_size*k, circle_size*k);
        //#8B9ECE
      }
    }

    textSize(32);
    fill(255);
    text("Greetings from Clevedon,England", 10, 450); 
    textSize(15);
    fill(255);
    text("press button in top left-hand corner to turn on/off sound", 10, 480);
  }
}
}



