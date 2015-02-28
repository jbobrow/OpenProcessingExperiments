
PImage img;
color bg;
int w = 50;
int value;
int rectWidth;

float[][] matrix =  { { -1, -1, -1 },
                      { -1,  9, -1 },
                      { -1, -1, -1 } }; 

void setup() 
{
  size(600, 358); 
  img = loadImage("flower.jpg");
  frameRate(100);
  rectWidth = width/4;
 
}

void draw()
{
  background(bg);
  image(img,0,0);
  int xstart = constrain(mouseX-w*2,0,img.width);
  int ystart = constrain(mouseY-w*2,0,img.height);
  int xend = constrain(mouseX+w*2,0,img.width);
  int yend = constrain(mouseY+w*2,0,img.height);
  int matrixsize = 3;
  loadPixels();
  for (int x = xstart; x < xend; x++) {
    for (int y = ystart; y < yend; y++ ) {
      color c = convolution(x,y,matrix,matrixsize,img);
      int loc = x + y*img.width/2;
      pixels[loc] = c;
    }
  }
  updatePixels();

  stroke(0);
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
    
  fill(random(250),random(250),random(250), random(200));
  float x = map(keyIndex, 0, 25, 0, width - rectWidth);
  rect(x, 0, random(rectWidth), random(height));
  
  
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img) {
  float rtotal = 20.0;
  float gtotal = 250.0;
  float btotal = 20.0;
  int offset = matrixsize / 2;

  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      int xloc = x+i-offset;
      int yloc = y+j-offset;
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





