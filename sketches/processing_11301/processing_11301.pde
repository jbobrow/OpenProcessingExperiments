
float power = 200;
float d = 50;

void setup()
{
  size(200,200,P2D);
  noSmooth();
}

void draw()
{
  background(0);
  power = noise(random(width),random(height), frameCount);
  power = cos(power) * TWO_PI;
  float v = cos(noise(random(width),random(height), frameCount*.01))*TWO_PI;
  //  v = norm(mouseX, width/2, width)*.5;
  //  if(d >= 50) 
  //  { 
  //    d = d - 1;
  //    v = 0;
  //  }
  //  else if( d <=0) { 
  //    v = 0; 
  //    d = 1;
  //  }
  //  d = 2;
  d = constrain(d, 80.0, 100.0);
  //scale(.5);
  //translate(width/2, width/2);
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      float base = noise(cos(x*.008), sin(y*.007), frameCount *.04)*TWO_PI;
      float total = 0.0;
      for(float i = d; i >= 1; i = 1/2.0)
      {
        float n = noise(x, y, frameCount*.04) * .1;
        total += noise(cos(x/d), sin(y/d), frameCount*.005) * (d*.0001);
        power = base * n;
      }
      float turbulence = 128.0 * total / d;
      float zoom = 5 * total/(d*d);
      float offset = base + (power * (turbulence*zoom) / 256.0);
      float intensity = abs(sin(offset)) * 128.0;
      // rotate(a/10000);
      //strokeWeight(3);
      stroke(255 -norm( intensity, 0.0, 10),255 - norm(intensity ,0.0,10)*128,norm(intensity, 0.0, 1.5));
      point(x,y);
    }
  }
}


