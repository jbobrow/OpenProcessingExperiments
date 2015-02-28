
/* ASCII artify an image (based on randomness)
 This sketch expects an image, target.jpg
 On mouseclick output is saved to a file
 */
char[][] ascii;

PImage target;
PFont f;

int char_w; //# characters wide
int char_h; //# characters high
int pt = 9; //weird variable close to the font size
int ci; //used for initing the char value three dimensional array
int[][][] charVals; // [char - 32][x][y] = brightness
int xSta, xEnd;
int ySta, yEnd;
int c = 0; //because it isn't cooperating

boolean inited = false;

void setup() {
  f = loadFont("f.vlw");
  target = loadImage("tlp.jpg");
  size(target.width, target.height);
  ascii = new char[width/pt][height/pt];
  char_w = width/pt;
  char_h = height/pt;

  for(int i = 0; i < char_w; i++) {
    for(int j = 0; j < char_h; j++) {
      ascii[i][j] = ' ';
    }
  }
  target = convertImage(target);
  textFont(f);
  ci = 32;

  xSta = getxStart(3);
  xEnd = getxEnd(3);
  ySta = getyStart(3);
  yEnd = getyEnd(3);
  int nPixels = (xEnd-xSta)*(yEnd-ySta);

  charVals = new int[95][xEnd-xSta][yEnd-ySta];
  
  smooth();
  println("w="+width);
  println("h="+height);
  size(750, 749);
}
void draw() {
  if(!inited) {
    if(c % 2 == 0) {
      initText(ci);
    } else {
      charVals[ci-32] = initChar(ci);
      ci++;
    }
    c++;
    if(ci > charVals.length)
      inited = true;
  } 
  else {
    for(int i = 0; i < char_w; i++) {
      for(int j = 0; j < char_h; j++) {
        xSta = getxStart(i);
        xEnd = getxEnd(i);
        ySta = getyStart(j);
        yEnd = getyEnd(j);
        ascii[i][j] = best(xSta, ySta, xEnd, yEnd);
      }
    }
    dispText();
    noLoop();
  }
}

int getxStart(int i) {
  return (int) ((float)(i-0.2)*width/char_w);
}
int getxEnd(int i) {
  return (int) ((float)(i+1.0)*width/char_w);
}
int getyStart(int j) {
  return (int) ((float)(j-0.2)*height/char_h);
}
int getyEnd(int j) {
  return (int) ((float)(j+1.2)*height/char_h);
}

void dispText() { //called once ended
  fill(0);
  rectMode(CORNERS);
  rect(0,0,width, height);
  for(int i = 0; i < char_w; i++) {
    for(int j = 0; j < char_h; j++) {
      fill(255);
      text(ascii[i][j], ((i)*width/char_w), (j+1)*height/char_h);
    }
  }
}

PImage convertImage(PImage conv) {
  for(int i = 0; i < conv.pixels.length; i++) {
    float b = brightness(conv.pixels[i]);
    /*if(b > 127) {
      conv.pixels[i] = color(255);
    } 
    else {
      conv.pixels[i] = color(0);
    }*/
    conv.pixels[i] = color(b);
  }
  return conv;
}
int[][] initChar(int chr) { // [pixels]


  rectMode(CORNERS);
  xSta = (int) getxStart(2);
  xEnd = (int) getxEnd(2);
  ySta = (int) getyStart(2);
  yEnd = (int) getyEnd(2);
  int nPixels = (xEnd-xSta)*(yEnd-ySta);

  int[][] ret = new int[xEnd-xSta][yEnd-ySta]; //array of what the pixels would return

  loadPixels();

  for(int y = ySta; y < yEnd; y++) {
    for(int x = xSta; x < xEnd; x++) {

      ret[x-xSta][y-ySta] = int(brightness(pixels[y*width + x]));

    }
  }
  //println("Average brightness: " + b/(float)s);
  return ret;
}

void initText(int chr) {
  rectMode(CORNERS);
  fill(0);
  rect(0,0,width,height);
  fill(255);
  text((char)chr, (2*width/char_w), 3*height/char_h);
  
}

char best(int xStart, int yStart, int xEnder, int yEnder) {
  int tot = 0;
  float bestTot = 10000000;
  char bestChr = ' ';
  int nPixels = (xEnder-xStart)*(yEnder-yStart);
  int h = yEnder - yStart;
  int w = xEnder - xStart;

  float[] totals = new float[95];
  for(int i = 0; i < totals.length; i++) {
    totals[i] = 0;
  }
  for(int x = xStart; x < xEnder; x++) {
    for(int y = yStart; y < yEnder-1; y++) {

      int bImg = 0;
      int bChr = 0;
      int imgP = (int) (y*target.width + x);
      if(imgP > 0 && imgP < target.pixels.length)
        bImg = (int)brightness(target.pixels[imgP]); 
      //yoffset = p/w * target.width + yStart
      //xOffset = p%w + xStart
      for(int i = 32; i < 127; i++) {
        bChr = charVals[i-32][x-xStart][y-yStart];
        totals[i-32] += abs(bImg - bChr)/255.0;
      }
    }
  }
  for(int i = 0; i < totals.length; i++) {
    if(totals[i] < bestTot) {
      bestChr = (char)(i+32);
      bestTot = totals[i];
    } 
    else {
      //println(totals[i]);
    }
  }
  return bestChr;
}

/*void saveText() {
  String write = "";
  for(int j = 0; j < char_h; j++) {
    for(int i = 0; i < char_w; i++) {
      if(ascii[i][j] != (char)32 && ascii[i][j] != char(0))
        write += "" + ascii[i][j];
      else
        write += " ";
    }
    write += "\n";
  }
  String[] temp = new String[1];
  println(write);
  temp[0] = write;
  saveStrings("asciification.txt", temp);
}*/








