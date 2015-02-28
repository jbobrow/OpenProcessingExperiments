
PImage a;
PImage b;
int strength;
float[][] matrix;
/*float k = 1.0/9.0;
 float[][] matrix = { { k, k, k } , 
 { k, k, k } ,
 { k, k, k } } ;
 */

void setup() {
  a = loadImage("tilt.jpeg");
  size(a.width,a.height);
  background(a);
  strength = 10;
  matrix = new float[strength][strength];
  for(int i = 0; i < strength; i++) {
    for(int j = 0; j < strength; j++) {
      matrix[i][j] = 1.0/(strength*strength);
    }
  }
}

void draw() {
  if(!mousePressed) {
    tiltShift(260,a.height-100);
  }
  else {
    image(a,0,0);
  }
}



void tiltShift(int topY,int bottomY) {

  loadPixels();
  for (int x = 0; x < a.width; x++ ) {
    for (int y = 0; y < topY; y++ ) {
      color c = blur(x,y,matrix,strength,a); 
      int loc = x + y*a.width;
      pixels[loc] = c;
    }
  }

  for (int x = 0; x < a.width; x++ ) {
    for (int y = bottomY; y < a.height; y++ ) {
      color c = blur(x,y,matrix,strength,a); 
      int loc = x + y*a.width;
      pixels[loc] = c;
    }
  }


  updatePixels();
}

color blur(int x, int y, float[][] matrix, int matrixSize, PImage img) {
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixSize / 2;

  for (int i = 0; i < matrixSize; i++ ) {
    for (int j = 0; j < matrixSize; j++ ) {


      int xloc = x + i-offset;
      int yloc = y + j-offset;
      int loc = xloc + img.width*yloc;

      loc = constrain(loc,0,img.pixels.length-1);


      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }

  rtotal = constrain(rtotal,0,255);
  gtotal = constrain(gtotal,0,255);
  btotal = constrain(btotal,0,255);

  return color(rtotal,gtotal,btotal);
}


