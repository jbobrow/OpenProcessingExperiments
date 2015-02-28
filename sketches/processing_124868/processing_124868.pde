
// Matrix code simulator
// Matthew Pearson 2012
// www.doctorchronicles.com/mpearson
 
String message = "ElectriCity-States";
String alphabet = "Hello";
int rowCount = 30;
int speed = 5;
float blurStrength = 0.2;
 
boolean soften = true;
PFont f;
float[][] convolution = new float[3][3];
PImage buffer;
 
MatrixLine[] columns = new MatrixLine[40];
 
class MatrixLine {
 
  int tick = 0;
  int position = 0;
  int speed;
  char[] chars;
  int col;
  int stuckCharIndex = -1;
 int newCharNum;
  float rowFactor;
 
  MatrixLine(int colNum) {
    position = -1*(int)random(10);
 
    speed = floor(random(2, 8));
    col = colNum;
    chars = new char[rowCount];
    for(int i=0; i<rowCount; i++)
      chars[i] = ' ';
    rowFactor = min(1, random(0.2, 1.1));
    newCharNum = 0;
  }
 
  void update() {
    if(position < 0) {
      position++;
      return;
    }
    if (position > rowCount - 1 || (position>rowCount/2 && random(30) < 1)) {
      position = -1*(int)random(5);
      return;
    }
 
    // = round(random(0, alphabet.length() - 1));
    if (newCharNum >= alphabet.length()) newCharNum=0;
    chars[position] = alphabet.charAt(newCharNum++);
    //print((int)chars[position]);
    //print(" ");
 
    if (stuckCharIndex < 0) {
      if (random(10) < 1) {
        stuckCharIndex = round(random(rowCount-1));
      }
    }
    else {
      if (random(8) > 6)
        stuckCharIndex = -1;
    }
    position++;
  }
  void render() {
    if (++tick > speed) {
      update();
      tick = 0;
       
    }
    for (int i=0; i<chars.length; i++) {
      if (i==stuckCharIndex)
        fill(240, 255, 250);
      else
        fill(rowFactor*250, 255, rowFactor*250);
 
      if (i == 10 && i==position && col < message.length()) {
        text(message.charAt(col), 11*col, 11*i);
      } else if(i==position || (i==stuckCharIndex && i<position))
        text(chars[i], 11*col, 11*i);
    }
  }
}
 
PImage img;
int xPos;
void setup() {
  String[] lines = loadStrings("file.txt");
  for (int i=0; i < lines.length; i++) {
    alphabet = alphabet + lines[i];
  } 
  img = loadImage("SCALE.jpg");
  xPos = 50;
  //size(columns.length*11, rowCount*11);
  size(440,330);
 
  smooth();
  fill(0);
  rect(0, 0, width, height);
  //f = loadFont("ArialUnicodeMS-11.vlw");
  //textFont(f, 10);
 
  for (int i=0;i<columns.length;i++)
    columns[i] = new MatrixLine(i);  // initialize MatrixColumns
 
  buffer = createImage(width, height, RGB);
  // create The Kernel
  int matrixSize = convolution.length;
  float matrixTotal = 0;
  for (int x=0; x<matrixSize; x++) {
    for (int y=0; y<matrixSize; y++) {
      convolution[x][y] = gaussian(x, y);
      matrixTotal += convolution[x][y];
    }
  }
  // normalize The Kernel
  for (int x=0; x<matrixSize; x++) {
    for (int y=0; y<matrixSize; y++) {
      convolution[x][y] /= (matrixTotal*1.005);
      print(convolution[x][y]);
      print(" ");
    }
    print("\n");
  }
}
 
void draw() {
  image(img, width/2 - img.width/2 + xPos, height/2);
  stroke(255);
  strokeWeight(4);  // Thicker
  line(width/2, height/2 -50, width/2, height/2 -10);  

  for (int i=0;i<columns.length;i++)
    columns[i].render();
  loadPixels();
  buffer.loadPixels();
 
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++ ) {
       
      if(soften) {
        color c = convolve(x, y, convolution);
        buffer.pixels[x + y*width] = c;
      } else {
        color c = pixels[x + y*width];
        c = color(0.92*red(c),0.98*green(c),0.92*blue(c));
        buffer.pixels[x + y*width] = c;
      }
    }
  }
  buffer.updatePixels();
  image(buffer, 0, 0);
}
 
void keyPressed() {
  if(key == 's' || key == 'S')
    soften = !soften;
  else if(key == ' ') {
    fill(0);
    rect(0,0,height,width);
    setup();
  } else if(keyCode == UP) xPos = xPos + 3;
  else if (keyCode == DOWN) xPos = xPos - 3;
}
 
color convolve(int x, int y, float[][] matrix) {  // ,PImage img
 
  float r = 0, g = 0, b = 0;
  int matrixSize = matrix.length;
 
  int offset = matrixSize / 2;
 
  for (int i=0; i<matrixSize; i++) {
    for (int j=0; j<matrixSize; j++) {
 
      int xOffset = x+i-offset;
      int yOffset = y+j-offset;
 
      int xyOffset = xOffset + width*yOffset;
 
      xyOffset = constrain(xyOffset, 0, pixels.length-1);
 
      r += red(pixels[xyOffset]) * matrix[i][j];
      g += green(pixels[xyOffset]) * matrix[i][j];
      b += blue(pixels[xyOffset]) * matrix[i][j];
    }
  }
 
  r = constrain(r*0.92, 0, 255);
  g = constrain(g*0.99, 0, 255);
  b = constrain(b*0.92, 0, 255);
 
  return color(r, g, b);
}
 
float gaussian(float x, float y) {
  float x0 = convolution.length / 2;
  float c = x0 / 4;
  c = blurStrength;
  return 1 / ((float)Math.exp((pow(x-x0, 2)+pow(y-x0, 2))/c));
}




