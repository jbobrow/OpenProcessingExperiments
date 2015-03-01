
int iceNum = 3, nowIce = 0;
float[] iceHeights = new float[iceNum];   // the limit of ice heights
float[] nowIceHeight = new float[iceNum]; // now height of dropping icecreams
float[] nowIceX = new float[iceNum];      // now x offset of icecreams
float[] nowIceY = new float[iceNum];      // now y offset of icecreams
color[] iceColors = new color[iceNum];    // now color of icecreams
color megane = color(244, 175, 0), beak = color(255, 255, 0);

void setup()
{
  size(600, 800, P3D);
  initValues();
  lights();
  smooth();
}


void draw()
{
  colorMode(HSB, 360, 100, 100);
  float backcolor = map(mouseX, 0, width, 0, 360);
  background(backcolor, 10, 100);

  float lx=0, ly=0, lz=1;

  float x= random(0, 600);
  float y= random(0, 300);
  float z= random(0, 600);

  float rx= random(0, 10);
  float ry= random(0, 10);
  float rz= random(0, 10);


  float sx= random(0, 10);
  float sy= random(0, 10);
  float sz= random(0, 10);

  float cx= (ry*sz-ry*sy);
  float cy= -(rx*sz-rz*sx);
  float cz= (rx*sy-ry*sx);

  float size = sqrt(cx*cx+cy*cy+cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;


  stroke(360-backcolor, 100, 100);
  strokeWeight(25);
  noFill();
  beginShape();
  vertex(x, y, x);
  vertex(x+rx, y+ry, z+rz);
  vertex(x+sx, y+sy, z+sz);
  endShape();

  translate(width/2, height/4*3, 0);
  rotateX(radians(-100));

  //rotateY(radians(mouseY));
  rotateZ(radians(mouseX));

  noStroke();
  fill(40, 60, 83);

  if (nowIceHeight[nowIce]<iceHeights[nowIce])
    nowIceHeight[nowIce] +=50; // dropping down icecream
  else if (nowIceHeight[nowIce]>=iceHeights[nowIce]) {
    if (nowIce<(iceNum-1)) nowIce++; // after one icecream reached, make next icecream dropping down
  }

  // draw cone
  stroke(40, 61, 70);
  strokeWeight(5);
  drawCylinder(25, 80, 0, 200);


  //draw iceCream at every frame
  noStroke();
  for (int i=0; i<iceNum; i++) { 
    drawIcecream(nowIceX[i], -i*80+nowIceY[i], nowIceHeight[i], 100 - i*20, i);
  }
}

void mousePressed() {
  initValues();
}

//set Values about iceCreams
void initValues() {
  iceNum = (int)random(1, 4);
  nowIce = 0;
  colorMode(HSB, 360, 100, 100);
  for (int i =0; i<iceNum; i++) {
    nowIceHeight[i] = -800; // set every starting point as -800 (out of canvas)

    // set x, y offset of each icecream
    if (i==0) {
      nowIceX[i] = 0;
      nowIceX[i] = 0;
    } else {
      nowIceX[i] = random(-50+i*10, 50-i*10); // i*10 means correction value
      nowIceY[i] = random(-50+i*10, 50-i*10);
    }

    // set height-limit of each icecream
    iceHeights[i] = - 175 -i*92; // i*100 means correction value
    // set color of each icecream
    iceColors[i] = color(random(0, 360), 43, 100);
  }
  colorMode(RGB, 255, 255, 255);
}


//
// functions
// 

void drawCylinder( int sides, float r1, float r2, float h)
{
  float angle = 360 / sides;
  float halfHeight = h / 2;
  // top
  beginShape();
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r1;
    float y = sin( radians( i * angle ) ) * r1;
    vertex( x, y, -halfHeight);
  }
  endShape(CLOSE);
  // bottom
  beginShape();
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r2;
    float y = sin( radians( i * angle ) ) * r2;
    vertex( x, y, halfHeight);
  }
  endShape(CLOSE);
  // draw body
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 2; i++) {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    vertex( x1, y1, -halfHeight);
    vertex( x2, y2, halfHeight);
  }
  endShape(CLOSE);
}

void drawIcecream(float x, float y, float z, float radius, int num) {
  translate(x, y, z);

  //drawBody
  colorMode(HSB, 360, 100, 100);
  fill(iceColors[num]);
  sphere(radius); 


  //draw eyes
  colorMode(RGB, 255, 255, 255);
  fill(0); 
  noStroke();
  translate(radius/5*2, radius, 0);
  sphere(radius/15);
  rotateX(radians(90));
  stroke(megane);
  strokeWeight(5);
  noFill();
  ellipse(0, 0, radius/2, radius/2);
  rotateX(radians(-90));

  translate(-radius/5*4, 0, 0);
  fill(0); 
  noStroke();
  sphere(radius/15);
  rotateX(radians(90));
  stroke(megane);
  noFill();
  ellipse(0, 0, radius/2, radius/2);
  rotateX(radians(-90));

  noStroke();

  fill(megane);
  translate(radius/5*2, -radius/10, 0);
  drawCylinder(10, radius/5, radius/5, 3);

  fill(beak);
  translate(0, radius/10, radius/5);
  drawCylinder(10, radius/5, radius/5, 6);

  //reset axis
  translate(-x, - y, -z-radius/5);
}

