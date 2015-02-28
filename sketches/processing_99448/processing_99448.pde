
float delta;
boolean deltad = false;
void setup()
{
  size(400, 400,P3D);
  //noLoop();
  //noiseSeed(100);
  //noiseDetail(1, 0.5);
  stroke(0,200);
  delta =20;
  background(255);
}
float count = 0;
float f;
void draw() {
  
//  loadPixels();
  
  //noiseSeed(100);
  f=(float)frameCount;
  //if(delta>20)
  //{deltad = false;background(255,10);}
  if(delta<4)
  {delta =20;//background(255);
  noLoop();}
  if (deltad)
  delta++;
  else
  delta--;
  for (int i =0;i<width;i+=delta)
  {
    for (int j = 0;j<height;j+=delta)
    {
      //
      //f = frameCount;
     /* color color1d = color(noise(i/5.0));
      color color2d = color(1+round(abs(noise(i/30.0,j/60.0)*255)));
      color color3d  = color(1+round(abs(noise(i/30.0, j/60.0,f/100.0)*255)));
      //println(int(noise((float)i/100,(float)j/100,frameCount/100.0)*255));
     pixels[i*width+j]=color1d;
      pixels[i*width+j+200]=color2d;*/
      point(j,i,-((noise(i/100.0, j/100.0,f/100.0)*400.0)));//= color3d;
    }
  }
  //println(noise(1.0/100.0, 1.0/100.0,f/100.0)*255.0);
//  updatePixels();
}
void mousePressed()
{background(255);    loop();
    }

