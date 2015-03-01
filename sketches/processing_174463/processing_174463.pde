
//Kat's Paint Program

int x ;
int y ;
int oldX;
int oldY;
int drawingMode = 0;
int strokeSize= 5;
int currentColor ;
int strokeColor= color(255, 255, 255);

color red = color(255, 0, 0);
color orange = color(247, 112, 0);
color yellowOrange = color(255, 159, 3);
color yellow = color(247, 240, 0);
color yellowGreen = color(157, 250, 0);
color green = color(0, 255, 0);
color blueGreen = color(0, 200, 200);
color blue = color(0, 0, 255);
color violet = color(110, 0, 220);
color pink = color(200, 28, 97);
color white = color(255);
color black = color(0);

color[] colors = {
  red, orange, yellowOrange, yellow, yellowGreen, green, blueGreen, blue, violet, pink, white, black
};
Paint[] paints = new Paint [colors.length];
PImage[] images = new PImage[12];
Brush[] brushes = new Brush [images.length];


void setup() {
  images[0] = loadImage("paintbrush.jpg");
  images[1] = loadImage("symmetry.jpg");
  images[2] = loadImage("ellipse.jpg");
  images[3] = loadImage("square.jpg");
  images[4] = loadImage("bucket.jpg");
  images[5] = loadImage("eraser.jpg");
  images[6] = loadImage("null.jpg");
  images[7] = loadImage("strokeup.jpg");
  images[8] = loadImage("strokedown.jpg");
  images[9] = loadImage("null.jpg");
  images[10] = loadImage("null.jpg");
  images[11] = loadImage("save.jpg");
  size (1200, 1000);
  background(255);
  smooth();
  for (int i = 0; i < colors.length; i++) {
    paints[i] = new Paint(i + 1, colors[i]);
  }
  for (int i = 0; i < brushes.length; i++) {
    brushes[i] = new Brush(i + 1, images[i]);
  }
  paintProgram();
  colorPallete();
  brushPallete();
}



void draw() {
  stroke(currentColor);
  brushType();
  colorChanging();
  currentPaint();
  currentBsize();
  int d = bufferZone();

  if (mouseX >= 110 + d && mouseX <= 1180 - d && mouseY >= 110 + d && mouseY <= 980 - d) {
    if (drawingMode == 0) {
      basicDraw();
    }
    if (drawingMode == 1) {
      drawSymmetry();
    }
    if (drawingMode == 2) {
      drawCircle();
    }
    if (drawingMode == 3) {
      drawRectangle();
    }
    if (drawingMode == 4) {
      bucket();
    }
    if (drawingMode == 5) {
      erase();
    }
  }
  if (mousePressed) {
    if (mouseY > 5 && mouseY < 35) {
      if (mouseX > 1135 && mouseX < 1195) {
        exit();
      }
    }
  }
}

//Drawing the Window(s)
void paintProgram() {

  rectMode(CORNER);
  stroke(0);
  fill(200);
  rect(0, 0, 1200, 1000);

  stroke(0);
  fill(160);
  rect(100, 100, 1090, 890);

  stroke(0);
  fill(255);
  rect(110, 110, 1070, 870);

  stroke(0);
  fill(160);
  rect(0, 0, width, 45);

  fill(230);
  rect(0, 0, width, 40);

  fill(160, 0, 0, 155);
  strokeWeight(2);
  rect(1135, 5, 60, 30);

  stroke (255);
  strokeWeight(3);
  line(1155, 12, 1175, 27);
  line(1155, 27, 1175, 12);
  textSize(27);
  fill(0);
  text("Untitled - Microsoft Paint", 30, 30);
}

//Current Color/Size and displaying the Buttons
void brushPallete() {
  for (int i = 0; i < brushes.length; i++) {
    brushes[i].display();
  }
}

void colorPallete() {
  for (int i = 0; i < colors.length; i++) {
    paints[i].display();
  }
}

void colorChanging() { 
  if (mousePressed) {
    if (mouseY > 60 && mouseY < 90 && mouseX > 120 && mouseX < (120 + colors.length*30)) {
      int i= (mouseX - 120)/30;
      currentColor = colors[i];
    }
  }
}

void currentPaint() {
  rectMode (CORNER);
  stroke(0);
  strokeWeight(2);
  fill(currentColor);
  rect(490, 53, 40, 40);
}

void currentBsize() {
  stroke(0);
  strokeWeight(2);
  fill(255);
  rect(550, 53, 40, 40);
  strokeWeight(strokeSize);
  line (560, 74, 580, 74);
}


