
/*****************************************
 * Assignment 02
 * Name:         Shuyi Lin
 * E-mail:       slin01@brynmawr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    2/07/2012
 * 
 * I decided to draw a sunset horizon. There is a slight reflection of the sun over the water. 
 When you click in the sky, there are clouds. Closer to the horizon, the smaller 
 the clouds are. When you click in the sea, there are rocks. Closer to the horizon, 
 the smaller and darker the rocks are. 
 ***********************************************/

void setup () {
  size(600, 600);
  smooth();
  noStroke();

  {
    //Gradient of the sky half of the horizon
    int steps = 600;
    float x = 0.0;
    float y = 0.0;
    float w = width;
    float h = height/steps;
    float hzn = height/2;

    color startC, endC;
    startC = color(20, 20, 140); // orange
    endC = color(200, 100, 0); // blue

    float startR, startG, startB;
    float endR, endG, endB;
    float deltaR, deltaG, deltaB;

    startR = red(startC);
    startG = green(startC);
    startB = blue(startC);

    endR = red(endC);
    endG = green(endC);
    endB = blue(endC);

    deltaR  = (endR - startR)/(steps-1);
    deltaG  = (endG - startG)/(steps-1);
    deltaB  = (endB - startB)/(steps-1);

    int i = 0;
    while (i<steps) {
      fill(startC);
      rect(x, y, w, hzn);
      startR += deltaR;
      startG += deltaG;
      startB += deltaB;
      startC = color(startR, startG, startB);
      y += h/2;
      i++;
    }

    {
      //iteration of sun
      int k = width/2;
      while (k>1) {
        fill (255, 50, 10, 50);
        ellipse (width/2, height/2, k, k);
        k-=30;
      }
    }

    {
      //gradient of the sea half of horizon
      color startD, endD;
      startD = color(200, 100, 0); // orange
      endD = color(20, 20, 140); // blue

      startR = red(startD);
      startG = green(startD);
      startB = blue(startD);

      endR = red(endD);
      endG = green(endD);
      endB = blue(endD);

      deltaR  = (endR - startR)/(steps-1);
      deltaG  = (endG - startG)/(steps-1);
      deltaB  = (endB - startB)/(steps-1);

      int j = 0;
      while (j<steps) {
        fill(startD);
        rect(x, y, w, hzn);
        startR += deltaR;
        startG += deltaG;
        startB += deltaB;
        startD = color(startR, startG, startB);
        y += h/2;
        j++;
      }
    }
  }

  //reflection of sun over water
  int l = width/2;
  while (l>1) {
    fill (200, 50, 10, 60);
    ellipse (width/2, height/2, l, l);
    l-=50;
  }
}

void draw () {};

//big clouds near the top
void mousePressed () {
  float hzn = height/2;
  float scal=(hzn-mouseY)/hzn;
  fill (255, 10);
  if  (mouseY < (hzn/2)) {
    ellipse (mouseX, mouseY, 150*scal, 70*scal);
    ellipse (mouseX, mouseY, 100*scal, 80*scal); 
    ellipse (mouseX, mouseY, 100*scal, 90*scal);
    ellipse (mouseX, mouseY, 150*scal, 70*scal);
  }
  //small clouds near the horizon
  else if (mouseY<(hzn)-30) {
    fill (255, 100);
    ellipse (mouseX, mouseY, 100*scal, 30*scal);
    ellipse (mouseX, mouseY, 50*scal, 40*scal); 
    ellipse (mouseX, mouseY, 50*scal, 45*scal);
    ellipse (mouseX, mouseY, 75*scal, 35*scal);
  }
  fill (0, 150);
  if (mouseY<hzn) {
    fill (0);
  }
  // small rocks close to horizon
  else if (mouseY < hzn+200) {
    fill (0, 180);
    arc (mouseX, mouseY, 148, 94, 3.142, 6.283);
  }
  //big rocks close to bottom
  else {
    arc (mouseX, mouseY, 400, 300, 3.142, 6.283);
  }
}


