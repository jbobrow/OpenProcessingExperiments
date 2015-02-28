
// Anna Lee
// DMA 28 Summer 2012
// Workshop 6

// The 3 x 9 grid of images moves in the following manner:
//  - linearly to the left
//  - sinusoidally up and down
//  - sinusoidally in and out (via scaling of coordinate system)
// Each tile periodically morphs from one random transformation to another


// images
PImage[] images_t = new PImage[9]; // top row
PImage[] images_c = new PImage[9]; // center row
PImage[] images_b = new PImage[9]; // bottom row

// previous random transformation for each image
float[] txLast = new float[27];
float[] tyLast = new float[27];
float[] sxLast = new float[27];
float[] syLast = new float[27];

// next random transformation for each image
float[] txNext = new float[27];
float[] tyNext = new float[27];
float[] sxNext = new float[27];
float[] syNext = new float[27];


// morph control
int m = 0;
float mspeed = 1;
float mperiod = 100;

// movement control
float x = 0;
float xspeed = 1.5;


void morph(int i)
{
/*
  morph image by using cubic interpolation between last morph and next morph
*/
  float t = m/mperiod;
  float a = t*t*(3.0 - (2.0*t));
  float b = 1.0 - a;
  translate(txLast[i]*b + txNext[i]*a, tyLast[i]*b + tyNext[i]*a);
  scale(sxLast[i]*b + sxNext[i]*a, syLast[i]*b + syNext[i]*a);
}


void setup()
{
  size(600, 300);
  smooth();
  imageMode(CENTER);
  
  // load images
  String imageName;
  for (int i = 0; i < 9; i++)
  {
    imageName = "rr_0" + i + ".jpg";
    images_t[i] = loadImage(imageName);
    
    imageName = "rr_1" + i + ".jpg";
    images_c[i] = loadImage(imageName);
    
    imageName = "rr_2" + i + ".jpg";
    images_b[i] = loadImage(imageName);
  }
  
  // initialize random morph states
  for (int i = 0; i < 27; i++)
  {
    txLast[i] = random(-30.0, 30.0);
    tyLast[i] = random(-30.0, 30.0);
    sxLast[i] = random(0.70, 1.3);
    syLast[i] = random(0.70, 1.3);
    txNext[i] = random(-30.0, 30.0);
    tyNext[i] = random(-30.0, 30.0);
    sxNext[i] = random(0.7, 1.3);
    syNext[i] = random(0.7, 1.3);    
  }
}


void draw() 
{
  background(150);
  
  // move and scale screen to create movement
  translate(width/2, height/2); 
  translate(0, 50*sin(x/100.0));
  scale(0.25*cos(x/100.0) + 1, 0.25*cos(x/100.0) + 1);
  translate(-x, 0);
  
  // draw unmorphed images (as background fill)
  for (int i=0; i<9; i++)
  {
    // as images move too far left, shift sends them back to the right side 
    int shift = max(ceil((i*150 - x + 450)/(-1350)), 0);
    
    pushMatrix();
      translate(150*i + 1350*shift - 300, -150);
      image(images_t[i], 0, 0, 150, 150);    
      translate(0, 150);
      image(images_c[i], 0, 0, 150, 150);    
      translate(0, 150);
      image(images_b[i], 0, 0, 150, 150);    
    popMatrix();
  }
  
  // draw morphed images
  for (int i=0; i<9; i++)
  {
    // as images move too far left, shift sends them back to the right side
    int shift = max(ceil((i*150 - x + 450)/(-1350)), 0);
    
    pushMatrix();
      translate(150*i + 1350*shift - 300, -150);
      pushMatrix();
        morph(i);
        image(images_t[i], 0, 0, 150, 150);
      popMatrix();
      translate(0, 300);
      pushMatrix();
        morph(i+18);
        image(images_b[i], 0, 0, 150, 150);
      popMatrix();
      translate(0, -150);   
      pushMatrix();
        morph(i+9);    
        image(images_c[i], 0, 0, 150, 150);
      popMatrix();
    popMatrix();
  }    
  
  x += xspeed;
  m += mspeed;
  // when m reaches mperiod: reset m and make new morph states
  if (m > mperiod)
  {
    m = 1;
    for (int i=0; i<27; i++)
    {
      txLast[i] = txNext[i];
      tyLast[i] = tyNext[i];
      sxLast[i] = sxNext[i];
      syLast[i] = syNext[i];
      
      txNext[i] = random(-30.0, 30.0);
      tyNext[i] = random(-30.0, 30.0);
      sxNext[i] = random(0.7, 1.3);
      syNext[i] = random(0.7, 1.3);    
    }
  }
}

