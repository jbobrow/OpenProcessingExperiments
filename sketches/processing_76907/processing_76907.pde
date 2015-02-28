
PImage img; 
PImage  palette1;
PImage  palette2;
PImage  palette3;
PImage  palette4;
PImage  palette5;
PImage  palette6;
PImage  palette7;
PImage  palette8;


float angle;
float jitter;

void setup() {
  size(548,674);
  frameRate(5);
 
 
  img = loadImage("canvas-scan.jpg");
  palette1 = loadImage("palette1.png");
  palette2 = loadImage("palette2.png");
  palette3 = loadImage("palette3.png");
  palette4 = loadImage("palette4.png");
  palette5 = loadImage("palette5.png");
  palette6 = loadImage("palette6.png");
  palette7 = loadImage("palette7.png");
  palette8 = loadImage("palette8.png");
  
}

void draw() {
  image(img,0,0);
  
   if (mousePressed) {

   tint(random(0,255),random(0,255),random(0,255), random(255));
  
   image(palette1,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette2,0,random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette3,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette4,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette5,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
    image(palette6,0, random(500));
     tint(random(0,255),random(0,255),random(0,255), random(255));
    image(palette7,0, random(500));
     tint(random(0,255),random(0,255),random(0,255), random(255));
    image(palette8,0, random(500));

image(palette1,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette2,0,random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette3,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette4,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette5,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
    image(palette6,0, random(500));
     tint(random(0,255),random(0,255),random(0,255), random(255));
    image(palette7,0, random(500));
     tint(random(0,255),random(0,255),random(0,255), random(255));
    image(palette8,0, random(500));
    
    image(palette1,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette2,0,random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette3,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette4,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette5,0, random(500));
    tint(random(0,255),random(0,255),random(0,255), random(255));
    image(palette6,0, random(500));
     tint(random(0,255),random(0,255),random(0,255), random(255));
    image(palette7,0, random(500));
     tint(random(0,255),random(0,255),random(0,255), random(255));
    image(palette8,0, random(500));
    
     } else {
  
  image(img,0,0);
  noTint();

  }
 
  
  }


