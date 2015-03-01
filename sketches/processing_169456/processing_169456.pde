
PImage img;

float mcnt = 0.0f;

float[][] myArray = {  {0.0f, 0.0f, 0.0f},
                       {1.0f, 0.0f, 0.6f},
                       {0.0f, 1.0f, 1.0f},
                       {1.0f, 1.0f, 1.0f}  };


          
float[] lookup(float v, float[][] arr)
{
  float[] ma = {0.0f, 0.0f, 0.0f};
  
  v *= 0.999f;
  v *= arr.length - 1.0f;

  int idx1 = floor(v);
  float f = v - idx1;
  int idx2 = idx1 + 1;
  
//  println("v: " + v + " idx1: " + idx1 + " idx2: " + idx2 + " f: " + f);
  
  float[] ca1 = arr[idx1]; 
  float[] ca2 = arr[idx2]; 
  
  ma[0] = lerp(ca1[0], ca2[0], f);
  ma[1] = lerp(ca1[1], ca2[1], f);
  ma[2] = lerp(ca1[2], ca2[2], f);
  
  return ma;
}
                     
void setup()
{
  size(512, 512, P2D);
  img = createImage(width / 2, height / 2, RGB);
  colorMode(RGB, 1.0);
}

void draw()
{
  background(0);

  img.loadPixels();

  float xs = 1.0f / width;
  float ys = 1.0f / height;

  float mx = -cos(mcnt * 0.099) * 4000.0f + 4000.0f;
  float my = -cos(mcnt * 0.1) * 4000.0f + 4000.0f;

  for (int y = 0; y < img.height; y++)
  {
    float yf = (float)y * ys;

    for (int x = 0; x < img.width; x++)
    {
      float xf = (float)x * xs;      

      float xc = sin(xf * mx * sin(mcnt + yf * 2.5f)) * 0.5 + 0.5;
      float yc = sin(yf * my * sin(mcnt + xf * 2.5f)) * 0.5 + 0.5;

      xc *= yc;
      
      float[] ca = lookup(xc, myArray);
      //xc *= xc;

      img.pixels[y * img.width + x] = color(ca[0], ca[1], ca[2]);
    }
  }
  img.updatePixels();  

  image(img, 0, 0, width / 2, height / 2);    

  pushMatrix();
  scale(-1.0, 1.0);
  image(img, -img.width * 2, 0, width / 2, height / 2);    
  popMatrix();

  pushMatrix();
  scale(1.0, -1.0);
  image(img, 0, -img.width * 2, width / 2, height / 2);    
  popMatrix();

  pushMatrix();
  scale(-1.0, -1.0);
  image(img, -img.width * 2, -img.width * 2, width / 2, height / 2);    
  popMatrix();

  mcnt += 0.01f;
  //saveFrame("/output/seq-####.tga");
}

