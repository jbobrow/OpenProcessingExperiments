
/*
One Line Visualization (OLViz)
 
 Generates visualization of a text.
 
 Author: 
 Sami Salkosuo
 
 */
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.math.BigInteger;

String WORD="WORD";

int frameWidth = 800;
int frameHeight = 800;

int centerX = frameWidth / 2;
int centerY = frameHeight / 2;
float rotateOffset = 0.1;
int frame = 0;
int totalFrames = 314;

PVector lineVector;
PVector colorVector;

int  ROTATE_X=0;
int  ROTATE_Y=1;
int  ROTATE_Z=2;

int axis1Rotation;
int axis2Rotation;
int axis3Rotation;

public void setup() {
  size(800, 800, P3D);
  background(0);
  long seed = 1;

  colorMode(RGB, 1f);

  try { 
    MessageDigest
      digest=MessageDigest.getInstance("MD5"); 
    byte[] hash=digest.digest(WORD.getBytes());

    BigInteger bi=new BigInteger(hash); 
    BigInteger bi2=new BigInteger("0000000000000000ffffffffffffffff", 16);

    long upperMD5=bi.xor(bi2).longValue();
    long lowerMD5=bi.shiftRight(64).xor(bi2).longValue(); 
    seed = upperMD5 ^ lowerMD5;
  } 
  catch (NoSuchAlgorithmException e) { 
    println(e.toString());
  }
  println("seed: "+seed);
  randomSeed(seed);

  int[] xyz = {
    ROTATE_X, ROTATE_Y, ROTATE_Z
  };
  axis1Rotation = xyz[(int) random(xyz.length)];
  axis2Rotation = xyz[(int) random(xyz.length)];
  axis3Rotation = xyz[(int) random(xyz.length)];
  println("Rotate 1: " + axis1Rotation);
  println("Rotate 2: " + axis2Rotation);
  println("Rotate 3: " + axis3Rotation);
  populateArray();
}

public void draw() {
  if (frame >= totalFrames) {
    save("WORD.png");
    noLoop();
    return;
  }
  noFill();
  translate(centerX, centerY);
  frame++;
  float rotation = rotateOffset * frame;
  rotate(axis1Rotation, rotation);
  rotate(axis2Rotation, rotation);
  rotate(axis3Rotation, rotation);

  beginShape(LINES);

  stroke(colorVector.x, colorVector.y, colorVector.z);
  vertex(0, 0, 0);
  vertex(lineVector.x, lineVector.y, lineVector.z);
  endShape();
}

private void rotate(int axis, float rotation) {
  switch (axis) {
  case 0:
    rotateX(rotation);
    break;
  case 1:
    rotateY(rotation);
    break;
  case 2:
    rotateZ(rotation);
    break;
  }
}

private void populateArray() {
  float x = 0;
  float y = 0;
  float z = 0;

  float colorR = 0.5f;
  float colorG = 0.5f;
  float colorB = 0.5f;

  colorR = random(1.0f);
  println("ColorR: " + colorR);
  colorG = random(1.0f);
  println("ColorG: " + colorG);
  colorB = random(1.0f);
  println("ColorB: " + colorB);

  while (colorR<=0.1f && colorG<=0.1f && colorB<=0.1f)
  {
    //in the rare event that all colors are less than
    //0.1 then multiply by 10 
    //repeat if necessary
    colorR=colorR*10;
    colorG=colorG*10;
    colorB=colorB*10;
    println("ColorR: " + colorR);
    println("ColorG: " + colorG);
    println("ColorB: " + colorB);
  }

  x = random(-PI, PI);
  y = random(-PI, PI);
  z = random(-PI, PI);
  println("x: " + x);
  println("y: " + y);
  println("z: " + z);
  lineVector = new PVector(x, y, z);
  colorVector=new PVector(colorR, colorG, colorB);
  lineVector.normalize();
  lineVector.mult(0.39f * frameWidth);
  println("vector: " + lineVector);
}


