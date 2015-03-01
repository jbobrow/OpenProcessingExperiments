
PImage[] images_t = new PImage[9];
PImage[] images_c = new PImage[9];
PImage[] images_b = new PImage[9];
float[] txLast = new float[27];
float[] tyLast = new float[27];
float[] sxLast = new float[27];
float[] syLast = new float[27];
float[] txNext = new float[27];
float[] tyNext = new float[27];
float[] sxNext = new float[27];
float[] syNext = new float[27];
 
int m = 0;
float mspeed = 1;
float mperiod = 100;
float x = 0;
float xspeed = .5;
 
void morph(int i)
{
  float t = m/mperiod;
  float a = t*t*(3.0 - (2.0*t));
  float b = 1.0 - a;
  translate(txLast[i]*b + txNext[i]*a, tyLast[i]*b + tyNext[i]*a);
  scale(sxLast[i]*b + sxNext[i]*a, syLast[i]*b + syNext[i]*a);
}
 
 
void setup()
{
  size(800, 300);
  smooth();
  imageMode(CENTER);
   
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
   
  translate(width/2, height/2);
  translate(0, 50*sin(x/100.0));
  scale(0.25*cos(x/100.0) + 1, 0.25*cos(x/100.0) + 1);
  translate(-x, 0);
   
  for (int i=0; i<9; i++)
  {
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
   
  for (int i=0; i<9; i++)
  {
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
