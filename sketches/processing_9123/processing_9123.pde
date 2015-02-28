
//     Christoph Lueder 
//
//     2010
//
//     www.lueder.info



//int n;

float startX;
float startY;
float ff;
int dd = 50;
int[] xpos = new int[dd];
int[] ypos = new int[dd];
int[] startColorR = new int[dd];
int[] startColorG = new int[dd];
int[] startColorB = new int[dd];
int[] maxX = new int[dd];
int[] maxY = new int[dd];
int[] maxXs = new int[dd];
int[] maxYs = new int[dd];
float[] speedX = new float[dd];
float[] speedY = new float[dd];
float[] totalSpeed = new float[dd];
float t;
float speedChange;
// inertia edge attraction
int inertia = -1;
// record x and y position for collison control
int xbefore;
int ybefore;
//transparency
float al = 1;
float af = 1;
// record mouse input for transparency control
int mp;
//record mouse position for size determination
int ms;
// fill wireframe depending on mouse action
int mf = 0;
//counting ellipses made
int mC;
// overall speed
int sC = 200;
//morphing speed
int mS = 8; 
// speed collision avoid change
int scc = 500;
// speed limit movement
int spLim = 15;
//speed of color change
float cS = 0.003;
// alpha of lines
int alpc = 20;
//shade of background
int bg = 255;
// alpha of background wipe
float alpb = 0.012;
float alp;
// size restriction on/off 1/0
int sR = 0;

PFont font10b;
PFont font12b;
PFont font10;

//setting initial constraints for RGB color channels 
float rmin = 150;
float rmax = 255;
float gmin = 0;
float gmax = 255;
float bmin = 0;
float bmax = 205;

float r;
float g;
float b;


void setup (){
  size (900,800); 
  frameRate (60);
  smooth();
  colorMode(RGB, 255, 255, 255, 1);
  // Initialize array
  for (int i = 0; i < xpos.length-1; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
    startColorR[i] =0;
    startColorG[i] =0;
    startColorB[i] =0;
    maxX[i] = 0;
    maxY[i] = 0;
    maxXs[i] = 100;
    maxYs[i] = 100;
    speedX[i] = 0;
    speedY[i] = 0;
  }
  //cursor and fonts
  cursor(CROSS);
  font10b = loadFont ("DINBold-10.vlw");
  font12b = loadFont ("DINBold-12.vlw");
  font10 = loadFont ("DIN-10.vlw");
} 


