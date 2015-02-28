
int len;
int bred;
int[] corn;
float[][] pon;
float[][] ponpre;
int rgb_blue;
int rgb_green;
int rgb_red;
int minim=0;
int del=40;
int runs=1;
PImage buffimg;
void setup()
{
  len=100;
  bred=100;
  size(500,500);
  background(255);
  corn=new int[8];
  corn[0]=width/2-bred/2;
  corn[1]=height/2-len/2;
  corn[2]=width/2+bred/2;
  corn[3]=height/2-len/2;
  corn[4]=width/2+bred/2;
  corn[5]=height/2+len/2;
  corn[6]=width/2-bred/2;
  corn[7]=height/2+len/2;
  //intialization
  point_init();
  // define boundary conditions
  boundary();
//  for(int k=1;k<1100;k++)
  buffimg= createImage(bred-1,len-1,RGB);

  
 
  
}

void draw()
{
//  translate(-width,- height);
//  scale(4);
  for(int i=0;i<5;i=i+2)
  line(corn[i],corn[i+1],corn[i+2],corn[i+3]);
  line(corn[6],corn[7],corn[0],corn[1]);
  for(int j=1;j<len-1;j++)
  {
    for(int i=1;i<bred-1;i++)
    {
      pon[i][j]=(pon[i+1][j]+pon[i][j+1]+pon[i-1][j]+pon[i][j-1])/4;
    }
  }
  for(int j=1;j<len-1;j++)
  {
    for(int i=1;i<bred-1;i++)
    {
      rgb_func(pon[i][j]);
      buffimg.set(i,j,color(rgb_red,rgb_green,rgb_blue));
    }
  }
  image(buffimg,corn[0]+1,corn[1]+1);
  //img = loadImage("laDefense.jpg");
  if(runs==5200)
  buffimg.save("img.png");
  println(runs);
  runs++;
  
}


void point_init()
{
  pon=new float[bred][len];
  ponpre=new float[bred][len];
  for(int i=0;i<bred;i++)
  for(int j=0;j<len;j++)
  {
    pon[i][j]=0;
  }
  ponpre=pon;
}

void boundary()
{
  for(int i=0;i<bred;i++)
  pon[i][0]=0;
  for(int i=0;i<bred;i++)
  pon[i][len-1]=0;
  for(int i=0;i<len;i++)
  pon[0][i]=int(map(i,0,len-1,0,200));
  for(int i=0;i<len;i++)
  pon[bred-1][i]=200;
}

void rgb_func(float value)
{
  if(value>=minim && value<minim+del/5)
  {
    rgb_blue=128+int(map(value,minim,minim+del/5,0,127));
    rgb_green=0;
    rgb_red=0;
  }
  if(value>=minim+del/5 && value<minim+2*del/5)
  {
    rgb_green=int(map(value,minim+del/5,minim+2*del/5,0,255));
    rgb_red=0;
    rgb_blue=255;
  }
  if(value>=minim+2*del/5 && value<minim+3*del/5)
  {
    rgb_blue=255-int(map(value,minim+2*del/5,minim+3*del/5,0,255));
    rgb_green=255;
    rgb_red=int(map(value,minim+2*del/5,minim+3*del/5,0,255));
  }
  if(value>=minim+3*del/5 && value<minim+4*del/5)
  {
    rgb_blue=0;
    rgb_red=255;
    rgb_green=255-int(map(value,minim+3*del/5,minim+4*del/5,0,255));
  }
  if(value>=minim+4*del/5 && value<=minim+del)
  {
    rgb_blue=0;
    rgb_red=255-int(map(value,minim+4*del/5,minim+del,0,127));
    rgb_green=0;
  }
}


