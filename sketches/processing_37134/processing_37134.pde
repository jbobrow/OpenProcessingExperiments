

PImage rainbow;
int rh;
float a;
int lastMillis;
boolean purple;

void setup( )
{
  size(300,300);
  smooth();
  a = 0;
  rh = height/6;
  purple = false;
  rainbow = makeRainbow( rh, purple );
  lastMillis = millis();
}

void draw( )
{
  background(19,56,100);
  int tmp = millis();
  float dt = (tmp-lastMillis)/1000.0;
  lastMillis = tmp;
  
  a += 10*dt;
  if( a> 2*PI ) a-=2*PI;
  
  for( int i=0; i<width/2; i++)
  {
    float y = 5*sin(-a+i/10.0)+i/5.0;
    image( rainbow,width/2+i,0.45*height-rh/2+y,1,1+i/2);
  }

  stroke(255);
  strokeWeight(2);
  line(0,height*0.6,width/2,height*0.4); 

  fill(245,203,158);
  stroke(0);
  strokeWeight(5);
  triangle(width/2,height/4,
    0.3*width,0.6*height,
    0.7*width,0.6*height);

  noStroke();
  fill(237,170,252);
  triangle(width/2,height/4+0.06*height,
    0.3*width+.06*width,0.6*height-0.03*height,
    0.7*width-0.06*width,0.6*height-0.03*height);

  fill(230,89,153);
  ellipse( 0.54*height,0.46*width,6,6);
  ellipse( 0.46*height,0.51*width,6,6);
  ellipse( 0.50*height,0.54*width,6,6);
  ellipse( 0.46*height,0.41*width,6,6);
  ellipse( 0.49*height,0.36*width,6,6);  
  ellipse( 0.61*height,0.54*width,6,6);  
  ellipse( 0.41*height,0.55*width,6,6);  
}

PImage makeRainbow( int h, boolean purple )
{
  float range = 2;
  int rmax = 256;
  int gmax = 256;
  int bmax = 256;
  PImage img = createImage(1,h, RGB);
  if( purple )
    range = 2.5; 
  
  img.loadPixels();
  for( int i=0; i<h; i++)
  {
    float t;
    float rf=0,gf=0,bf=0;
    int r,g,b;
    t = i*range/h;
    if( t<1.0 )
    {
      rf = (1-t);
      gf = t;
    }
    else if( t<2.0 )
    {
      t -= 1.0;
      gf = (1-t);
      bf = t;
    }
    else
    {
      t -= 2.0;
      bf = (1-t);
      rf = t;
    }
    rf = 1-(1-rf)*(1-rf);
    gf = 1-(1-gf)*(1-gf);
    bf = 1-(1-bf)*(1-bf);

    r = floor(rmax*rf);
    g = floor(gmax*gf);
    b = floor(bmax*bf);
    img.pixels[i] = color( r,g,b );
  }
  img.updatePixels();  

  return img;
}


void keyPressed( )
{
  if( key=='p' )
  {
    purple = !purple;
    rainbow = makeRainbow( rh, purple );  
  }
}