void draw () { 
  fill(r, g, b, alpb); 
  noStroke();
  rect(0, 0, width, height);
  t=t+cS;

  //draw input ellipse
  if (ms == 1) {
    ellipseMode(CORNERS);
    stroke(10);
    ellipse(startX, startY, mouseX, mouseY);
  }


  //setting new constraints for RGB color channels
  float cc = noise (t + 5) * 375.5 + 0.00000001;
  rmin = ((int)(125.5 / cc)) * (cc - 0);
  rmax = 255 - ((int)(255 / cc)) * ((int)(cc / 125.5)) * (255 - cc);
  gmin = ((int)(255 / cc)) * ((int)(cc / 125.5)) * (cc - 125.5);
  gmax = 255 - ((int)(375.5 / cc)) * ((int)(cc / 255)) * (375.5 - cc);
  bmin = ((int)(375.5 / cc)) * ((int)(cc / 255)) * (cc - 255);
  bmax = 255 - ((int)(125.5 / cc)) * (125.5 - cc);


  // Draw everything
  for (int i = 0; i < xpos.length-1; i++) {

    //if speed is fast and ellipses small change directions somewhat randomly
    totalSpeed[i] = abs(speedX[i]) + abs(speedY[i]);
    if (totalSpeed[i]  > 1) {
      speedChange = noise(t*10+i) * 2 - 0.5 * 2;
      speedX[i] = speedX[i] + speedChange;
      if (speedY[i] > 0) {
        speedY[i] = totalSpeed[i] - abs(speedX[i]);
      } 
      else {
        speedY[i] = - totalSpeed[i] + abs(speedX[i]);
      }
    }

    // avoid collisions and repell
    for (int k = 0; k < i; k++) {
      repell(i, k);
    }
    for (int k = i + 1; k < xpos.length-1; k++) {
      repell(i, k);
    }


    // if canvas border reached reverse direction
    if ((xpos[i] + speedX[i]+ maxX[i]/2 > width-10) ) {
      speedX[i] = - speedX[i] + inertia;
    }
    if ( (xpos[i] + speedX[i] - maxX[i]/2 < 10)) {
      speedX[i] = - speedX[i] - inertia;
    }
    if ((ypos[i] + speedY[i] + maxY[i]/2 > height-10)) {
      speedY[i] = - speedY[i] + inertia;
    }
    if ((ypos[i] + speedY[i] - maxY[i]/2 < 10)) {
      speedY[i] = - speedY[i] - inertia;
    }

    //make sure things don't get too fast
    if (speedX[i]  > spLim) {
      speedX[i] = spLim;
    }    
    if (speedX[i]  < - spLim) {
      speedX[i] = - spLim;
    }
    if (speedY[i]  > spLim) {
      speedY[i] = spLim;
    }
    if (speedY[i]  < - spLim) {
      speedY[i] = - spLim;
    }

    // update position 
    xpos[i] = xpos[i] + round(speedX[i]);
    ypos[i] = ypos[i] + round(speedY[i]);


    //setting background color
    if (alpb == 0.012) {
      r = 255*noise(r+t);
      g = 255*noise(g+1+t);
      b = 255*noise(b+2+t);
      if (r>rmax) { 
        r=rmin; 
      }
      if (r<rmin) { 
        r=rmax; 
      }
      if (g>gmax) { 
        g=gmin; 
      }
      if (g<gmin) { 
        g=gmax; 
      }
      if (b>bmax) { 
        b=bmin; 
      }
      if (b<bmin) { 
        b=bmax; 
      }

    }
    else {
      r = 255;
      g = 255;
      b = 255;
    }

    // draw the ellipses
    ff = float(startColorR[i]);
    if (((ceil(ff/2) == (ff/2)) && (mf == 1)) || (mf == 2)) {
      noFill();
      stroke(startColorR[i], startColorG[i], startColorB[i], al);
      ellipseMode(CENTER);
      ellipse(xpos[i], ypos[i], noise(t*mS+i)*(maxX[i]*2), noise(t*mS+i+1)*(maxY[i]*2));
    } 
    else {
      noStroke();
      fill(startColorR[i], startColorG[i], startColorB[i], af);
      ellipseMode(CENTER);
      ellipse(xpos[i], ypos[i], noise(t*mS+i)*(maxX[i]*2), noise(t*mS+i+1)*(maxY[i]*2));
      if (af < 1) {
        fill(startColorR[i], startColorG[i], startColorB[i], af * 2);
        ellipse(xpos[i], ypos[i], noise(t*mS+i)*(maxX[i]*1), noise(t*mS+i+1)*(maxY[i]*1));
        ellipse(xpos[i], ypos[i], noise(t*mS+i)*(maxX[i]*1.4), noise(t*mS+i+1)*(maxY[i]*1.4));
      }
    }

    // control buttons and text display
    fill(0); 
    noStroke();
    rect(0, 0, 60, 20);
    rect(120, 0, 80, 20);
    rect(220, 0, 80, 20);
    rect(320, 0, 100, 20);
    rect(0, 30, 420, 20);
    rect(0, 60, 420, 20);
    textFont (font12b);
    fill(255);
    text ("no  " + mC, 20, 15);
    text ("reset", 130, 15);
    text ("absorb", 230, 15);
    text ("size restrict", 330, 15);
    //text (" totalSpeed "+(int)totalSpeed[i]+"  speedChange  "+(int)(speedChange*10)+"    "+(int)(noise(t) * 100), 20, 95);
    text ("FILL                                       MIXED                                      WIRE", 20, 45);
    //text ("TRANSPARENCY                              wire "+al+"  |  fill "+af, 20, 75);
    text ("TRANSPARENCY                             "+al, 20, 75);
  }
}


void mousePressed() {
  //record mouse position for size determination for new ellipses
  if ((mouseX < 420) && (mouseY < 80)) {
    ms = 0;
  }
  else {
    startX = mouseX;
    startY = mouseY;
    ms = 1;
  }


  //reset all on mousepress
  if ((mouseX > 120) && (mouseX < 200) && (mouseY > 0) && (mouseY < 20)) {
    fill(bg, bg, bg, 1); 
    noStroke();
    rect(0, 0, width, height);
    mC = -1;
    for (int i = 0; i < xpos.length-1; i++) {
      maxX[i] = 0;
      maxY[i] = 0;
    }
  }

  // background absorption on / off
  if ((mouseX > 220) && (mouseX < 300) && (mouseY > 0) && (mouseY < 20)) {
    if (alpb == 0.012) {
      alpb = 0.4;
    }
    else {
      alpb = 0.012;
    }
  }

  // toggle size restriction on / off
  if ((mouseX > 320) && (mouseX < 420) && (mouseY > 0) && (mouseY < 20)) {
    if (sR == 0) {
      sR = 1;
      for (int i = 0; i < xpos.length-1; i++) {
        maxXs[i] = maxX[i];
        maxYs[i] = maxY[i];
        if (maxX[i] > 100) {
          maxX[i] = 100;
        }
        if (maxY[i] > 100) {
          maxY[i] = 100;
        }
      }
    }
    else {
      sR = 0;
      for (int i = 0; i < xpos.length-1; i++) {
        maxX[i] = maxXs[i];
        maxY[i] = maxYs[i];
      }
    }
  }

  // set transparency alpha slider
  if ((mouseX > 0) && (mouseX < 420) && (mouseY > 60) && (mouseY < 80)) {
    mp = mouseX;
    al = norm(mp, 0, 400);
    af = 0.1 * al;
    if (al > 1) {
      af = 1;
    }
  }
  // fill or mixed or wireframe set
  if ((mouseX > 0) && (mouseX < 140) && (mouseY > 30) && (mouseY < 50)) {
    mf = 0;
  }
  if ((mouseX > 140) && (mouseX < 280) && (mouseY > 30) && (mouseY < 50)) {
    mf = 1;
  }
  if ((mouseX > 280) && (mouseX < 420) && (mouseY > 30) && (mouseY < 50)) {
    mf = 2;
  }
}



