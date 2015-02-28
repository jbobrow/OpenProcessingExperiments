
PImage[] images = new PImage[41];
int xCent;
int yCent;
float turnChange = 0;
int imageSel;
float selX;
float selY;
float selW = 30.0;
float selH = 20.0;
float selXCh;
float selYCh;
float selWCh;
float selHCh;
boolean selected = false;
boolean released = false;
boolean hold = false;
float speed = 20;
void setup() {
  size(640, 480);
  xCent = width / 2;
  yCent = height / 2;
  imageMode(CENTER);
  for (int i = 0; i < images.length; i++) {
    images[i] = loadImage(i + ".JPG");
  }
}
void draw() {
  background(0);
  turnChange += 0.1;
  if(selected || hold || released) {
    for(int i = 0; i < imageSel; i++) {
    float lineAng = radians((360 / (images.length - 1) * i) + turnChange);
    image(images[i], xCent + (200 * cos(lineAng)),
          yCent + (200 * sin(lineAng)), 30, 20);
    }
    for(int i = imageSel + 1; i < images.length; i++) {
    float lineAng = radians((360 / (images.length - 1) * i) + turnChange);
    image(images[i], xCent + (200 * cos(lineAng)),
          yCent + (200 * sin(lineAng)), 30, 20);
    }
  }
  else {
    for(int i = 0; i < images.length; i++) {
      float lineAng = radians((360 / (images.length - 1) * i) + turnChange);
      image(images[i], xCent + (200 * cos(lineAng)),
            yCent + (200 * sin(lineAng)), 30, 20);
    }
  }
  if(mousePressed && selected) {
    zoomImage();
  }
  if(mousePressed && hold) {
    image(images[imageSel], selX, selY, selW, selH);
  }
  if(released) {
    shrinkImage();
  }
}
void mousePressed() {
  for(int i = 0; i < images.length; i++) {
    float lineAng = radians((360 / (images.length - 1) * i) + turnChange);
    if(mouseX >= xCent + (200 * cos(lineAng)) - 15 &&
       mouseX <= xCent + (200 * cos(lineAng)) + 15 &&
       mouseY >= yCent + (200 * sin(lineAng)) - 10 &&
       mouseY <= yCent + (200 * sin(lineAng)) + 10) {
         imageSel = i;
         selX = xCent + (200 * cos(lineAng));
         selY = yCent + (200 * sin(lineAng));
         selXCh = (xCent - selX) / speed;
         selYCh = (yCent - selY) / speed;
         selWCh = (320 - selW) / speed;
         selHCh = (213 - selH) / speed;
         selected = true;
    }
  }
}
void mouseReleased() {
  if(hold) {
    float lineAng = radians((360 / (images.length - 1) * imageSel) + turnChange);
    selXCh = (200 * cos(lineAng)) / speed;
    selYCh = (200 * sin(lineAng)) / speed;
    selWCh = (30 - selW) / speed;
    selHCh = (20 - selH) / speed;
    hold = false;
    released = true;
  }
}
void zoomImage() {
  selX += selXCh;
  selY += selYCh;
  selW += selWCh;
  selH += selHCh;
  image(images[imageSel], selX, selY, selW, selH);
  if(selW >= 320) {
    selX = xCent;
    selY = yCent;
    selW = 320;
    selH = 213;
    selected = false;
    hold = true;
    selXCh = 0;
    selYCh = 0;
    selWCh = 0;
    selHCh = 0;
  }
}
void shrinkImage() {
  float lineAng = radians((360 / (images.length - 1) * imageSel) + turnChange);
  selX += selXCh;
  selY += selYCh;
  selW += selWCh;
  selH += selHCh;
  image(images[imageSel], selX, selY, selW, selH);
  if(selW <= 30) {
    selX = xCent + (200 * cos(lineAng));
    selY = yCent + (200 * sin(lineAng));
    selW = 30;
    selH = 15;
    selXCh = 0;
    selYCh = 0;
    selWCh = 0;
    selHCh = 0;
    released = false;
  }
}

