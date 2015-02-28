
/*
 * Red and Blue 
 * Copyright 2012 Pavel Mironchyk 
 */

RayMachine raymachine;
Shining    blueShining; 

void setup() {
  size(640, 360);
  raymachine = new RayMachine();
  blueShining = new Shining(450, 
                            100, 400,
                           -HALF_PI/4, HALF_PI+ HALF_PI/4,
                           80, 80, 255,
                           50,150, 100);
  
  frameRate(25);
}

void blur_filter() {
  
  float v = 2 / 9.0;
  float[][] kernel = {{ 0.5*v, 0.5*v, 0.5*v }, 
                    { 0.5*v, 2*v, 0.5*v }, 
                    { 0.5*v, 0.5*v, 0.5*v }};
 loadPixels();
  for (int y = 1; y < height-1; y++) {   
    for (int x = 1; x < width-1; x++) {  
      float[] sum = { 0, 0, 0}; 
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*width + (x + kx);
          float val = red(pixels[pos]);
          sum[0] += kernel[ky+1][kx+1] * val;
          val = green(pixels[pos]);
          sum[1] += kernel[ky+1][kx+1] * val;
          val = blue(pixels[pos]);
          sum[2] += kernel[ky+1][kx+1] * val;
        }
      }
      pixels[y*width + x] = color(sum[0],sum[1],sum[2]);
    }
  }
  updatePixels();
}

void draw() {
  background(0);
  noStroke();
  raymachine.draw();
  blueShining.draw();
 // blur_filter();
}
/*
 * Red and Blue 
 * Copyright 2012 Pavel Mironchyk 
 */

class Ray
{
  int num_points;
  int layers;  
  int cx;
  int cy;
  float length;
  float direction;
  
  float[] x, y, r;
  
  float rwidth;
  float dev; // deviation 1
  float dev2; // deviation 2
  
  float oscilation;
  float amplitude;
    
  Ray(int num_points_,
      int layers_, 
      int cx_, int cy_, 
      float length_, 
      float direction_) {
    
    num_points = num_points_;
    layers = layers_;
    cx = cx_;
    cy = cy_;
    length = length_;
    direction = direction_;
    
    rwidth = 50 + random(-10,10);

    dev = 10; 
    dev2 = 5;
    
    x = new float[num_points];
    y = new float[num_points];
    r = new float[num_points*layers];
    
    float phase_shift = random(-HALF_PI, HALF_PI);
    float fragmenter = random(30, num_points);
    
    oscilation = random(40, 100);
    amplitude = random(-1,1)*HALF_PI;
  }
  
  void update()
  {
    float phase_shift = random(-HALF_PI, HALF_PI);
    float fragmenter = random(0, 100);
    float angle = direction + amplitude*sin(frameCount*TWO_PI/oscilation);
    float length_ = length + random(-150, 50);
    for(int i = 0; i < num_points; i++)
    {
      float rr2 = length_*i/num_points; 
      x[i] = cx + rr2*sin(angle) + random(-dev, dev);
      y[i] = cy - rr2*cos(angle) + random(-dev, dev);
      
      r[i] = rwidth*cos(float(i)*HALF_PI/1.3/num_points) + dev2 + dev2*sin(phase_shift + i*TWO_PI/fragmenter);
      
      for(int j = 1 ; j < layers; j++) 
      {
           float z =  r[i+((j-1)*num_points)] - rwidth/layers;
           if(z <= 0) z = 1.0;
           r[i + (j*num_points)] =z;
      }  
    }
   
  }
};


class RayMachine
{
  int num_layers; // number of layers for blur effect
  int num_points;
  int shiness;
  
  ArrayList<Ray> rays;
  
  RayMachine()
  {
    num_layers = 10;
    shiness    = 4;
    num_points = 130;
    
    int cx = 100;
    int cy = 300;
    
    int numrays = 15;
    
    rays = new ArrayList<Ray>();
    while(numrays > 0)
    {
      rays.add(new Ray(num_points,
                       num_layers,
                       cx, cy,
                       500 + random(-200, 0),
                       PI/4-random(-PI/4, PI/4)));
      numrays --;
    } 
  }
  
  void draw()
  {
     for(int j = 0; j < rays.size(); j++) {
           rays.get(j).update();
     }
           
     int layer = 0; 
     while(layer < num_layers)
     {
        if(layer < num_layers/2)
          fill(255, 0, 0, shiness);
        else
          fill(255, 255, 255, shiness);
       
       for(int i = 0 ; i < num_points; i ++) {
         for(int j = 0; j < rays.size(); j++) {
           Ray ray = rays.get(j);
           int r = (int)ray.r[i+(layer*num_points)];
           rect(ray.x[i] - r/2, ray.y[i] - r/2, r, r);
           //ellipse(ray.x[i], ray.y[i], r, r);
         }
       }
       layer ++;
     }
  }
};

/*
 * Red and Blue 
 * Copyright 2012 Pavel Mironchyk 
 */

class Shining
{

  float radius;
  int cx;
  int cy;
  float phi_min, phi_max;
  int[] scolor;
  
  int deviation1;
  int deviation2;
  int swidth;

  Shining(float radius_, 
             int cx_, int cy_, 
             float phi_min_, float phi_max_, 
             int r, int g, int b,
             int deviation1_,
             int deviation2_,
             int swidth_) {
    radius = radius_;
    cx = cx_;
    cy = cy_;
    phi_min = phi_min_;
    phi_max = phi_max_;
    scolor = new int[]{r,g,b};
    
    deviation1 = deviation1_;
    deviation2 = deviation2_;
    swidth = swidth_;
  }
  
  void draw() {
    for(float phi = phi_min; phi< phi_max; phi += 0.07)
    {
      for(float r = radius - random(-deviation1/*50*/, deviation2/*150*/); r < radius + swidth/*100*/ + random(0, /*50*/deviation1) ; r += 10)
      {
        //fill(80, 80, 255, 10);
        fill(scolor[0], scolor[1], scolor[2], 10);
        if((phi < (PI/4 + PI/6)) && (phi > (PI/4 - PI/6))) {
          if((r < (radius + 50)) && (r > (radius - 50))) {
                fill(255, 255, 255, 20.0 * exp(-0.5*(phi-PI/3)*(phi-PI/3) / (PI*PI/200)) * exp(-0.5*(r-radius)*(r-radius) / (radius*radius/100)));
          }
        }
         
        
        int x = cx + (int)(r*cos(phi));
        int y = cy - (int)(r*sin(phi));
        rect(x-50, y-50, 100, 100);
      }
    }
  }  
};



