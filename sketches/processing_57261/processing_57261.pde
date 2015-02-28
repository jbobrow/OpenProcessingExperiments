
import ddf.minim.*;
import ddf.minim.signals.*;


int dimx = 400;
int dimy = 400;
float num = 0;
float maxnum = 20;
float maxdist = 0;

// grid of cracks
int[] cgrid;
Crack[] cracks;

// color parameters
int maxpal = 512;
int numpal = 0;
color[] goodcolor = new color[maxpal];
float[] notes = 
{
  65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07,
  65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07,
  65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07,
  65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33,
};

Minim minim;
AudioOutput out;

SandPainter[] sands;

// MAIN METHODS ---------------------------------------------

void setup()
{
  size(400,400,P2D);
  maxdist = sqrt(height * height + width * width);
  colorMode(RGB, 255);
  takecolor("pollockshimmering2.gif");

  cgrid = new int[dimx*dimy];
  cracks = new Crack[(int)maxnum];

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  begin();
}

void draw()
{
  for (int n=0;n<num;n++)
  {
    cracks[n].move();
  }
}

void mousePressed()
{
  begin();
}


// METHODS --------------------------------------------------

void makeCrack()
{
  if (num<maxnum)
  {
    cracks[(int)num] = new Crack();
    num++;
  }
}


void begin() 
{
  for (int y=0;y<dimy;y++)
  {
    for (int x=0;x<dimx;x++)
    {
      cgrid[y*dimx+x] = 10001;
    }
  }

  for (int k=0;k<16;k++)
  {
    int i = int(random(dimx*dimy-1));
    cgrid[i]=int(random(360));
  }

  for (int n=0;n<num;n++)
  {
    cracks[n].sp.sine.setAmp(0);
     // cracks[n].sp.pn.setAmp(0);
  }

  num=0;
  for (int k=0;k<3;k++)
  {
    makeCrack();
  }
  background(255);
}

// COLOR METHODS ----------------------------------------------------------------

color somecolor()
{
  return goodcolor[int(random(numpal))];
}

void takecolor(String fn)
{
  PImage b;
  b = loadImage(fn);
  image(b,0,0);

  for (int x=0;x<b.width;x++)
  {
    for (int y=0;y<b.height;y++)
    {
      color c = get(x,y);
      boolean exists = false;
      for (int n=0;n<numpal;n++)
      {
        if (c==goodcolor[n])
        {
          exists = true;
          break;
        }
      }
      if (!exists)
      {
        if (numpal<maxpal)
        {
          goodcolor[numpal] = c;
          numpal++;
        }
      }
    }
  }
}




// OBJECTS -------------------------------------------------------

class Crack
{
  float x, y;
  float t;
int sdd = 0;
  SandPainter sp;

  Crack()
  {
    findStart();
    if(sdd == 0)
      {
        sp = new SandPainter();
        sdd = 1;
      }
  }

  void findStart()
  {
    int px=0;
    int py=0;

    boolean found=false;
    int timeout = 0;
    while ((!found) || (timeout++>1000))
    {
      px = int(random(dimx));
      py = int(random(dimy));
      if (cgrid[py*dimx+px]<10000)
      {
        found=true;
      }
    }

    if (found) 
    {
      // start crack
      int a = cgrid[py*dimx+px];
      if (random(100)<50) 
      {
        a-=90+int(random(-2,2.1));
      } 
      else
      {
        a+=90+int(random(-2,2.1));
      }
      startCrack(px,py,a);
      //  println(a);
    } 
    else 
    {
      //println("timeout: "+timeout);
    }
  }

  void startCrack(int X, int Y, int T) 
  {
    x=X;
    y=Y;
    t=T;//%360;
    x+=0.61*cos(t*PI/180);
    y+=0.61*sin(t*PI/180);
  }