//What drawing mode based on mouse position
void brushType() {
  if (mousePressed) {
    if (mouseX > 20 && mouseX < 70) {
      if (mouseY >150 && mouseY < 200) {
        drawingMode = 0;
      }
      if (mouseY >200 && mouseY < 250) {
        drawingMode = 1;
      }
      if (mouseY >250 && mouseY < 300) {
        drawingMode = 2;
      }
      if (mouseY >300 && mouseY < 350) {
        drawingMode = 3;
      }
      if (mouseY >350 && mouseY < 400) {
        drawingMode = 4;
      }
      if (mouseY >400 && mouseY < 450) {
        drawingMode = 5;
      }
      if (mouseY >500 && mouseY < 550) {
        if (strokeSize <= 22) strokeSize++;
      }
      if (mouseY >550 && mouseY < 600) {
        if (strokeSize >= 1) strokeSize--;
      }
      if (mouseY >700 && mouseY < 750) {
        PImage drawing= get (110, 110, 1070, 870);
        drawing.save("UntitledDrawing.jpg");
      }
      brushes[drawingMode].indicator();
    }
  }
}

//Drawing Modes
void basicDraw() {
  if (mousePressed) {
    stroke(currentColor);
    strokeWeight (strokeSize);

    line(mouseX, mouseY, oldX, oldY);
  }
  oldX = mouseX;
  oldY = mouseY;
}

void drawSymmetry() {
  if (mousePressed) {
    stroke(currentColor);
    strokeWeight(random(2, strokeSize+5));
    clampPoint(mouseX, mouseY);
    clampPoint(((width + 55)-mouseX), mouseY);
  }
}

void drawCircle() {
  if (mousePressed) {
    noStroke();
    fill(currentColor);
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY, strokeSize * 4, strokeSize * 4);
  }

  oldX = mouseX;
  oldY = mouseY;
}

void drawRectangle() {
  if (mousePressed) {
    noStroke();
    fill(currentColor);
    rectMode(CENTER);
    rect(mouseX, mouseY, strokeSize * 4, strokeSize * 4);
  }
}

void bucket() {
  if (mousePressed) {
    stroke(0);
    strokeWeight(1);
    fill(currentColor); 
    rect(110, 110, 1070, 870);
  }
}

void erase() {
  if (mousePressed) {
    stroke(255);
    strokeWeight (strokeSize*3);
    line(mouseX, mouseY, oldX, oldY);
  }
  oldX = mouseX;
  oldY = mouseY;
}


//Clamping drawing area to smaller screen
int bufferZone() {
  if (drawingMode == 0 || drawingMode == 1) {
    return (strokeSize/2) + 1;
  } else if (drawingMode == 2 || drawingMode == 3) {
    return (4*strokeSize/2) + 1;
  } else if (drawingMode == 5) {
    return (3*strokeSize/2) + 1;
  } else {
    return 0;
  }
}

void clampLine(int x0, int y0, int x1, int y1) {
  x0 = clamp (x0, 110, 1180);
  y0 = clamp (y0, 110, 980);
  x1 = clamp (x1, 110, 1180);
  y1 = clamp (y1, 110, 980);

  line (x0, y0, x1, y1);
}  

void clampPoint(int x0, int y0) {
  x0 = clamp (x0, 110, 1180);
  y0 = clamp (y0, 110, 980);

  point (x0, y0);
}  

int clamp(int x, int xmin, int xmax) {
  if (x < xmin) {
    x = xmin;
  } else if (x > xmax) {
    x = xmax;
  }
  return x;
}


//Alternate Modes using Keypress
void keyPressed() {
  if (key == '=') { 
    if (strokeSize <= 22) strokeSize++;
  }
  if (key == '-') {
    if (strokeSize >= 1) strokeSize--;
  }
  if (key == '`') {
    strokeWeight(1);
    fill(255); 
    rect(110, 110, 1070, 870);
  }
  if (key == 's') {
    PImage drawing= get (110, 110, 1070, 870);
    drawing.save("UntitledDrawing.jpg");
  }
}

class Brush {
  color c;
  int ypos;
  PImage img;
  Brush(int _ypos, PImage _m) {
img=_m;
ypos=_ypos;
  }
  void display(){
    image(img, 20,100+(ypos*50));
  }
  
  void indicator(){
     brushPallete();
      strokeWeight(2);
      stroke(0);
      noFill();
      rect(20,100+(ypos*50), 47, 47);
  }
}
class Paint {
  color c;
  int xpos;
  Paint(int _xpos, color _c) {
c=_c;
xpos=_xpos;
  }
  void display(){
    stroke(0);
    strokeWeight (2);
    fill(c);
    rect(90+(xpos*30),60,30,30);
  }
}



