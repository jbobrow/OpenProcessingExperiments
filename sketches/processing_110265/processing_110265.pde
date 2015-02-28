
// Written: Michal Huller
// Date: Sep 2013
// Desc: Dynamic fabric design
// It looks enbroidery or knitted and was ment for decoration


// Each pallete is transformed into three parallel
// palettes for dark, original and lighter colors
// to create 3D like style

////////////////////// instructions //////////////////////
// hit the "n" key to swich to the next pallete
//////////////////////////////////////////////////////////

color myPallete[][] = {
  // brown-grey - winter
  {#522C32, #8C6060, #969CB6, #585373, #D6B8A2}
  , // cool
  {#999471, #5BC1CC, #E5F6FF, #FFBE38, #CCB619}
  , // vintage
  {#08B2A8, #FFB48D, #FF7E3B, #B24209, #73FFF7}
  , // purple
  {#785A8C, #BDCFF2, #BFAA69, #D9BF8F, #734432} 
  , // original - summer
  {#D64841, #FF9F50, #FFF1BD, #A9EB6C, #8DD974}
  , // with yellows
  {#FFBF2D, #F5861E, #AC3C5A, #892143, #472B5D}
  , // green and grey
  {#3D3938, #DB5F04, #EFEFEF, #71AD23, #387C2B}
};


int grad = 16;
int pltNum;
int currPlt = 0;
color shade[];
color lightit[];

float tolerance = 18.2;

void setup() {
  size(800, 600);
  smooth();
  pltNum = myPallete.length;
  initPallete();
  noLoop();
}

void draw() {
  background(shade[0]);
  // array of dots on the background
  stroke(myPallete[currPlt][0]);
  for (int ix=0; ix < width; ix+=10) {
    for (int iy=0; iy < height; iy+=10) {
      strokeWeight(int(random(1, 6)));
      point(ix, iy);
    }
  }

  // draw frunzy stitches
  float poinsx, poinex;
  float poinsy, poiney;
  int r;
  float strip = 0;
  while (strip < height + 150) {
    for (int i=0; i< 400; i++) {
      poinsx = random(width);
      poinsy = random(strip, strip+40);
      poinex = poinsx + random(-tolerance, tolerance);
      poiney = poinsy + random(-tolerance, tolerance);
      r = int(random(1, 5)); // choose color index

      // draw stitch
      strokeWeight(4);
      stroke(myPallete[currPlt][r]);
      line(poinsx, poinsy, poinex, poiney); 
      strokeWeight(2);
      stroke(shade[r]);
      line(poinsx+2, poinsy+2, poinex+2, poiney+2);
      strokeWeight(5);
      point(poinsx, poinsy);
      stroke(lightit[r]);
      strokeWeight(2);
      line(poinsx-2, poinsy-2, poinex-2, poiney-2);
      strokeWeight(5);
      point(poinex, poiney);
    }

    // draw strait stitch line in between frunzy stitches
    float stlen = 15;
    float mid = 90;
    int colix = 1;
    float spaces = 60;
    for (int i=0; i*spaces <= width; i++) {
      strokeWeight(4);
      stroke(myPallete[currPlt][colix]);
      line(i*spaces, strip+mid, i*spaces + stlen, strip+mid +2); 
      strokeWeight(2);
      stroke(shade[colix]);
      line(i*spaces +2, strip+mid +2, i*spaces + stlen +2, strip+mid +4);
      strokeWeight(5);
      point(i*spaces, strip+mid);
      strokeWeight(2);
      stroke(lightit[colix]);
      line(i*spaces -2, strip+mid -2, i*spaces + stlen -2, strip+mid );
      strokeWeight(5);
      point(i*spaces + stlen, strip+mid+2);

      // dot stitches
      strokeWeight(9);
      stroke(myPallete[currPlt][colix+2]);
      point(i*spaces + stlen*2, strip+mid +2);
      strokeWeight(6);
      stroke(lightit[colix+2]);
      point(i*spaces + stlen*2, strip+mid +2);
      strokeWeight(4);
      stroke(shade[colix+2]);
      float disp = random(-1.0, 1.1);
      point(i*spaces + stlen*2 +disp, strip+mid +2 +disp);
    } 
    strip += 150;
  }
  // Price label
  noStroke();  
  fill(0, 90);
  rect(120+5, height/5+5, 120, 60, 8);  
  fill(250); 
  rect(120, height/5, 120, 60, 8);

  fill(0);
  textSize(20);
  text("Price 20$", 128, height/5+45);
  ellipse(130, height/5+10, 8, 8);

  // ring for the price ticket
  stroke(#FFF1BD);
  noFill();
  strokeWeight(2);
  arc(120, height/5, 30, 30, -PI/2, PI/4);
  arc(120, height/5, 30, 30, PI/2 +0.05, 3*PI/2 -1.2);
}

void initPallete() {
  int maxcol = myPallete[currPlt].length;
  shade = new color[maxcol];
  lightit = new color[maxcol];
  for (int i=0; i < maxcol; i++) {
    shade[i] = color(int(constrain(red(myPallete[currPlt][i]) -grad, 0, 255)), 
    int(constrain(green(myPallete[currPlt][i]) -grad, 0, 255)), 
    int(constrain(blue(myPallete[currPlt][i]) -grad, 0, 255)));
    lightit[i] = color(int(constrain(red(myPallete[currPlt][i]) +grad, 0, 255)), 
    int(constrain(green(myPallete[currPlt][i]) +grad, 0, 255)), 
    int(constrain(blue(myPallete[currPlt][i]) +grad, 0, 255)));
  }
}

void keyPressed() {
  if (key == 'n' || key == 'N') {
    currPlt = (currPlt + 1) % pltNum;
    initPallete();
    redraw();
  }
}



