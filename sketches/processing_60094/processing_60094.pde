
PImage bild;
boolean recordPDF = false;
int drawMode = 1;

void setup() {
  size(700, 525);
  smooth();
  bild = loadImage("flower.png");
  noStroke();
}

void draw() {
  background(bild);

  switch(drawMode) {

  case 1:
    noStroke();
    for ( int x = 0; x <= width; x+=10) {
      for (int y=0; y <= height; y+=10) {
        float durchmesser = mouseX/5;

        if (durchmesser > 0) {
          fill(bild.pixels[(x + bild.width*y)]);       
          rect(x, y, durchmesser/12, durchmesser/12);
        }
      }
    }
    break;

  case 2:
    noStroke();
    for ( int x = 0; x <= width; x+=10) {
      for (int y=0; y <= height; y+=10) {
        float durchmesser = mouseX/5;
        if (durchmesser > 0) {
          fill(bild.pixels[(x + bild.width*y)]);       
          ellipse(x, y, durchmesser/4, durchmesser/4);
        }
      }
    }
    break;

  case 3:
    noStroke();
    for ( int x=0; x <= width; x+=10) {
      for (int y=0; y <= height; y+=10) {     
        float winkel = atan2(mouseY - y, mouseX - x);
        float durchmesser = mouseX/5;     
        if (durchmesser > 0) {
          pushMatrix();
          translate(x, y);
          rotate(winkel);  
          strokeWeight(durchmesser);  
          fill(bild.pixels[(x + bild.width*y)]);
          rect (0, 0, durchmesser/3, durchmesser/3);
          popMatrix();
        }
      }
    }  
    break;

  case 4:
    noStroke();
    background(161, 92, 130);
    for ( int x = 0; x <= width; x+=20) {
      for (int y=0; y <= height; y+=20) {
        float durchmesser = 80-dist(mouseX, mouseY, x, y);
        if (durchmesser > 0) {
          fill(bild.pixels[(x + bild.width*y)]);
          triangle (x, y, x+durchmesser, y+durchmesser, 5, 5);
        }
      }
    }
    break;

  case 5:
    for ( int x = 0; x <= width; x+=10) {
      for ( int y = 0; y <= height; y+=10) {
        float winkel = atan2(mouseX - x, mouseY - y);
        float durchmesser = mouseX-10;
        if (durchmesser > 0) {
          pushMatrix();
          translate(x, y);
          rotate(winkel);
          fill(bild.pixels[x + bild.width*y]);
          triangle(0, 0, 5, 50, 5, 10);
          popMatrix();
        }
      }
    }
    break;

  case 6:
    noStroke();
    background(161, 92, 130);
    for ( int x = 0; x <= width; x+=10) {
      for (int y=0; y <= height; y+=10) {
        float durchmesser = 120-dist(mouseX, mouseY, x, y);
        if (durchmesser > 0) {
          fill(bild.pixels[(x + bild.width*y)]);
          ellipse(x, y, durchmesser/5, durchmesser/5);
        }
      }
    }
    break;

  case 7:
    for ( int x=0; x<= width; x+=7) {
      for ( int y=0; y<=height; y+=7) {
        float durchmesser = 20-dist(mouseX, mouseY, x, y)/20;
        durchmesser += dist(width/2, height/2, x, y)/20;
        if (durchmesser > 0) {
          strokeWeight(durchmesser/10);
          stroke (bild.pixels[(x + width)]);
          float a = atan2(mouseY-height/2, mouseX-width/2);
          rotate(a/20);
          line(x, y, x+durchmesser+20, y+durchmesser);
        }
      }
    }
    break;

  case 8:
    for ( int x=0; x<= width; x+=14) {
      for ( int y=0; y<=height; y+=14) {
        float durchmesser = 10-dist(mouseX, mouseY, x, y)/20;
        durchmesser += dist(width/2, height/2, x, y)/20;
        if (durchmesser > 0) {
          strokeWeight(durchmesser);
          stroke (bild.pixels[(y + width)]);
          rotate(durchmesser/20);
          line(x, y, x+20, y+20);
        }
      }
    }
    break;

  case 9:
    background(255);
    float mouseXFactor = map(mouseX, 0, width, 0.05, 1);
    float mouseYFactor = map(mouseY, 0, height, 0.05, 1);
    for (int gridX = 0; gridX < bild.width; gridX++) {
      for (int gridY = 0; gridY < bild.height; gridY++) {
        float tileWidth = width / (float)bild.width;
        float tileHeight = height / (float)bild.height;
        float posX = tileWidth*gridX;
        float posY = tileHeight*gridY;
        color c = bild.pixels[gridY*bild.width+gridX];
        int greyscale =round(red(c)*0.222+green(c)*0.707+blue(c)*0.071);
        float w5 = map(greyscale, 0, 255, 5, 0.2);
        strokeWeight(w5 * mouseYFactor + 0.1);
        color c2 = bild.get(min(gridX+1, bild.width-1), gridY);
        stroke(c2);
        int greyscale2 = int(red(c2)*0.222 + green(c2)*0.707 + blue(c2)*0.071);
        float h5 = 50 * mouseXFactor;
        float d1 = map(greyscale, 0, 255, h5, 0);
        float d2 = map(greyscale2, 0, 255, h5, 0);
        line(posX-d1, posY+d1, posX+tileWidth-d2, posY+d2);
      }
    }
    break;
  }
}

void keyReleased() {
  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
  if (key == '3') drawMode = 3;
  if (key == '4') drawMode = 4;
  if (key == '5') drawMode = 5;
  if (key == '6') drawMode = 6;
  if (key == '7') drawMode = 7;
  if (key == '8') drawMode = 8;
  if (key == '9') drawMode = 9;
}

public void keyPressed() {
  if (key == 's') saveFrame("img-####.png");
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "img-####.pdf");
      recordPDF = true;
    }
  }
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      endRecord();
      recordPDF = false;
    }
  }
}

