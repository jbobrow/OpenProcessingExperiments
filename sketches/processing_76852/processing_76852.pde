
PImage img; 
PImage  palette1;
PImage  palette2;
PImage  palette3;
PImage  palette4;
PImage  palette5;


float angle;
float jitter;

void setup() {
  size(548,674);
  frameRate(1);
 
 
  img = loadImage("canvas-scan.jpg");
  palette1 = loadImage("palette1.png");
  palette2 = loadImage("palette2.png");
  palette3 = loadImage("palette3.png");
  palette4 = loadImage("palette4.png");
  palette5 = loadImage("palette5.png");
  
}

void draw() {
  image(img,0,0);
  
   if (mousePressed) {

   tint(random(0,255),random(0,255),random(0,255), random(255));
  
   image(palette1, random(500), random(600));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette2, random(500),random(600));
   image(palette3, random(200), random(300));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette4, random(500), random(400));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette5, random(500), random(600));
 tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette1, random(500), random(500));
   image(palette2, random(500),random(600));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette3, random(250), random(300));
   image(palette4, random(500), random(600));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette5, random(500), random(600));

   image(palette1, random(500), random(600));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette2, random(500),random(600));
   image(palette3, random(200), random(300));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette4, random(500), random(400));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette5, random(500), random(600));
 tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette1, random(500), random(500));
   image(palette2, random(500),random(600));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette3, random(250), random(300));
   image(palette4, random(500), random(600));
    tint(random(0,255),random(0,255),random(0,255), random(255));
   image(palette5, random(500), random(600));

   
    
     } else {
  
  image(img,0,0);
  noTint();

  }
 
  
  }


