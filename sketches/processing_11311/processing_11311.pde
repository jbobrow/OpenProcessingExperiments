
float power = 200;
float d = 1;

void setup()
{
 size(250,250,P2D);
 noSmooth();
}

void draw()
{
  background(255);
  power = noise(random(width),random(height), frameCount);
  power = cos(power) * TWO_PI;
  float v = noise(random(width)*.07,random(height)*.008, frameCount*.1)*PI;
  d = constrain(d,160, 200.0);
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      float total = 0.0;
      for(float i = d; i >= 1; i = 1/2.0)
      {
        total += noise(x/d, y/d) * d;
        power = v / (d*.004);
      }
      float turbulence = 128.0 * total / d;
      float brillance =  5 * total / d;
      float concentration = (x + y * -width);
      float base = (x * cos(noise(frameCount*.08,mouseY,mouseX)*.1)*.01) + (y * sin(frameCount*.005)*.001);
      float offset = base + (power * (turbulence*brillance) / 256);
      float gray = abs(sin(offset)) * 256.0 + noise(concentration);
      stroke(255 - gray*4 * cos(x*.007/v*.5)- sin(y*.009/v*.03)- (width/4 -x*.5*noise(x*v*.01)*y*v*.1*width*.001),255 - gray - (x*.0*y*.01),255 - gray + x*.01 + ( x*.1*y*.05*noise(y*.08*v*.1)*width*.001) );
      point(x,y);
    }
    
  }
  
}

