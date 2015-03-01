
float vib=0;
float power=0;
float delta = 10;
float r = 200;
 float a = 0;
 boolean rsw = true;
  float[] rx = new float[540];
  float[] ry = new float[540];
  float[] rz  =new float[540];
float[] sx = new float[540];
float[] sy = new float[540];
float[] sz = new float[540];

void setup()
{
  size(1000,1000,P3D);
  
   for(int i=0;i<540;i++)
 {
  rx[i] = random(-20,30);
  ry[i] = random(-20,20);
 rz[i]  = random(-20,40);
sx[i] = random(-60,20);
sy[i] = random(-20,40);
 sz[i] = random(-20,10);
 }
}


void draw()
{
    background(0);
    rotateX(radians(-5));
  rotateY(radians(5));
   
   boxin();

 effect();
 skrillex();
  blueBox();
  boxim();

 
   rotateY(radians(-5));
     rotateX(radians(5));

  }
  
  void boxin()
  {
    fill(60);
    stroke(0);
  
  {
    
  }
    
 
  stroke(0);
 strokeWeight(10);
  line(0,0,0,500,0,-1000);
  line(0,700,0,0,700,-1000);
  line(0,300,-1000,1000,300,-1000);
  line(0,1000,-1000,500,0,0);
  line(900,1000,-1000,700,800,-1000);
  line(1000,1000,-500,887.5,1000,-612.5);
  line(1000,1000,-575,925,1000,-650);
  line(1000,1000,-650,962.5,1000,-687.5);
  }
  
void effect()
{
  
a+=random(1,2);
  translate(700, 300, -700);
  float shp = random(230,255);
 

 rotateX(radians(90));
   int i=0;
   
      for(float dig=45; dig<135; dig+=delta)  
{
 
    
   for(float dog=0; dog<360; dog+=delta) 
{

   float x = r * sin(radians(dig)) * cos(radians(dog+a*dig*dig/1500));
    float y = r * sin(radians(dig)) * sin(radians(dog+a*dig*dig/5500));
    float z = r * cos(radians(dig));
  float rar = 1;
strokeWeight(2);

  i++;
  fill(255,0,0,100);
  noStroke();
  beginShape();
  vertex(x,y,z);
  vertex(x+rx[i], y+ry[i], z+rz[i]);
  vertex(x+sx[i], y+sy[i], z+sz[i]);
  endShape();
  }
  }
  if(r<140)
{
rsw = true;
}
else if(r>260)
{
rsw = false;
}
if(rsw == false)
{
r-=1;
}
else if(rsw == true)
{
r+=1;
}
   rotateX(radians(-90));
  translate(-700, -300, +700);
}

void skrillex()
{
   translate(630,60,0);

     float sa = 255;
  float hi = -700;
  float ra = 0.7;
 fill(255,0,0,sa);
   stroke(0);
   strokeWeight(2);
 //noStroke();
 beginShape();
 vertex(0*ra,100*ra,hi);
 vertex(0*ra,510*ra,hi);
 vertex(55*ra,510*ra,hi);
 vertex(55*ra,0*ra,hi);
 endShape(CLOSE);
 beginShape();
 vertex(77*ra,62*ra,hi);
 vertex(132*ra,62*ra,hi);
 vertex(132*ra,601*ra,hi);
 vertex(77*ra,715*ra,hi);
 endShape(CLOSE); 
 beginShape();
 vertex(152*ra,120*ra,hi);
 vertex(207*ra,120*ra,hi);
 vertex(207*ra,647*ra,hi);
 vertex(152*ra,764*ra,hi);
 endShape(CLOSE);   
   translate(-630,-60,0);

}
  void blueBox()
  {
   vib = random(-1-power,1+power);
   if(power>0)
   {
   power-=0.1;
   }
   else
   {
     power+=0.1;
   }
   stroke(0);
   strokeWeight(3);
   translate(0,0,-100);
   translate(200,850+vib,0);
   fill(0,0,255);
   box(150,150,150);
   translate(-200,-850-vib,0);
   translate(0,0,100);
  }
  float dotProduct(float x1, float y1, float z1, float x2, float y2, float z2)
{
  return x1*x2+y1*y2+z1*z2;
}

void boxim()
{
  int gridX = 30;
int gridY = 30;
float nX=0, nY=0, nZ=1;




translate(0,0,-1000);
for (int y=0; y<1000;y+=gridX)
{
  for(int x=0; x<1000;x+=gridX)
  {
   float lX = 700 - x;
   float lY = 300 - y;
   float lZ = 150;
   

float lmag = sqrt(lX*lX+lY*lY+lZ*lZ);
lX/=lmag;
lY/=lmag;
lZ/=lmag;

float cosine = dotProduct(nX, nY, nZ, lX, lY, lZ);
 fill(cosine*255,cosine*255,cosine*255);
 strokeWeight(0.5);
rect(x,y,gridX,gridY);
  }
}


translate(0,0,1000);
rotateY(radians(90));
for (int y=0; y<1000;y+=gridX)
{
  for(int x=0; x<1000;x+=gridX)
  {
   float lX = 700 - x;
   float lY = 300 - y;
   float lZ = 150;
   

float lmag = sqrt(lX*lX+lY*lY+lZ*lZ);
lX/=lmag;
lY/=lmag;
lZ/=lmag;

float cosine = dotProduct(nX, nY, nZ, lX, lY, lZ);
 fill(cosine*255,cosine*255,cosine*255);
 strokeWeight(0.5);
rect(x,y,gridX,gridY);
  }
}
rotateY(radians(-90));

translate(1000,0,-1000);
rotateY(radians(-90));
for (int y=0; y<1000;y+=gridX)
{
  for(int x=0; x<1000;x+=gridX)
  {
   float lX = 300 - x;
   float lY = 300 - y;
   float lZ = 150;
   

float lmag = sqrt(lX*lX+lY*lY+lZ*lZ);
lX/=lmag;
lY/=lmag;
lZ/=lmag;

float cosine = dotProduct(nX, nY, nZ, lX, lY, lZ);
 fill(cosine*255,cosine*255,cosine*255);
 strokeWeight(0.5);
rect(x,y,gridX,gridY);
  }
}
rotateY(radians(90));

translate(0,0,1000);
rotateY(radians(90));
rotateX(radians(-90));
for (int y=0; y<1000;y+=gridX)
{
  for(int x=0; x<1000;x+=gridX)
  {
   float lX = 700 - x;
   float lY = 300 - y;
   float lZ = 150;
   

float lmag = sqrt(lX*lX+lY*lY+lZ*lZ);
lX/=lmag;
lY/=lmag;
lZ/=lmag;

float cosine = dotProduct(nX, nY, nZ, lX, lY, lZ);
 fill(cosine*255,cosine*255,cosine*255);
 strokeWeight(0.5);
rect(x,y,gridX,gridY);
  }
}
translate(0,0,1000);

for (int y=0; y<1000;y+=gridX)
{
  for(int x=0; x<1000;x+=gridX)
  {
   float lX = 700 - x;
   float lY = 300 - y;
   float lZ = 150;
   

float lmag = sqrt(lX*lX+lY*lY+lZ*lZ);
lX/=lmag;
lY/=lmag;
lZ/=lmag;

float cosine = dotProduct(nX, nY, nZ, lX, lY, lZ);
 fill(cosine*255,cosine*255,cosine*255);
 strokeWeight(0.5);
rect(x,y,gridX,gridY);
  }
}
strokeWeight(300);
translate(-1000,-1000,-1000);
}
  void mousePressed()
{
r+=20;
power += 2;
}
