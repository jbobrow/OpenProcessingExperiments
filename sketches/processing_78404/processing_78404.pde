
PImage imgL, imgR, elektrybalt;
PFont myFont/*, trFont*/;
String textBuffer[];
color colorBuffer[];
int x = 0, y = 0, ox = 0, oy = 0, toy = 0, blink = 0, lineHeight = 20, letterWidth = 20, lineWidth = 80, consoleHeight = 25;
String emptyLine;
String poem[] = null;
int poemIndex = 0, poemSubindex = 0, poemColorIndex = 0;
boolean finalFrameRate = false;
Sents sents;

color[] colors = {
  color(28 ,121, 208),
  color(255, 231, 46),
  color(255, 143,  0),
  color(244, 214, 157)
};

void setup() {
  //size(1600, 900);
  size(1280, 720);
  smooth();
  
  sents = new Sents();
  
  imgR = loadImage("atractor.png");
  imgL = createImage(imgR.width, imgR.height, RGB);
  
  imgR.loadPixels();
  imgL.loadPixels();
  for(int y=0, i=0; y<imgR.height; ++y)
    for(int x=0; x<imgR.width; ++x, ++i) {
      imgL.pixels[i+imgR.width-1-(2*x)] = imgR.pixels[i];
    }
  imgL.updatePixels();
  
  myFont = createFont("Courier New", 21); //22);
  textFont(myFont);
  
  elektrybalt = loadImage("elektrybalt.png");
  
  toy = int(ceil(textAscent() + textDescent()) * 2);
//  trFont = createFont("Persia BT", 100);
//  textFont(trFont);
  oy = 183; //int(ceil(1.4*toy + textAscent() + textDescent()));
//  toy += int(ceil(textAscent()));
  
  textFont(myFont);
  letterWidth = int(ceil(textWidth('W')));
  lineHeight = int(ceil(textDescent() + textAscent()));
  
  emptyLine = "";
  lineWidth = 29; //int(floor((width - 3*imgR.width) / letterWidth));
  ox = int((width - (lineWidth * letterWidth)) / 2);
  lineWidth = 36; //int(floor((width - 2.5*imgR.width) / letterWidth));
  consoleHeight = int(floor((height - oy) / lineHeight)) - 1;
  for(int i=0; i<lineWidth; ++i)
    emptyLine += " ";
  
  textBuffer = new String[consoleHeight];
  for(int i=0; i<consoleHeight; ++i)
    textBuffer[i] = emptyLine;
  
  colorBuffer = new color[consoleHeight];
  for(int i=0; i<consoleHeight; ++i)
    colorBuffer[i] = colors[0];
    
  frameRate(15);
}

void draw() {
  background(0);
  
  int yy = int(height * 0.38 - imgL.height * 0.5);
  image(imgL, 0, yy);
  image(imgR, width - imgR.width, yy);
  
  image(elektrybalt, ox, toy);
  /*textFont(trFont);
  fill(colors[0]);
  text("Elektrybałt", ox+2, toy+2);
  fill(colors[3]);
  text("Elektrybałt", ox, toy);*/
  
  textFont(myFont);
  for(int i=0; i<textBuffer.length; ++i) {
    fill(colorBuffer[i]);
    text(textBuffer[i], ox, i*lineHeight+textAscent()+oy);
  }
  
  if(blink < 7) {
    fill(colorBuffer[y]);
    text("_", x*letterWidth+ox, y*lineHeight+textAscent()+oy);
  }
  blink = (blink + 1) % 12;
  
  if((poem==null) || (poemIndex>=poem.length)) {
    poemIndex = 0;
    poemSubindex = 0;
    //poem = loadStrings("http://127.0.0.1:8000/");
    poem = sents.strofka();
    if(poem!=null) incY();
    poemColorIndex = 1;
    colorBuffer[y] = colors[0];
  } else {
    String s = poem[poemIndex].substring(poemSubindex, ++poemSubindex);
    if(s.charAt(0) >= 32)
      type(s);
    if(poemSubindex >= poem[poemIndex].length()) {
      poemSubindex = 0;
      ++poemIndex;
      incY();
      
      colorBuffer[y] = colors[poemColorIndex];
      if(poemColorIndex == 1)
        poemColorIndex = 2;
      else
        poemColorIndex = 1;
    }
  }
}
/*
void keyTyped() {
  if(key>=32) type(""+key);
  if(key==8) {
    if(x>0)
      textBuffer[y] = textBuffer[y].substring(0, --x) + " " + textBuffer[y].substring(x+1);
  }
  if(key==10) {
    incY();
    colorBuffer[y] = colors[1];
    type(textBuffer[y-1]);
    incY();
    colorBuffer[y] = colors[2];
  }
}
*/
void type(String s) {
  for(int i=0; i<s.length(); ++i) {
    textBuffer[y] = textBuffer[y].substring(0, x) + s.substring(i, i+1) + textBuffer[y].substring(x+1);
    if(++x >= lineWidth)
      incY();
  }
}

void incY() {
  x = 0;
  if(++y >= consoleHeight) {
    --y;
    for(int j=0; j<consoleHeight-1; ++j) {
      textBuffer[j] = textBuffer[j+1];
      colorBuffer[j] = colorBuffer[j+1];
    }
    textBuffer[consoleHeight-1] = emptyLine;
  } else {
    colorBuffer[y] = colorBuffer[y-1];
  }
}


