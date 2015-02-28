
//Lauren Ruoff copyright 2014
//lruoff
//Homework 9

//Press the mouse to generate text
//press any key to wipe the text clean


int spacing = 10;
int numImages = 20;
int gridWidth = 5;
int gridHeight = 4;

float scaleX, scaleY;

PImage [] slide = new PImage[numImages];

String [] words = {
  "slip", "fall", "air", "gusts", "slide", 
  "slick", "scratch", "plastic", "tube", "connections", 
  "bright", "light", "glossy", "glare", "burn", 
  "cool", "damp", "in", "suit", "swim"
};


void setup() {

  size(400, 300);
  background(255);

  imageMode(CORNER);
  textAlign(LEFT);
  textSize(24);
  fill(255);
  
  for (int i = 0; i < numImages; i++) {
    slide[i] = loadImage(new String("s" + (i+1) + ".jpg"));
  }
  
  scaleX = float(width)/float(gridWidth*(slide[0].width)+gridWidth*spacing);
  scaleY = float(height)/float(gridHeight*(slide[0].height)+gridHeight*spacing);
  drawImages();
}

void draw() {

  if (mousePressed) {
    generateText();
  }
  
  if (keyPressed) {
    drawImages();
  }
}


void generateText() {
  int index;
  drawImages();
  for (int y = 0; y < gridHeight; y++) {
    for (int x = 0; x < gridWidth; x++) {
      text (words[int(random(20))], x*slide[y].width + x*spacing, (y+1)*slide[y].height - y*spacing);
    }
  }
}

void drawImages(){
  int index;
  scale(scaleX, scaleY);  
    for (int y = 0; y < gridHeight; y++) {
    for (int x = 0; x < gridWidth; x++) {
      index = x + y*5;
      image (slide[index], x*slide[y].width+x*spacing, y*slide[y].height+y*spacing);    
    }
  }
}


