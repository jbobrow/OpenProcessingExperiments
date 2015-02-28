
PImage bg;
PImage bluepanel;
PImage orangekoi;
PImage spottedkoi;
PImage blackkoi;
PImage yellowkoi;
PImage whitespotkoi;
PImage rose;
PImage rosevert;

PFont arabic;
String water = "A drop of water shall be returned with a burst of spring";
String sky = "See sky eat rice";
String fire = "A spark can star a fire that burns the entire prairie";
String boat = "Not only can water float a boat, it can sink also";



void setup() {
    background(216, 205, 197);
    size(640, 480);
    smooth();
    noStroke();
    noLoop();
    
    bg= loadImage ("bg.jpg");
    bluepanel= loadImage ("bluepanel.jpg");
    orangekoi= loadImage ("koi_orange.png");
    spottedkoi= loadImage ("koi_spotted.png");
    blackkoi= loadImage ("koi_sketch.png");
    yellowkoi =loadImage ("koi_yellow.png");
    whitespotkoi =loadImage ("koi_whitespot.png");
    rose = loadImage ("rose.png");
    rosevert = loadImage ("rosevert.png");
    

    
    arabic= loadFont("arabicfont.vlw");
}

void draw () {
  pushMatrix();
  image(bg, 0, 0);
  image (bluepanel, random (width), 0);
  image (bluepanel, random (width+30), 0);
  image (bluepanel, random (width-100), 0);
  image (bluepanel, random (width+80), 0);
  image (rosevert, 0, 0);
  image (rose, 0, 400);
  
  popMatrix();
  
  
  pushMatrix ();
  textFont (arabic);
  fill(0);
  rotate (radians (10));
  text (boat, random (width), 280, 500, 300);
  text (fire, random (width), 330, 500, 300);
  text (sky, random (width), 350, 500, 300);
  text (water, random (width), 386, 500, 300);
  popMatrix();   
 
  pushMatrix ();
  
   image (spottedkoi, random(width/2), random(height/3));
   image (orangekoi, random (width/2), random(height/2));
   image (yellowkoi, random(width/2), random(height/2));
   image (whitespotkoi, random(width/2), random(height/2));
   image (blackkoi, random (width/2), random (height/2));
  popMatrix();
  
  pushMatrix ();
  rotate (radians (45));
  image (blackkoi, random (width/2), random (height/2));
  image (spottedkoi, random(width), random(height));
  image (yellowkoi, random(width), random(height));
  rotate (radians (10));
  image (orangekoi, random (width), random(height));
  image (spottedkoi, random(width), random(height));
  image (yellowkoi, random(width), random(height));
  image (whitespotkoi, random(width), random(height));
  rotate (radians (80));
  image (blackkoi, random (width), random (height));
  image (yellowkoi, random(width), random(height));
  rotate (radians (90));
  image (blackkoi, random (width/5), random (height/5));
 
 
  
  
    
}

void mousePressed ()
{
  redraw();
}

