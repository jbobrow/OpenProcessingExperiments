
import processing.opengl.*;
import org.openkinect.*;
import org.openkinect.processing.*;
import saito.objloader.*;
import superCAD.*;

Kinect kinect;

float a = 0;

int w = 640;
int h = 480;

int minDepth = 0;
int maxDepth = 970;

int cut_l = 190;
int cut_r = 430;

float init_rotX = -0.54999983;
float rotX = init_rotX;
float rotY = 0.010000015;

int move_z = 210;
int model_z = -250;

PImage grad;

PFont ocr;

boolean record;
String record_id;

OBJModel model;

int[] depth;
boolean capture;
int capture_start;
int capture_seconds = 10;

void setup() {
  size(960, 640, P3D);
  kinect = new Kinect(this);
  kinect.start();
  kinect.enableDepth(true);
  kinect.processDepthImage(false);
  depth = kinect.getRawDepth();

  ocr = loadFont("OCRAStd-100.vlw");
  textFont(ocr, 100);

  model = new OBJModel(this, "carbonite.obj", "absolute", TRIANGLES);
  model.scale(5);
  model.translateToCenter();
  model.disableMaterial();

  color c1 = color(255, 255, 255);
  color c2 = color(100, 100, 100);
  grad = generateGradient(c1, c2, width, height);

  record_id = year() + "" + month() + "" + day() + "_" + hour() + "" + minute() + "" + second();

  capture = true;
  capture_start = millis();
}

void draw() {
  background(grad);
  fill(255);

  int capture_state = capture_seconds - (int)((millis()-capture_start)/1000.0);
  if (capture_state > 0)
  {
    capture = true;
  }
  else if (capture_state == 0)
  {
    capture = false;
    a = init_rotX;
    beginRaw("superCAD.ObjFile", record_id + ".obj");
  }

  if (capture == true)
  {
    depth = kinect.getRawDepth();
    text(capture_state, 10, 100);
  }

  // Kinect resolution
  int skip = 1;

  // camera
  translate(width/2, height/2, move_z+model_z);
  if (capture == true)
  {
    rotateX(rotY);
    rotateY(rotX);
  }
  else
    rotateY(sin(a));
  translate(0, 0, -model_z);

  noStroke();
  fill(150, 150, 160);
  pushMatrix();
  translate(0, 0, model_z);
  spotLight(255, 255, 255, 0, -100, 800, 0, 0, -1, PI/4, 20);

  rotateZ(1.57);
  model.draw();
  popMatrix();

  int min_d = 10000;
  int max_d = 0;

  translate(-w/2, -h/2, 700);

  for (int x=0; x<w-skip; x+=skip) {
    for (int y=0; y<h-skip; y+=skip) {

      if (x > cut_l && x < cut_r)
      {

        pushMatrix();
        noStroke();
        //stroke(100);
        fill(120, 120, 130);

        translate(x, y, 0);

        beginShape();
        int d = depth[x+y*w];
        if (d > max_d)
          max_d = d;
        if (d < min_d)
          min_d = d;
        if (d > minDepth && d < maxDepth)
          vertex(-skip/2.0, -skip/2.0, -d );
        //else
        //  vertex(-skip/2.0, -skip/2.0, -maxDepth );
        d = depth[x+skip+y*w];
        if (d > minDepth && d < maxDepth)
          vertex(skip/2.0, -skip/2.0, -d );
        //else
        //  vertex(skip/2.0, -skip/2.0, -maxDepth );
        d = depth[x+skip+(y+skip)*w];
        if (d > minDepth && d < maxDepth)
          vertex(skip/2.0, skip/2.0, -d );
        //else
        //  vertex(skip/2.0, -skip/2.0, -maxDepth );
        d = depth[x+(y+skip)*w];
        if (d > minDepth && d < maxDepth)
          vertex(-skip/2.0, skip/2.0, -d );
        //else
        //  vertex(skip/2.0, -skip/2.0, -maxDepth );

        endShape(CLOSE);

        popMatrix();
      }
    }
  }

  if (record == true)
    saveFrame(record_id + "_####.tif");

  if (capture_state == 0)
  {
    endRaw();
  }

  a -= 0.05;
}

// These functions come from: http://graphics.stanford.edu/~mdfisher/Kinect.html
float rawDepthToMeters(int depthValue) {
  if (depthValue < 2047) {
    return (float)(1.0 / ((double)(depthValue) * -0.0030711016 + 3.3309495161));
  }
  return 0.0f;
}

void stop() {
  kinect.quit();
  super.stop();
}

void keyPressed() {
  if (key == 'q')
  {
    minDepth += 10;
  }
  else if (key == 'a')
  {
    minDepth -= 10;
  }
  else if (key == 'w')
  {
    maxDepth += 10;
  }
  else if (key == 's')
  {
    maxDepth -= 10;
  }
  else if (key == 'f')
  {
    cut_l -= 5;
  }
  else if (key == 'g')
  {
    cut_l += 5;
  }
  else if (key == 'v')
  {
    cut_r -= 5;
  }
  else if (key == 'b')
  {
    cut_r += 5;
  }
  else if (key == '+')
  {
    move_z += 10;
    println("move_z: " + move_z);
  }
  else if (key == '-')
  {
    move_z -= 10;
    println("move_z: " + move_z);
  }
  else if (key == 'e')
  {
    model_z += 10;
    println("model_z: " + model_z);
  }
  else if (key == 'd')
  {
    model_z -= 10;
    println("model_z: " + model_z);
  }
  else if (key == ' ')
  {
    if (record == true)
      record = false;
    else
      record = true;
    println("record: " + record);
  }
  else if (key == 'c')
  {
    capture = true;
    capture_start = millis();
  }
}

void mouseDragged()
{
  rotX += (mouseX - pmouseX) * 0.01;
  rotY -= (mouseY - pmouseY) * 0.01;
  println("rotX: " + rotX + " / rotY: " + rotY);
}

PImage generateGradient(color top, color bottom, int w, int h) {
  int tR = (top >> 16) & 0xFF;
  int tG = (top >> 8) & 0xFF;
  int tB = top & 0xFF;
  int bR = (bottom >> 16) & 0xFF;
  int bG = (bottom >> 8) & 0xFF;
  int bB = bottom & 0xFF;

  PImage bg = createImage(w, h, RGB);
  bg.loadPixels();
  for (int i=0; i < bg.pixels.length; i++) {
    int y = i/bg.width;
    float n = y/(float)bg.height;
    // for a horizontal gradient:
    // float n = x/(float)bg.width;
    bg.pixels[i] = color(
    lerp(tR, bR, n), 
    lerp(tG, bG, n), 
    lerp(tB, bB, n), 
    255);
  }
  bg.updatePixels();
  return bg;
}


