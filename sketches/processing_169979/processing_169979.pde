
float xnoise = 0.0;
float ynoise = 0.0;
float inc=0.02;
float m=0;
int r;
PImage img;
void setup()
{
  size(600,600);
  frameRate(10);
  img = loadImage("http://www.air-libre-parapente.fr/images/bapteme-parapente-auvergne.png");
}
void draw()
{  
  colorMode(HSB,360,100,100);
  
  for(int y=0; y <height; y++){
    for(int x=0; x<width; x++){
      float sky = noise(xnoise,ynoise)*100;
      stroke(205,sky,100);
      point(x,y);
      xnoise=xnoise + inc;
    }
    xnoise=0;
    ynoise=ynoise + inc;
  }
  inc*=0.9;
  
 
  
  //tint(200);
  r+=90;
  image(img,m,-40+sin(radians(r))*40,300+m+m,sin(radians(r))+300+m+m);
  m+=15;
  if(m>300) {
    m=0; 
    inc=0.02;
  } 
}


