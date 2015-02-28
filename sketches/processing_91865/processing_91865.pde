
int countP=0;
int countC =0;

void setup(){
  size(500, 500);
  background(0,128,128);
  smooth();
 
  int centx = width/2;
  int centy = height/2; 
  
  //stroke(20,150,70);
  noStroke();
  int step = 2;
  
  float xseed = random(10);
  float yseed = random(10);
  
  float xnoise = xseed;
  float ynoise = yseed;
  float persistence = 0.1;
  int count=0;  
  
  float a;
  for(int x = 0; x< 500; x+=step)
  {
    for(int y = 0; y < 500; y+=step)
    {
   
      if(dist(centx, centy, x, y) > 200)
      {
         persistence = 0.1; 
      }
      else if (dist(centx, centy, x, y) > 190)
      {
         persistence = 0.6; 
      }
      else
      {
         persistence = 0.45; 
      }
      
      
      a = PerlinNoise_2D(xnoise, ynoise, persistence)*150;
      
      fill(255,69,0,a);
      rect(x,y,step,step);
      ynoise =yseed + y*0.08;
   }
   xnoise =xseed + x*0.08;   
  } 
 
  noFill();
  stroke(0,128,128);
  strokeWeight(1);
  ellipse(centx, centy, 400,400);
  
  strokeWeight(1);
  ellipse(centx, centy, 380,380);
 /* 
  strokeWeight(1);
  ellipse(centx, centy, 385,388);
  
  stroke(230,180,0);
  strokeWeight(1);
  ellipse(centx, centy, 388,390);
  
  println(countC);
  println(countP);
  */
}



float Noise1(int x, int y)
{
  int n = x + y * 57;
   n = (n<<13) ^ n;
   
  
  float res = (1.0-(n*(n*n*15731 + 789221)+1376312589))/1073741824.0;
  
   //countP++;
   //if(res>0) countC++;
 
   //randomSeed(x+y);
   //return random(0,1); 
   return (res+1)*0.5;
}

float SmoothedNoise_1(int x, int y)
{
  float myCorners = (Noise1(x-1, y-1) + Noise1(x+1, y-1) + Noise1(x-1, y+1) + Noise1(x+1, y+1))/16;
  float mySides = (Noise1(x-1,y) + Noise1(x+1, y) + Noise1(x, y-1) + Noise1(x, y+1))/8;
  float myCenter = Noise1(x,y)/4;
  
 
  
  return myCorners + mySides + myCenter;
}

float InterpolatedNoise_1(float x, float y)
{
 int integer_X = int(x);
 float fractional_X = x - integer_X;
 
 int integer_Y = int(y);
 float fractional_Y = y - integer_Y;
 
 float v1 = SmoothedNoise_1(integer_X, integer_Y);
 float v2 = SmoothedNoise_1(integer_X+1, integer_Y);
 
 float v3 = SmoothedNoise_1(integer_X, integer_Y+1);
 float v4 = SmoothedNoise_1(integer_X+1, integer_Y+1);
 
 float i1 = Cosine_Interpolate(v1,v2,fractional_X);
 float i2 = Cosine_Interpolate(v3,v4,fractional_X);

 return Cosine_Interpolate(i1,i2,fractional_Y);

}

float Cosine_Interpolate(float a, float b, float x)
{
 float ft = x * PI;
 float f=(1 - cos(ft)) * 0.5;
 return a * (1 - f) + b * f;
  
}

float Linear_Interpolate(float a, float b, float x)
{
 return a * (1 - x) + b * x;  
}

float PerlinNoise_2D(float x, float y, float persistence)
{
 float total = 0.0;
 float p = persistence;//persistence;
 float n = 5;//Number_Of_Octaves -1; 
 
 
 for(int i = 0; i<=n; i++)
 {

  float frequency = pow(2,i);
  float amplitude = pow(p,i);
  total = total + InterpolatedNoise_1(x*frequency, y*frequency)*amplitude; 
 
 }
// if(total > 0)
// println(total);
 return total;
 
}


