
/////////////////////////// //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Based on:
// Around you
// https://www.flickr.com/photos/sergioalbiac/7127965111/
// used image http://society6.com/product/sasha-c7u_print#1=45
//
// Controls:
// leftClick   - draw arcCircle
// rightClick  - clear
// centerClick - set start diametr for arcCircle
// 
// keys:
// s - save image
// r - add random 5-15 arcCircles
//
/////////////////////////////////////////////////
int startDiam = 10;
int diam = startDiam;
int arcStep = 1;
int speedGrow = 5;
int maxAngle = 360;
int cx;
int cy;
color [] arcClr = new color[maxAngle]; 
PImage img;

void setup() {
  img = loadImage("Sasha.jpg");
//  size(img.width, img.height);
  size(423, 600);
  image(img, 0, 0);
  frameRate(300);
}

void draw() {
  if (mousePressed && mouseButton == LEFT) {
    arcCircle((int)mouseX, (int)mouseY, diam+=speedGrow, arcStep);
    cx = (int)mouseX;
    cy =(int)mouseY;
  } else if (mousePressed && mouseButton == RIGHT ) {
    image(img, 0, 0);
  } else {
    diam = startDiam;
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("img-###" + (int)random(100, 700) +".jpg");
  } else if (key == 'r') {
    for (int i = (int)random(5, 15); i >= 0; --i) {        
      int x = (int)random(0, img.width-1);
      int y = (int)random(0, img.height-1);
      int size = (int)random(img.width/5, img.width/2);

      for (int j = 0; j < 1; j++) {
        arcCircle(x, y, size, 1);
      }
    }
  }
}

void arcCircle(int cirlX, int cirlY, int diamRaduis, int arcStep) {
  int angle = 0;
  int speed = arcStep;
  int arcRadius = diamRaduis/2;
  int x, y;

  noStroke();
  fill(255);

  while (angle< maxAngle) {
    x = int(cirlX + cos(radians(angle)) * arcRadius);
    y = int(cirlY + sin(radians(angle)) * arcRadius);

    if ( cx != cirlX || cy != cirlY) {
      x = min(max(x, 1), img.width-1);    
      y = min(max(y, 1), img.height-1);
      color clr = img.get(x, y);
      arcClr[angle] = clr;
    } else if (!(   x < 1 || y < 1 || y < 1 || x < 1 
      || x > img.width-1  || x > img.width-1 
      || y > img.height-1 || y > img.height-1 ))
    {
      x = min(max(x, 1), img.width-1);    
      y = min(max(y, 1), img.height-1); 
      color clr = img.get(x, y);
      arcClr[angle] = clr;
    }

    fill(arcClr[angle]);
    float radSrt = radians(angle);
    float radEnd = radians(angle+arcStep);
    arc(cirlX, cirlY, diamRaduis, diamRaduis, radSrt, radEnd);
    arc(cirlX, cirlY, diamRaduis, diamRaduis, radSrt, radEnd);
    angle += speed;
  }
}


