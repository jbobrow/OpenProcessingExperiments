
boolean firstRun = true;
int iHeight, iWidth; 
int
numBlips = 30, 
blipHeightSteps = 5;

// drawing
float[]  
blipHeight, 
blipWidth; 

float 
blipMaxHeight = 150.0, 
offsetY,
offsetX = 120,
x, y, w, h, r;    

// eyes
float  eyeX, eyeY;

float[] 
eyeSpacing, 
eyeLeftRadius, 
eyeRightRadius;

// mouth
float[][] blipMouth;

// hat
float hatHeight = 10;
boolean[] blipHat;

boolean[] blipButterfly;

// base colour
color[] blipColour;

// filters
PImage bg, noiseLayer;


void setup() {
  size(800, 160);
  iHeight = height;
  iWidth = width;

  //noSmooth();
  rectMode(CORNER);
  ellipseMode(CENTER);

  defaultSettings();
}

void draw() {
    
  image(bg,0,0);
  
  strokeWeight(2);
  stroke(20);
  frameRate(24);

  float spacing = 2; 
  for (int i=0; i < numBlips; i++) {     
    w = blipWidth[i];
    h = blipHeight[i];
    //y = offset - h + blipMaxHeight - y;
    y = offsetY - h;
    x = offsetX + (i * w);
    
    fill(blipColour[i]);
    rect(x, y, w, h, eyeLeftRadius[i], eyeRightRadius[i], 0, 0);  
  }
  for (int i=0; i < numBlips; i++) {     
    w = blipWidth[i];
    h = blipHeight[i];
    //y = offset - h + blipMaxHeight - y;
    y = offsetY - h;
    x = offsetX + (i * w);
    
    fill(255);

    eyeY = y + 10;
    eyeX = x + w/2 - eyeSpacing[i]/2;    
    r = eyeLeftRadius[i];
    ellipse(eyeX, eyeY, r, r);
    point(eyeX+1, eyeY);
    /*triangle(
      eyeX,                eyeY+eyeLeftRadius[i]+random(2,4),
      eyeX+eyeSpacing[i],  eyeY+eyeRightRadius[i]+random(2,4),
      eyeX+eyeSpacing[i]/2,eyeY+eyeRightRadius[i]+random(5,7)
    );
    line(
      eyeX,                eyeY+eyeLeftRadius[i]+random(2,4),
      eyeX+eyeSpacing[i],  eyeY+eyeRightRadius[i]+random(2,4)
      
    );*/
    
    noFill();
    if (firstRun) { // lazy hack. The blips should get their own class..
      blipMouth[i] = new float[8];
      
      blipMouth[i][0] = eyeX;
      blipMouth[i][1] = eyeY+eyeLeftRadius[i]+random(2,4);
      
      blipMouth[i][2] = eyeX+random(-2,2);
      blipMouth[i][3] = eyeY+eyeLeftRadius[i]+random(3,6); // control
      
      blipMouth[i][4] = eyeX+eyeSpacing[i]+random(-2,2);
      blipMouth[i][5] = eyeY+eyeRightRadius[i]+random(3,6); // control
      
      blipMouth[i][6] = eyeX+eyeSpacing[i];
      blipMouth[i][7] = eyeY+eyeRightRadius[i]+random(2,4);  
    }
    bezier(
      blipMouth[i][0],
      blipMouth[i][1],
      blipMouth[i][2],
      blipMouth[i][3],
      blipMouth[i][4],
      blipMouth[i][5],
      blipMouth[i][6],
      blipMouth[i][7]      
    );
    
    
    fill(255);
    
    eyeX = x + w/2 + eyeSpacing[i]/2;    
    r = eyeRightRadius[i];
    ellipse(eyeX, eyeY, r, r);       
    point(eyeX-1, eyeY);
    
    // hat
    if (blipHat[i]) {
      noStroke();
      fill(05);    
      
      ellipse(x+w/2,y, 24, 5);      
      rect(x+2, y-hatHeight, w-4, hatHeight);     
      ellipse(x+w/2,y-hatHeight, 16, 5);     
      
      stroke(0);
    }
    
    if (blipButterfly[i]) {
      
      strokeWeight(0.5);
      fill(255,0,80);
      float f = 4;
      triangle(x+w/2-1,  y+34,
               x+w/2+6,  y+30,
               x+w/2+5,  y+38);
      triangle(x+w/2+1,  y+34,
               x+w/2-6,  y+30,
               x+w/2-5,  y+38);
               
      
      strokeWeight(2);
    }
  }

  image(noiseLayer, 0, 0);
  
  firstRun = false;
}

void mousePressed() {
  defaultSettings();
}

void createBackgrounds() {
  bg = createImage(width, height, RGB);
  bg.loadPixels();
  for (int i = 0; i < bg.pixels.length; i++) {
    bg.pixels[i] = color(138, (int)random(185, 200), (int)random(245, 255));
  }
  bg.updatePixels();

  noiseLayer = createImage(width, height, ARGB);
  noiseLayer.loadPixels();
  for (int i = 0; i < noiseLayer.pixels.length; i++) {
    float s = random(235, 255);
    float a = random(1, 30);
    noiseLayer.pixels[i] = color(s, s, s, a);
  }
  noiseLayer.updatePixels();
}  


void defaultSettings() {
  firstRun = true;
  
  offsetY = iHeight;
  
  blipColour = new color[numBlips];
  
  blipMouth = new float[numBlips][];
  blipWidth = new float[numBlips];
  blipHeight = new float[numBlips];

  eyeLeftRadius = new float[numBlips];
  eyeRightRadius = new float[numBlips];
  eyeSpacing = new float[numBlips];
  
  blipHat = new boolean[numBlips];
  blipButterfly  = new boolean[numBlips];

  for (int i = 0; i < numBlips; i++) {
    blipHat[i] = random(0,1) > 0.85; 
    blipButterfly[i] = random(0,1) > 0.83;
    
    blipColour[i] = color( 128+random(0, 128), 32+random(0, 128), random(0, 128)+128);
    blipWidth[i] = 20;

    blipHeight[i] = 10 + round( random(1, blipHeightSteps) ) * 20;    
    int j = max(0, i-1);
    if (blipHeight[i] == blipHeight[j] && i > 0) {      
      //blipHeight[i] = round(random(1, blipHeightSteps)) * 20;v      
      blipHeight[i] = 10 + round( random(1, blipHeightSteps) ) * 20;
      //println(blipHeight[i] + " == "+ blipHeight[j] + ", " +i);
    }

    eyeSpacing[i] = random(6, 14);
    eyeLeftRadius[i] =  random(6, 10);
    eyeRightRadius[i] = random(6, 9);
  }

  // bg
  createBackgrounds();
}

