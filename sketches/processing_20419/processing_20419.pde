
PImage vasescale;
PImage vasescale2;
PImage flower1;
PImage flower2;
PImage flower3;
PImage flower4;
PImage flower5;
PImage flower6;
PImage vase;
PImage vase2;
PImage imageMask1;
PImage imageMask2;
PImage imageMask3;
PImage imageMask4;
PGraphics minutesShape;
PGraphics hoursShape;
PGraphics datesShape;
PGraphics monthsShape;
color color1 = color(223,114,173,150);
color color2 = color(252,178,71,150);
color color3 = color(240,234,75,180);
color color4 = color(134,198,91,180);

void setup() {
  size(340, 640);
  smooth();
  vasescale = loadImage("scale-01.png");
  vasescale2 = loadImage("vasescale2-01.png");
  flower1 = loadImage("flower1-01.png");
  flower2 = loadImage("flower2-01.png");
  flower3 = loadImage("flower3-01.png");
  flower4 = loadImage("flower4-01.png");
  flower5 = loadImage("flower5-01.png");
  flower6 = loadImage("flower6-01.png");
  vase = loadImage("vase-01.png");
  vase2 = loadImage("vase2.png");
  imageMask1 = loadImage("mask1.png");
  imageMask2 = loadImage("mask2.png");
  imageMask3 = loadImage("mask3.png");
  imageMask4 = loadImage("mask4.png");
  minutesShape = createGraphics(imageMask1.width, imageMask1.height, P2D);
  hoursShape = createGraphics(imageMask2.width, imageMask2.height, P2D);
  datesShape = createGraphics(imageMask3.width, imageMask3.height, P2D);
  monthsShape = createGraphics(imageMask4.width, imageMask4.height, P2D);
}

void draw() {
  background(255);
  
  image(vase,0,0);
  
  minutesShape.beginDraw();
  minutesShape.image(vase,0,0);
  minutesShape.noStroke();
  minutesShape.fill(color1);
  float m = map(minute(), 0, 60, 606, 275);
  minutesShape.rect(0, m, width, 600);
  minutesShape.endDraw();
  minutesShape.mask(imageMask1);
  image(minutesShape, 0, 0);  
  
  hoursShape.beginDraw();
  hoursShape.image(vase,0,0);
  hoursShape.noStroke();
  hoursShape.fill(color2);
  float hMadulo = hour() % 12;
  float h = map(hMadulo, 0, 12, 555, 275);
  hoursShape.rect(0, h, width, 600);
  hoursShape.endDraw();
  hoursShape.mask(imageMask2);
  image(hoursShape, 0, 0); 
  
  datesShape.beginDraw();
  datesShape.image(vase,0,0);
  datesShape.noStroke();
  datesShape.fill(color3);
  float d = map(day(), 0, 31, 483, 275);
  datesShape.rect(0, d, width, 600);
  datesShape.endDraw();
  datesShape.mask(imageMask3);
  image(datesShape, 0, 0); 
  
  monthsShape.beginDraw();
  monthsShape.image(vase,0,0);
  monthsShape.noStroke();
  monthsShape.fill(color4);
  float mon = map(month(), 0, 12, 404, 275);
  monthsShape.rect(0, mon, width, 600);
  monthsShape.endDraw();
  monthsShape.mask(imageMask4);
  image(monthsShape, 0, 0); 
  
  int s = second();
  if(s < 10) {
    image(flower1,0,0);
  } else if(s < 20) {
    image(flower2,0,0);
  } else if(s < 30) {
    image(flower3,0,0);
  } else if(s < 40) {
    image(flower4,0,0);
  } else if(s < 50) {
    image(flower5,0,0);
  } else if(s < 60) {
    image(flower6,0,0);
  }
  
  image(vase2,0,0);
  
  image(vasescale2,0,0);
}

