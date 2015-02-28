
PImage img; 
PImage impasto1;
PImage shortstroke;
PImage impcorner;
PImage impcorner2;
PImage impcorner3;
PImage  paletteknife1;
PImage  paletteknife2;
PImage  paletteknife3;

float angle;
float jitter;

void setup() {
  size(548,674);
  frameRate(1);
 
 
  img = loadImage("canvas-scan.jpg");
  impasto1 = loadImage("impasto1.png");
  shortstroke = loadImage("shortstroke.png");
  impcorner = loadImage("impasto_topcorner.png");
  impcorner2 = loadImage("impasto_topcorner2.png");
  impcorner3 = loadImage("impasto_topcorner3.png");
  paletteknife1 = loadImage("paletteknife1.png");
  paletteknife2 = loadImage("paletteknife2.png");
  paletteknife3 = loadImage("paletteknife3.png");
 
  

}

void draw() {
  image(img,0,0);
 

  if (keyPressed) {
    if (key == 'g' || key == 'G') {
      background(255);
    }
    } else {
      image(img,0,0);
    }
    
    
  if (mousePressed) {
  

   tint(random(0,255),random(0,255),random(0,255));
   
   image(impasto1, random(100), random(100));
   image(shortstroke,random(100),random(100));
   image(impasto1, random(100), random(100));
   
    tint(random(0,255),random(0,255),random(0,255));
   image(impcorner,random(548),random(674));
    tint(random(0,255),random(0,255),random(0,255));
   image(impcorner2, random(548), random(674));
    tint(random(0,255),random(0,255),random(0,255));
   image(impcorner3, random(548), random(674));
    tint(random(0,255),random(0,255),random(0,255));
   image(shortstroke,random(548),random(674));
     
      tint(random(0,255),random(0,255),random(0,255));
   image(impasto1, random(548), random(674));
   image(shortstroke,random(548),random(674));
   image(impasto1, random(548), random(674));
   
   image(shortstroke,random(548),random(674));
   image(impasto1, random(548), random(674));
   
   image(shortstroke,random(548),random(674));
    
   image(paletteknife1, random(548), random(674));
    tint(random(0,255),random(0,255),random(0,255));
   image(paletteknife2,random(548),random(674));
    tint(random(0,255),random(0,255),random(0,255));
   image(paletteknife3, random(548), random(674));
  
   tint(random(0,255),random(0,255),random(0,255));
   image(shortstroke,random(548),random(674));
    
   image(impasto1, random(548), random(674));
    tint(random(0,255),random(0,255),random(0,255));
   image(shortstroke,random(548),random(674));
    tint(random(0,255),random(0,255),random(0,255));
   image(impasto1, random(548), random(674));
    tint(random(0,255),random(0,255),random(0,255));
   
   image(impcorner,random(500),random(500));
   image(impcorner2, random(500), random(500));
   image(impcorner3, random(500), random(500));
 
   image(shortstroke,random(548),random(674));
     
      tint(random(0,255),random(0,255),random(0,255));
   image(impasto1, random(548), random(674));
 tint(random(0,255),random(0,255),random(0,255));
   image(shortstroke,random(548),random(674));
   image(impasto1, random(548), random(674));
    tint(random(0,255),random(0,255),random(0,255));
   
   image(shortstroke,random(548),random(674));
   image(impasto1, random(548), random(674));
  
   image(shortstroke,random(548),random(674));
    tint(random(0,255),random(0,255),random(0,255));
   image(paletteknife1, random(548), random(674));
   image(paletteknife2,random(548),random(674));
    tint(random(0,255),random(0,255),random(0,255));
   image(paletteknife3, random(548), random(674));

   image(shortstroke,random(548),random(674));
   
 
    
  } else {
  
  image(img,0,0);
  noTint();

  }
 
  
  }


