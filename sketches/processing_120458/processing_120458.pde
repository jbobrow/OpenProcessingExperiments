
//Abstract spring
//Stella Wang, Tainan, 2013/11/13


float xstart, xnoise, ystart, ynoise, xstartNoise, ystartNoise;
float happyX=0, happyY=0;
void setup() {
  size(500, 300, P3D);
  background(255);
  sphereDetail(8);
  noStroke();
  xstart = random(10);
  ystart = random(10);
}
void draw() {
  background(100, 210, 230);


  xstart += 0.01;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;



  /*
  xstartNoise += 0.01;
   ystartNoise += 0.01;
   xstart +=(noise(xstartNoise)*0.5)-0.25;
   ystart +=(noise(ystartNoise)*0.5)-0.25;
   xnoise = xstart;
   ynoise = ystart;
   */

  for (int y = 0; y <= height-160; y+=8) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= 160+width; x+=5) {
      xnoise += 0.1;
      //      drawPoint1(x, y, noise(xnoise, ynoise));
    }
  }

  happyX=happyX+1;

  for (int y = 0; y <= height-160; y+=100) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= 2000+width; x+=100) {
      xnoise += 0.1;
      //float n =noise(10)*100;
      drawPoint2(x-happyX, y, noise(xnoise, ynoise));
    }
  }


  for (int y = 0; y <= height-160; y+=8) {
    ynoise += 0.05;
    xnoise = xstart;
    for (int x = 0; x <= 260+width; x+=5) {
      xnoise += 0.05;
      drawPoint3(x, y, noise(xnoise, ynoise));
    }
  }
}  




void drawPoint2(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x-130, 100-y, -y-100);
  rotate(noiseFactor*radians(300));
  float d = noiseFactor * 70;
  //  float ye = 150 + (noiseFactor * 120);
  float alph = 50 + (noiseFactor * 120);
  fill(255);
  ellipse(0, 0, d, d/6);
  rotate(30);
  ellipse(d*2, 0, d/2, d/12);
  popMatrix();
}




void drawPoint3(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x-150, 235-y, -y);
  rotate(noiseFactor*radians(300));
  float d = noiseFactor*100 ;
  float gr = 70 +noiseFactor*90 ;
  float a = noiseFactor*60 ;
  noStroke();
  fill(255, 150+gr, 10, a*2);
  ellipse(0, 0, d, d/12); 
  popMatrix();
}


void drawPoint1(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x-80, 235-y, 150-y);
  rotate(noiseFactor*radians(10));
  float d = noiseFactor*110 ;
  float cloud = 170 +noiseFactor*90 ;
  float a = noiseFactor*60 ;
  noStroke();
  fill(50, 200, cloud, a);
  ellipse(0, 0, d, d/3); 
  popMatrix();
}



