
float posX, posY, posXa, posYa, posXb, posYb, posXc, posYc, posXd, posYd;



float dX;
float dY;

float prevX, prevXa, prevXb, prevXc, prevXd;
float prevY, prevYa, prevYb, prevYc, prevYd;

float rectX = width/4;
float rectY = height/4;
float rectW = width/2;
float rectH = height/2;

void setup() {
  size(1000, 1000);
  background(0);
  posX = random(0, width);
  posXa = random(0, width);
  posXb = random(0, width);
  posXc = random(0, width);
  posXd = random(0, width);
  posY = posYa = posYb = posYc = posYd = height;
  prevX = posX;
  prevY = posY;
}

void draw() {


  // for (int i = 0; i < 100; i++) {

  // }



  noStroke();






  rectMode(CENTER);


  drawWalker(-20, 20, -40, 0);

  aWalker(-10, 10, -30, 0);

  bWalker(-6, 6, -35, 0);

  cWalker(-35, 35, -20, 0);

  dWalker(-25, 25, -20, 0);

  if (frameCount % 60 == int(random(15, 20))) {


    pulse(posX, posY, 10, 10, 150);
  }
  
    if (frameCount % 70 == int(random(35, 40))) {


    pulse(posXc, posYc, 10, 10, 150);
  }
  
  if (keyPressed) {
    if (key == 's') {
      saveFrame();
    }
  }
  
    
  
}
//  for (int x = 0; x < width; x += 20) {
//    for (int y = 0; y < height; y += 20) {
//      color c = int(map(mouseY, 0,height, 0,255));
//      fill (c);
//      drawAngledRect(x, y, 10, 10, mouseX);
//    }
//  }
//}
//
//
//float myLazyEquation (float a, float b, float c) {
//  float myFloat = a+b+c;
//  return myFloat;
//}

//void drawAngledRect(float x, float y, float w, float h, float angle) {
//  pushMatrix();
//  translate(x, y);
//  rotate(radians(angle));
//  rect(0, 0, w, h);
//  popMatrix();
//}

// for inflexible drawwalker, no arguments between parenthesis, just actual values beneath -- then values not specified in draw function)

void pulse (float pulseX, float pulseY, float pulseW, float pulseH, float pulseA) {


  strokeWeight (20);
  stroke (100, 200, 255, pulseA -= 10);
  fill (255, 0);
  ellipse (pulseX, pulseY, pulseW+20, pulseH+20);
}



