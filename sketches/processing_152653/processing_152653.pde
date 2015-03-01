
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This simple sketch demonstrates how to read pixel values from an image
 * It simulates a 10 pixel "scanner" that moves from the top to the bottom of the image
 * reading the colour values for 10 equally spaced points, then displaying those colours
 * as vertical bars on the left half of the screen.
 *
 */
/* @pjs preload="nasaImage.jpg";*/
/* @pjs globalKeyEvents="true"; */
PImage myImg;
PImage img;
color[] pixelColors;
int scanLine;  // vertical position
int mode=0;

void setup() {
  size(700, 622);
  myImg = loadImage("nasaImage.jpg");
  myImg.resize(width, height);
  frameRate(200);
  img=createImage(width, height, ARGB);
  img.loadPixels();
  for (int i=0; i<img.width*img.height; i++) {
    img.pixels[i]=255;
  }
  img.updatePixels();
  pixelColors = new color[10];
  scanLine = 0;
}

void draw() {
  background(128*int(mode==0));
  img.loadPixels();


  //println(alpha(combine(color(255,0,0,128),0)));
  // read the colours for the current scanLine
  for (int i=0; i<10; i++) {
    pixelColors[i] = myImg.pixels[35+i*70+scanLine*width];
  }

  // draw the sampled pixels as splashes
  for (int i=0; i< 10; i++) {

    float dia=random(35, 60);
    if (mode==0) {
      float centerX=random(width)-dia/2;
      float centerY=random(height)-dia/2;
    } else
    {
      float centerX=random(35+i*70-2*dia, 35+i*70+dia);
      float centerY=random(scanLine-dia, scanLine);
    }

    float distance=0;
    for (int j=0; j<dia; j++) {
      for (int k=0; k<dia; k++) {
        distance=dist(j, k, dia/2, dia/2);
        if (distance<dia/2) {
          switch(mode) {
          case 0:
            img.pixels[int(centerY+j)*img.width+int(centerX)+k]=combine(color(pixelColors[i], map(distance, 0, dia/2, 255, 0)), img.pixels[int(centerY+j)*img.width+int(centerX)+k]);
            break;
          case 1:
            img.pixels[int(centerY+j)*img.width+int(centerX)+k]=color(pixelColors[i], map(distance, 0, dia/2, 50, 255));
            break;
          case 2:
            img.pixels[int(centerY+j)*img.width+int(centerX)+k]=distance<dia/4?
            color(pixelColors[i], map(distance, 0, dia/4, 255, 200)):color(pixelColors[i], map(distance, dia/4, dia/2, 200, 100));
            break;
          }
        }
      }
    }
    img.updatePixels();
  }

  // draw the image
  //image(myImg, 0, 0);
  image(img, 0, 0);

  // increment scan line position every second frame
  scanLine ++;
  scanLine ++;

  if (scanLine >= height) {
    scanLine = 0;
    // myImg=get();
  }

  //draw circles over where the "scanner" is currently reading pixel values
  //  for (int i=0; i<10; i++) {
  //    stroke(255, 0, 0);
  //    noFill();
  //    ellipse(35+i*70, scanLine, 5, 5 );
  //  }
}
color combine(color c1, color c2) {
  float a, r, g, b, a1, r1, g1, b1, a2, r2, g2, b2;
  a1=alpha(c1)/255;
  a2=alpha(c2)/255;
  r1=red(c1);
  g1=green(c1);
  b1=blue(c1);
  r2=red(c2);
  g2=green(c2);
  b2=blue(c2);
  a=a1+a2*(1-a1);
  if (a2==1) {
    a=1;
    r=r1*a1+r2*(1-a1); 
    g=g1*a1+g2*(1-a1); 
    b=b1*a1+b2*(1-a1);
  } else {
    r=(r1*a1+r2*a2*(1-a1))/a; 
    g=(g1*a1+g2*a2*(1-a1))/a; 
    b=(b1*a1+b2*a2*(1-a1))/a;
  }
  return color(r, g, b, 255*a);
}
void keyReleased() {
  if (keyCode == 32) {
    mode++;
    mode=mode%3;
  }
}



