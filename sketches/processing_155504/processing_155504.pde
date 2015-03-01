
/*
 Creative Coding
 Week 4, 03 - one pixel cinema
 MODIFIED by 
 Eduardo H Obieta.
 26-July14
 */

PImage myImg;
color[] pixelColors;
int scanLine;  // vertical position
int angulo=0;
int radio = 50;
int cenX, cenY;
int numPuntos = 20;

void setup() {
  size(720, 640);
  myImg = loadImage("led.jpg");
  pixelColors = new color[numPuntos];
  scanLine = 0;
  smooth(4);
  noCursor();
}

void draw() {
  background(0);
  cenX = mouseX;
  cenY = mouseY;
  cenY = constrain(cenY, 0, height-100);
  // read the colours for the current scanLine
  for (int i=0; i<numPuntos; i++) {
    //pixelColors[i] = myImg.get(17+i*35, scanLine);
    pixelColors[i] = myImg.get((int)(cenX+(sin(radians(angulo+360/numPuntos*i)))*radio), (int)(cenY+(radio*cos(radians(angulo+360/numPuntos*i)))));
  }

  // draw the image
  image(myImg, 0, 0, myImg.width, myImg.height);

  // draw the sampled pixels as verticle bars
  for (int i=0; i< numPuntos; i++) {
    noStroke();
    fill(pixelColors[i]);
    rect(i*width/numPuntos, height-100, width/numPuntos, height);
  }

  stroke(255, 100);
  line(cenX, cenY+20, cenX, cenY-20);
  line(cenX+20, cenY, cenX-20, cenY);
  for (int i=0; i<numPuntos; i++) {
    stroke(255, 0, 0);
    noFill();
    ellipse((int)(cenX+(sin(radians(angulo+360/numPuntos*i)))*radio), (int)(cenY+(radio*cos(radians(angulo+360/numPuntos*i)))), 5, 5);
    //ellipse(width/2 + 17 + i*35, scanLine, 5, 5 );
  }

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }
  if (scanLine > height) {
    scanLine = 0;
  }
  angulo+=1;
}
void keyPressed() {
  if (key==' ')
    saveFrame();
}



