
/*  -- this requires PeasyCam to work
    -- get it here -> http://mrfeinberg.com/peasycam/

 Homework 3: Motion
 Jack Langerman
 due: 9/12/1
 
 'w':  sphereRad++
 's':  ellipseRad--
 'e':  gridSpace++
 'd':  gridSpace--
 'r':  noise++
 'f':  noise--
 ' ':  see original image
 'l':  toggle lights
 
 click and draw to move around
 mouse wheel to zoom
 */

import peasy.*;

PeasyCam cam;


int ellipseRad=10, gridSpace=15, noise=0;
int typeOfNoise = 0;

color bgColor = color(0); //color(255, 0, 0);

float phi = 1.618033988749894848204586834;
PImage img;


boolean dotting = true;

void setup() {
  size(777, 480, P3D);
  PGraphics canvas = createGraphics(width, height);

  //CHANGE WHICH LINE IS COMMENTED TO DRAW A DIFFERANT IMAGE

  //drawTriangle(canvas);
  //drawFullTriangle(canvas);
  drawRings(canvas);

  cam = new PeasyCam(this, width);
  cam.setMinimumDistance(160);
  cam.setMaximumDistance(2*width);

  //
  img = canvas.get();
  //img = createImage(width, height, RGB);
  //img = loadImage("Seymour_Papert.jpg");

  //img.filter(INVERT);

  // noLoop();

  sphereDetail(10);

  print("'w':  ellipseRad++\n's':  ellipseRad--\n'e':  gridSpace++\n'd':  gridSpace--\n'r':  noise++\n'f':  noise--\n");
  
}

void draw() {
  translate(-width/2, -height/2);
  //image(img, 0, 0);
  //lights();

  //directionalLight(v1, v2, v3, nx, ny, nz)


  background(bgColor);
  //  directionalLight(0, 0, -100,   0, 1, 0);
  if (dotting) img = dotify(img, ellipseRad, gridSpace, noise);
  else image(img, 0, 0);
}


PImage dotify(PImage img, int ellipseWidth, int gridSpacing, int noise) {
  pushStyle();
  noStroke();
  img.loadPixels();
  for (int x=0; x<width; x+=gridSpacing) {
    for (int y=0; y<height; y+=gridSpacing) {
      color c = img.pixels[y*img.width + x];
      pushMatrix();
      fill(c);

      // ellipse(x+random(-noise, noise), y+random(-noise, noise), ellipseWidth, ellipseWidth);

      float z = map(brightness(c), 0, 255, -10, 50);

      switch(typeOfNoise) {
      case 0: 
        translate(x+random(-noise, noise), y+random(-noise, noise), random(-noise, noise) + map(brightness(c), 0, 255, -10, 30));
        break;
      case 1: 
        translate(x+randomGaussian()*noise, y+randomGaussian()*noise, randomGaussian()*noise + map(brightness(c), 0, 255, -10, 30));
        break;
      case 2: 
        translate(x+noise(x, y, z)*noise, y+noise(x, y, z)*noise, z+noise(x, y, z)*noise);
        break;
      }
      sphere(ellipseWidth);

      popMatrix();
      //println("("+x+", "+y+")  b: "+brightness(c));
    }
  }
  popStyle();
  return img.get();
}


void drawTriangle(PGraphics canvas) {
  canvas.beginDraw();
  canvas.strokeWeight(15);
  canvas.background(255);
  canvas.line(0, 78, 263, height);
  canvas.line(263, height, 720, 0);
  canvas.line(720, 0, 0, 78);
  canvas.endDraw();
}

void drawFullTriangle(PGraphics canvas) {
  canvas.beginDraw();
  canvas.strokeWeight(15);
  canvas.background(255);
  canvas.fill(0);
  canvas.stroke(0);
  canvas.beginShape();
  canvas.vertex(0, 78);
  canvas.vertex(263, height);
  canvas.vertex(720, 0);
  canvas.vertex(0, 78);
  canvas.endShape();
  canvas.endDraw();
}

void keyPressed() {
  switch(key) {
  case 'w':  
    ellipseRad++; 
    break;
  case 's':  
    ellipseRad--; 
    break;
  case 'e':  
    gridSpace++; 
    break;
  case 'd':  
    gridSpace--; 
    break;
  case 'r':  
    noise++; 
    randomize(); 
    break;
  case 'f':  
    noise--; 
    randomize(); 
    break;
  case ' ': 
    dotting = !dotting; 
    break;
  case TAB:
    typeOfNoise = (typeOfNoise+1)%3; 
    break;
  }
  print("ellipseRad: "+ellipseRad+" gridSpace: "+gridSpace+" noise: "+noise);
  switch(typeOfNoise) {
  case 0: 
    println("  random"); 
    break;
  case 1: 
    println("  gaussian"); 
    break;
  case 2: 
    println("  perlin"); 
    break;
  }
  redraw();
}

void randomize() {
}

void drawRings(PGraphics canvas) {
  canvas.beginDraw();
  canvas.noStroke();
  canvas.translate(canvas.width/2, canvas.height/2);
  int numRings = 200;
  for (int i=0; i<numRings; i++) {
    int w = canvas.width/numRings;
    int h = canvas.height/numRings;

    float c = map(i, 0, numRings, 0, 255) + 50*sin(map(i%(numRings/4), 0, numRings/4, 0, TWO_PI));

    canvas.fill(c, 0, 255-c);
    canvas.ellipse(0, 0, canvas.width-i*w, canvas.height-i*h);
  }
  canvas.endDraw();
}
