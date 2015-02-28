
final int PLAY = 0;
final int ENDPLAY = 1;

PImage img;
PFont font, font2;
ArrayList<Letter> myLetters;
int count;
boolean startMoving;
static int state;
int level = 3;
int cellsize = 2; // Dimensions of each cell in the grid
int columns, rows;   // Number of columns and rows in our system
float startMilli;
int bestTime = -1;

int lensD = 150;  // Lens diameter
int[] lensArray = new int[lensD*lensD];  // Height and width of lens

PGraphics lensEffect;
PImage lensImage;
PImage lensImage2;

int xx = 0;
int yy = 0;

String message[]={"10/12/2010", "HAPPY", "53rd", "BIRTHDAY", "DAD!"};
//String message[]={"HAPPY"};

void setup() {
  size(400, 400, P3D); 
  frameRate(30);
  img = loadImage("daddy.jpg");
  img.loadPixels();
  loadPixels();
  font = loadFont("JCHEadA-48.vlw");
  font2 = loadFont("SansSerif-12.vlw");
  state = PLAY;
  count = 0;
  startMoving = false;
  startMilli = millis();
  
  columns = img.width / cellsize;  // Calculate # of columns
  rows = img.height / cellsize;  // Calculate # of rows
  
  myLetters = new ArrayList<Letter>();
  for(int i=0; i<message.length; i++) {
    String l = message[i];
    for(int j=0; j<l.length(); j++) {
      char c = l.charAt(j);
      myLetters.add(new Letter(c,int(random(20,img.width-20)), int(random(20,img.height-20)), font, level));
    }
  }
  level--;
  if(level == 0)
    level++;
  
  // Create buffered image for lens effect
  lensEffect = createGraphics(width, height, P2D);

  // Load background image 
  lensEffect.beginDraw();
  lensEffect.image(loadImage("daddy.jpg"), 0, 0, 
                   lensEffect.width, lensEffect.height);
  lensEffect.endDraw();

  // Create buffered image for image to warp
  lensImage = createGraphics(lensD, lensD, P2D);
  lensImage2 = createGraphics(lensD, lensD, P2D);

  // Lens algorithm (transformation array)
  int magFactor = 40;  // Magnification factor
  int m, a, b;

  int r = lensD / 2;
  float s = sqrt(r*r - magFactor*magFactor);

  for (int y = -r; y < r; y++) {
    for (int x = -r ;x < r; x++) {
      if(x*x + y*y >= s*s) {
        a = x;
        b = y;
      }
      else {
        float z = sqrt(r*r - x*x - y*y);
        a = int(x * magFactor / z + 0.5);
        b = int(y * magFactor / z + 0.5);
      }
      lensArray[(y + r)*lensD + (x + r)] = (b + r) * lensD + (a + r);
    }
  }
}

void draw() {
  background(0);
  if(state == PLAY) {
    xx = constrain(mouseX-80, 0, img.width-150);
    yy = constrain(mouseY-80, 0, img.height-150);
    
    lensImage = createGraphics(lensD, lensD, P2D);
    lensImage2.copy(lensEffect, xx, yy, lensD, lensD, 0, 0, lensD, lensD);
    lensImage.loadPixels();
    for (int i = 0; i < lensImage.pixels.length; i++)  {
      /*
      color origC = lensImage2.pixels[lensArray[i]];
      colorMode(HSB, 255);
      color c = origC;
      float h = hue(c);
      float s = saturation(c);
      float b = brightness(c);
      lensImage.pixels[i] = color(h, s*1/lensArray[i], b);*/
      lensImage.pixels[i] = lensImage2.pixels[lensArray[i]];
    }
    lensImage.updatePixels();
    image(lensEffect, 0, 0, width, height);
    image(lensImage, xx, yy, lensD, lensD); 
    
    textFont(font2); 
    fill(255);
    String bs;
    bs = (bestTime == -1) ? "N/A" : bestTime+" seconds";
    /*
    if(bestTime == -1)
      bs = "N/A";
    else
      bs = bestTime+" seconds";
      */
    text("Objective: find all the hidden letters \nCurrent Time: "+int((millis()-startMilli)/1000)+" seconds\nBest Time: "+bs, 20, img.height-50); 
  
  }
  else {
    background(0);
    translate(width / 2, height / 2);
    rotateY(map(mouseX, 0, width, -PI, PI));
    rotateX(map(mouseY, 0, height, -PI, PI));
    beginShape();
    texture(img);
    vertex(-100, -100, -50, 0, 0);
    vertex(100, -100, -50, 400, 0);
    vertex(100, 100, -50, 400, 400);
    vertex(-100, 100, -50, 0, 400);
    endShape();
  }
    
  for(Letter l:myLetters) {
    l.display();
    if(startMoving)
      l.move();
  }
}

void mouseMoved() {
  Letter l2 = checkLetter(mouseX, mouseY);
  if(l2 != null) {
    if(l2.showLetter())
      count++;
    l2.display();
    if(count==myLetters.size())
      showMessage();
  }
}

Letter checkLetter(int x, int y) {
  for(Letter l:myLetters) {
    if(l.check(x,y))
      return l;
  }
  return null;
}

void showMessage() {
  startMoving = true;
  state = ENDPLAY;
  if(bestTime == -1 || bestTime > millis()-startMilli)
    bestTime = int((millis()-startMilli)/1000);
    
  count=0;
  int yLineLength = 50*message.length;
  int yBeg = -100;
  for(int i=0; i<message.length; i++) {
    String l = message[i];
    int xLineLength = 30*l.length();
    int xBeg = -100;
    for(int j=0; j<l.length(); j++) {
      Letter let = myLetters.get(count);
      int x = xBeg+40*j;
      int y = yBeg+60*i;
      let.setDestination(x,y);
      count++;
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    setup();
  }
}