  void move() 
  {
    // continue cracking
    x+=0.42*cos(t*PI/180);
    y+=0.42*sin(t*PI/180); 

    // bound check
    float z = 0.33;
    int cx = int(x+random(-z,z));  // add fuzz
    int cy = int(y+random(-z,z));

    // draw sand painter
    regionColor();

    // draw black crack
    stroke(0,85);
    point(x+random(-z,z),y+random(-z,z));


    if ((cx>=0) && (cx<dimx) && (cy>=0) && (cy<dimy)) 
    {
      // safe to check
      if ((cgrid[cy*dimx+cx]>10000) || (abs(cgrid[cy*dimx+cx]-t)<5)) 
      {
        // continue cracking
        cgrid[cy*dimx+cx]=int(t);
      } 
      else if (abs(cgrid[cy*dimx+cx]-t)>2) 
      {
        // crack encountered (not self), stop cracking
        findStart();
        makeCrack();
      }
    } 
    else 
    {
      // out of bounds, stop cracking
      findStart();
      makeCrack();
    }
  }

  void regionColor()
  {
    // start checking one step away
    float rx=x;
    float ry=y;
    boolean openspace=true;

    // find extents of open space
    while (openspace)
    {
      // move perpendicular to crack
      rx+=0.81*sin(t*PI/180);
      ry-=0.81*cos(t*PI/180);
      int cx = int(rx);
      int cy = int(ry);
      if ((cx>=0) && (cx<dimx) && (cy>=0) && (cy<dimy)) 
      {
        // safe to check
        if (cgrid[cy*dimx+cx]>10000) 
        {
          // space is open
        } 
        else 
        {
          openspace=false;
        }
      } 
      else 
      {
        openspace=false;
      }
    }
    // draw sand painter
    sp.render(rx,ry,x,y);
  }
}


class SandPainter
{
  complexWave  sine;
  int ini = 0;
  color c;
  float g;
  float reffreq;
  //  WhiteNoise pn;
    
  SandPainter()
  {
    c = somecolor();
    g = random(0.01,0.1);
    reffreq = notes[(int)hue(c)];
     
    if(ini == 0)
    {
      if(num ==0)
        {sine =  new   complexWave (reffreq,0, out.sampleRate());
     //pn = new WhiteNoise(0);  
    }
      else
      {
        sine =  new   complexWave (reffreq,0, out.sampleRate());
       //  pn = new WhiteNoise(0);
    }
      ini = 1;
    //  sine.portamento(200);
    //out.addSignal(pn);
          sine.noPortamento();
              sine.setAmp((1) / maxnum/* / ((num) * 4) + (g) / (maxnum * 4)*/);
      out.addSignal(sine);
  //         println("dsf");
    }
    else
     { sine.setFreq(reffreq);
//     println("dsdfsfsf");
     }
     
  }
  void render(float x, float y, float ox, float oy) 
  {
    g+=random(-0.050,0.050);
    float maxg = 1.0;
    if (g<0) g=0;
    if (g>maxg) g=maxg;

    // calculate grains by distance
    //int grains = int(sqrt((ox-x)*(ox-x)+(oy-y)*(oy-y)));
    int grains = 64;
    float pan = map(ox, 0, width, -1, 1);
    sine.setPan(pan);
//pn.setPan(pan);
         //        pn.setAmp((g) / (maxnum * 5));
    //    sine.setAmp((((sqrt((ox-x)*(ox-x)+(oy-y)*(oy-y)) / maxdist)) / maxnum);
    sine.setFreq(reffreq + g *2 );

    float w = g/(grains-1);
    for (int i=0;i<grains;i++)
    {
      float a = 0.1-i/(grains*10.0);
      stroke(red(c),green(c),blue(c),a*256);
      point(ox+(x-ox)*sin(sin(i*w)),oy+(y-oy)*sin(sin(i*w)));
    }
  }
}


void stop()
{
  out.close();
  minim.stop();

  super.stop();
}