void drawWalker(float dXRangeMin, float dXRangeMax, float dYRangeMin, float dYRangeMax) {

  point(posX, posY);

  dX = random(dXRangeMin, dXRangeMax);
  dY = random (dYRangeMin, dYRangeMax);

  if ( posX < 0 ) {
    posX=width;
    prevX=width;
  } else if (posX>width) {
    posX=0;
    prevX=0;
  }
  if ( posY < 0 ) {
    posY=height;
    prevY=height;
  } else if (posY>height) {
    posY=0;
    prevY=0;
  }

  posX+= dX;
  posY += dY;

  float c = dist(posX, posY, prevX, prevY);
  float cc = map(c, 0, dXRangeMax-dXRangeMin, 50, 150);
  float weight = map(c, 0, dXRangeMax-dXRangeMin, 1, 5);
  
  float sparkW = random(10,30);
  float sparkH = random(10,30);

  strokeWeight(weight);
  stroke(cc, 50);
  //line(posX, posY, prevX, prevY);

  noStroke();
  fill(255, 250, 200, cc);
  ellipse(posX, posY, sparkW, sparkH);
  
  for (int i = 0; i <100; i+=int(random(9,11))) {
     fill(255 - i*4, 230 - i*4, 0, 150 - i);
    float amp = dXRangeMax-dXRangeMin;
    float freq = .2;
    float sine = sin((frameCount + i) * freq);
 
  ellipse(posX + sine * amp, posY+i, sparkW+(i*.1), sparkH+(i*.1));
  }

  prevX = posX;
  prevY = posY;

  //  if (posX > rectX && posX < rectX+rectW && posY > rectY && posY < rectH+posY) {
  //    return true;
  //  } else {
  //    return false;
  //  }
}
void aWalker(float dXRangeMin, float dXRangeMax, float dYRangeMin, float dYRangeMax) {

  point(posXa, posYa);

  dX = random(dXRangeMin, dXRangeMax);
  dY = random (dYRangeMin, dYRangeMax);

  if ( posXa < 0 ) {
    posXa=width;
    prevXa=width;
  } else if (posXa>width) {
    posXa=0;
    prevXa=0;
  }
  if ( posYa < 0 ) {
    posYa=height;
    prevYa=height;
  } else if (posYa>height) {
    posYa=0;
    prevYa=0;
  }

  posXa += dX;
  posYa += dY;

  float c = dist(posXa, posYa, prevXa, prevYa);
  float cc = map(c, 0, dXRangeMax-dXRangeMin, 0, 255);
  float weight = map(c, 0, dXRangeMax-dXRangeMin, 1, 5);

  strokeWeight(weight);
  stroke(cc, 50);
  //line(posXa, posYa, prevXa, prevYa);

  noStroke();
  fill(255, 0, 0, 100);
  ellipse(posXa, posYa, random(10,30), random(10,30));

  prevXa = posXa;
  prevYa = posYa;

  //  if (posXa > rectX && posXa < rectX+rectW && posYa > rectY && posYa < rectH+posYa) {
  //    return true;
  //  } else {
  //    return false;
  //  }
}
void bWalker(float dXRangeMin, float dXRangeMax, float dYRangeMin, float dYRangeMax) {

  point(posXb, posYb);

  dX = random(dXRangeMin, dXRangeMax);
  dY = random (dYRangeMin, dYRangeMax);

  if ( posXb < 0 ) {
    posXb=width;
    prevXa=width;
  } else if (posXb>width) {
    posXb=0;
    prevXa=0;
  }
  if ( posYb < 0 ) {
    posYb=height;
    prevYb=height;
  } else if (posYb>height) {
    posYb=0;
    prevYb=0;
  }

  posXb += dX;
  posYb += dY;

  float c = dist(posXb, posYb, prevXa, prevYb);
  float cc = map(c, 0, dXRangeMax-dXRangeMin, 0, 255);
  float weight = map(c, 0, dXRangeMax-dXRangeMin, 1, 5);

  strokeWeight(weight);
  stroke(cc, 50);
  //line(posXb, posYb, prevXa, prevYb);

  noStroke();
  fill(255, 0, 0, 100);
  ellipse(posXb, posYb, random(10,30), random(10,30));

  prevXa = posXb;
  prevYb = posYb;

  //  if (posXb > rectX && posXb < rectX+rectW && posYb > rectY && posYb < rectH+posYb) {
  //    return true;
  //  } else {
  //    return false;
  //  }
}
void cWalker(float dXRangeMin, float dXRangeMax, float dYRangeMin, float dYRangeMax) {

  point(posXc, posYc);

  dX = random(dXRangeMin, dXRangeMax);
  dY = random (dYRangeMin, dYRangeMax);

  if ( posXc < 0 ) {
    posXc=width;
    prevXa=width;
  } else if (posXc>width) {
    posXc=0;
    prevXa=0;
  }
  if ( posYc < 0 ) {
    posYc=height;
    prevYc=height;
  } else if (posYc>height) {
    posYc=0;
    prevYc=0;
  }

  posXc += dX;
  posYc += dY;

  float c = dist(posXc, posYc, prevXa, prevYc);
  float cc = map(c, 0, dXRangeMax-dXRangeMin, 0, 255);
  float weight = map(c, 0, dXRangeMax-dXRangeMin, 1, 5);

  strokeWeight(weight);
  stroke(cc, 50);
  //line(posXc, posYc, prevXa, prevYc);

  noStroke();
  fill(255, 0, 0, 100);
  ellipse(posXc, posYc, random(10,30), random(10,30));

  prevXa = posXc;
  prevYc = posYc;

  //  if (posXc > rectX && posXc < rectX+rectW && posYc > rectY && posYc < rectH+posYc) {
  //    return true;
  //  } else {
  //    return false;
  //  }
}
void dWalker(float dXRangeMin, float dXRangeMax, float dYRangeMin, float dYRangeMax) {

  point(posXd, posYd);

  dX = random(dXRangeMin, dXRangeMax);
  dY = random (dYRangeMin, dYRangeMax);

  if ( posXd < 0 ) {
    posXd=width;
    prevXd=width;
  } else if (posXd>width) {
    posXd=0;
    prevXd=0;
  }
  if ( posYd < 0 ) {
    posYd=height;
    prevYd=height;
  } else if (posYd>height) {
    posYd=0;
    prevYd=0;
  }

  posXd+= dX;
  posYd += dY;

  float c = dist(posXd, posYd, prevXd, prevYd);
  float cc = map(c, 0, dXRangeMax-dXRangeMin, 50, 150);
  float weight = map(c, 0, dXRangeMax-dXRangeMin, 1, 5);

  float sparkW = random(10, 30);
  float sparkH = random(10, 30);

  strokeWeight(weight);
  stroke(cc, 50);
  //line(posXd, posYd, prevXd, prevYd);

  noStroke();
  fill(255, 250, 200, cc);
  ellipse(posXd, posYd, sparkW, sparkH);

  for (int i = 0; i <100; i+=int (random (9, 11))) {
    fill(255, 230 - i*4, 0, 100 - i);
    float amp = dXRangeMax-dXRangeMin;
    float freq = .2;
    float sine = sin((frameCount + i) * freq);

    ellipse(posXd + sine * amp, posYd+i, sparkW+(i*.1), sparkH+(i*.1));
  }

  prevXd = posXd;
  prevYd = posYd;

  //  if (posXd > rectX && posXd < rectX+rectW && posYd > rectY && posYd < rectH+posYd) {
  //    return true;
  //  } else {
  //    return false;
  //  }
}



