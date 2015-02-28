
/*
Homework 2: Randomization
 Jack Langerman
 due: 9/12/1
 
 */
 
 
// CHANGE THESE VALUES TO CHANGE THE COMPOSITION
int ellipseRad=10, gridSpace=15, noise=0;



color bgColor = color(255,0,0);

float phi = 1.618033988749894848204586834;
PImage img;


boolean dotting = true;

void setup() {
  size(round(phi*480), 480);
  PGraphics canvas = createGraphics(width, height);
  
  
  //CHANGE WHICH LINE IS COMMENTED TO DRAW A DIFFERANT IMAGEd
  
  //drawTriangle(canvas);
  drawFullTriangle(canvas);
  
  
  //
  img = canvas.get();
  //img = loadImage("http://blogs.guardian.co.uk/technology/archives/images/Seymour_Papert.jpg");
  
  
  
  noLoop();
  
  print("'w':  ellipseRad++\n's':  ellipseRad--\n'e':  gridSpace++\n'd':  gridSpace--\n'r':  noise++\n'f':  noise--\n");
}

void draw() {
  //image(img, 0, 0);
  background(bgColor);
  if(dotting) img = dotify(img, ellipseRad, gridSpace, noise);
  else image(img, 0, 0);
}


PImage dotify(PImage img, int ellipseWidth, int gridSpacing, int noise) {
  pushStyle();
  noStroke();
  img.loadPixels();
  for (int x=0; x<width; x+=gridSpacing) {
    for (int y=0; y<height; y+=gridSpacing) {
      color c = img.pixels[y*img.width + x];
      fill(c);
      ellipse(x+random(-noise, noise), y+random(-noise, noise), ellipseWidth, ellipseWidth);
      //println("("+x+", "+y+")  b: "+brightness(c));
    }
  }
  popStyle();
  return img.get();
}


void drawTriangle(PGraphics canvas) {
  canvas.beginDraw();
  canvas.strokeWeight(15);
  canvas.background(255);
  canvas.line(0, 78, 263, height);
  canvas.line(263, height, 720, 0);
  canvas.line(720, 0, 0, 78);
  canvas.endDraw();
}

void drawFullTriangle(PGraphics canvas) {
  canvas.beginDraw();
  canvas.strokeWeight(15);
  canvas.background(255);
  canvas.fill(0);
  canvas.stroke(0);
  canvas.beginShape();
  canvas.vertex(0, 78);
  canvas.vertex(263, height);
  canvas.vertex(720, 0);
  canvas.vertex(0, 78);
  canvas.endShape();
  canvas.endDraw();
}

void keyPressed() {
  switch(key) {
    case 'w':  ellipseRad++; break;
    case 's':  ellipseRad--; break;
    case 'e':  gridSpace++; break;
    case 'd':  gridSpace--; break;
    case 'r':  noise++; break;
    case 'f':  noise--; break;
    
    case ' ': dotting = !dotting;
  }
  println("ellipseRad: "+ellipseRad+" gridSpace: "+gridSpace+" noise: "+noise);
  redraw();
}