void mouseReleased() {
  // reserve field for control buttons
  if ((mouseX < 420) && (mouseY  < 80)) {
  }
  else {
    // advance counter
    mC++;

    // Shift array values
    for (int i = 0; i < xpos.length-1; i++) {
      maxX[i] = maxX[i+1];
      maxY[i] = maxY[i+1];
      maxXs[i] = maxXs[i+1];
      maxYs[i] = maxYs[i+1];
      xpos[i] = xpos[i + 1];
      ypos[i] = ypos[i + 1];
      startColorR[i] = startColorR[i + 1];
      startColorG[i] = startColorG[i + 1];
      startColorB[i] = startColorB[i + 1];
      speedX[i] = speedX[i + 1];
      speedY[i] = speedY[i + 1];
      totalSpeed[i] = totalSpeed[i + 1];
    }

    // new size
    maxX[maxX.length-2] = abs(round(startX - mouseX));
    maxY[maxY.length-2] = abs(round(startY - mouseY));
    maxXs[maxXs.length-2] = abs(round(startX - mouseX));
    maxYs[maxYs.length-2] = abs(round(startY - mouseY));
    ms = 0;

    // new location
    xpos[xpos.length-2] = round((startX+mouseX)/2);
    ypos[ypos.length-2] = round((startY+mouseY)/2);

    // new color
    startColorR[startColorR.length-2] = 150 + (int)(105*noise(t*10));
    startColorG[startColorG.length-2] = (int)(255*noise(t*10+1));
    startColorB[startColorB.length-2] = (int)(205*noise(t*10+2));

    // new speed
    speedX[speedX.length-2] = round(sC/(mouseX-startX));
    speedY[speedY.length-2] = round(sC/(mouseY-startY));
  }
}


void repell(int i, int k) {
  int edgrep = 200;
  if ((dist(xpos[i], ypos[i], xpos[k], ypos[k]) < 200) && (dist(xpos[i], ypos[i], xpos[k], ypos[k]) > 20)) {
    speedX[i] = speedX[i] + (xpos[i] - xpos[k]) * scc / pow((dist(xpos[i], ypos[i], xpos[k], ypos[k])), 2);
    speedY[i] = speedY[i] + (ypos[i] - ypos[k]) * scc / pow((dist(xpos[i], ypos[i], xpos[k], ypos[k])), 2);
  }
  if ((abs(xpos[i]-xpos[k]) < (maxX[i]+maxX[k])/1.5) && (abs(ypos[i]-ypos[k]) < (maxY[i]+maxY[k])/1.5)) {
    speedX[i] = speedX[i] + (xpos[i] - xpos[k]) * 8 * scc / pow((dist(xpos[i], ypos[i], xpos[k], ypos[k])), 2);
    speedY[i] = speedY[i] + (ypos[i] - ypos[k]) * 8 * scc / pow((dist(xpos[i], ypos[i], xpos[k], ypos[k])), 2);
    if ((xpos[i] + speedX[i]+ maxX[i]/2 > width-10) ) {
      speedX[i] = speedX[i] - edgrep;
    }
    if ((xpos[i] + speedX[i] - maxX[i]/2 < 10)) {
      speedX[i] = speedX[i] + edgrep;
    }
    if ((ypos[i] + speedY[i] + maxY[i]/2 > height-10)) {
      speedY[i] = speedY[i] - edgrep;
    }
    if ((ypos[i] + speedY[i] - maxY[i]/2 < 10)) {
      speedY[i] = speedY[i] + edgrep;
    }
  }
}










