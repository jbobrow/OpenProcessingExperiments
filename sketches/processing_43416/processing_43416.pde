
/* ________________________________________________________________________

NEBULA

photos provided by NASA website
zoom code provided by REAS on processing.org.

KEYS 1- 2- 3 - 4- 5 -6 - 7 - 8- 9 - RESOLUTION OF QUADS.

KEY 1 = HIGHEST RESOLUTION     KEY 9 = LOWEST RESOLUTION

CLICK MOUSE TO ZOOM IN AND HOVER OVER NEBULA

LOAD IMAGES  Q-W-E-R-T-Y-U-I-O-P-A-S-D-F-G-H-J-K-L

________________________________________________________________________*/

PImage nebula;
PImage imgArr[];
int nebulaW;
int nebulaH;
int numPixels;

float b = .01;
float a = .01;

float speed = 4.0;  // speed of zoom and rotate
float nmx, nmy;
int resolution = 4;  // RESOLUTION OF IMAGE QUADS

color c;
int[] values;
int fetch = 1;

void setup(){

  int nImg = 20;
  imgArr = new PImage[nImg];
  for (int i=0; i<nImg; i++){
    imgArr[i] = loadImage("neb" + i + ".jpg");
    imgArr[i].loadPixels();
  }

  size(500, 500, P3D);

}

//----------------------------------------------------------------------------------

void draw(){

  int row, loc;
  if (keyPressed && key >= 'a' && key <= 'z'){
    fetch = key - 'a';

    if(fetch < imgArr.length) {
      nebula = imgArr[fetch];
  
      println(fetch);
      //nebula = loadImage ("neb23.jpg"); // LOADS FIRST IMAGE
  
      nebulaW =  nebula.width;
      nebulaH =  nebula.height;
  
      numPixels = nebulaW;
  
      values = new int [numPixels * numPixels];
  
      rectMode(CENTER);
  
      //int row;
      //int loc;
  
      for(int i=0; i<nebulaH; i=i+1) {
        row = i * nebulaW;
        for(int j=0; j<nebulaW; j=j+1) {
          loc = row + j;
          color pix = nebula.pixels[loc];  // CREATES AN ARRAY OF PIXEL COLORS
          values[loc] = int (brightness(pix)-100);
        }
      }
    }
  }

  background(0);

  // really great zoom code provided by REAS
  if (abs(mouseX - nmx) > 1.0) {
    nmx = nmx + (mouseX-nmx)/20;
  }
  if (abs(mouseY - nmy) > 1.0) {
    nmy += (mouseY-nmy)/20;
  }

  if(mousePressed) {
    speed += 0.01;
  } else {
    speed -= 0.02;
  }
if(speed > 2.5) { speed = 2.5; }
if(speed < 1.0) { speed = 1.0; }

  translate(width/2+nmx*speed-100, height/2+nmy*speed-100, -50);
  scale(speed);
  rotateZ(PI/9-speed+1.0);
  rotateX(PI/speed/8-0.125);
  rotateY(speed/8-0.125);

  translate(-width/2, -height/2, 0);

  noStroke();

  for(int i=0; i<nebulaH; i=i+=resolution) {
    row = i * nebulaW;
    for(int j=0; j<nebulaW; j=j+=resolution) {
      loc = row + j;
      color pix = nebula.pixels[loc];

      int val = values[loc];

      fill(pix);
      beginShape(QUADS);
      vertex(i, j, val);
      vertex(i + 4, j, val);
      vertex(i + 4, j + 4, val);
      vertex( i, j+4, val);
      endShape();

    }
  }
}

void keyPressed() {
  if(key == '1') {
    resolution = 1;
  } else if (key == '2') {
    resolution = 2;
  } else if (key == '3') {
    resolution = 3;
  } else if (key == '4') {
    resolution = 4;
  } else if (key == '5') {
    resolution = 5;
  } else if (key == '6') {
    resolution = 6;
  } else if (key == '7') {
    resolution = 7;
  } else if (key == '8') {
    resolution = 8;
  } else if (key == '9') {
    resolution = 10;
  }

}

/*
PImage imgArr[];
int nImg = 20;
for (int i=0; i<nImg; i++){
  imgArr = loadImage("neb" + i + ".jpg");
}

int valArr[][];
valArr = new int[nImg][numPixels*numPixels];
for (int i=0; i<nImg; i++){
  int np = numPixels*numPixels;
  for (int p=0; p<np; p++){
    varArr[i][p] = imgArr[i].pixels[p];
  }
}

*/

