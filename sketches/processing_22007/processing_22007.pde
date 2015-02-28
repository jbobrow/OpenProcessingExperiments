
int xdim=128;
int ydim=128+64;
//int ydim=64;
int n=200;
byte[][] feld=new byte[xdim][ydim];
boolean first=true;
int[] xm={
  0,1,0,-1};
int[] ym={
  -1,0,1,0};
class t_org{
  t_org LOD;
  int generation;
  byte direction;
  int xpos,ypos;
  int r,g,b;
  float[][] brain=new float[16][4];
  void init(int sx, int sy){
    int x,y;
    generation=0;
    LOD=null;
    xpos=sx;
    ypos=sy;
    r=0;
    g=255;
    b=0;
    direction=(byte)random(4);
    for(x=0;x<16;x++)
      for(y=0;y<4;y++)
        brain[x][y]=random(0.1,0.9);
  }
  void run(){
    int x,y,z,i,o;
    float f,s;
    i=0;

    switch (direction){
    case 0:
      i=((feld[xpos-1][ypos-1]&1)<<2)+((feld[xpos][ypos-1]&1)<<1)+((feld[xpos+1][ypos-1]&1));
      break;
    case 1:
      i=((feld[xpos+1][ypos-1]&1)<<2)+((feld[xpos+1][ypos]&1)<<1)+((feld[xpos+1][ypos+1]&1));
      break;
    case 2:
      i=((feld[xpos+1][ypos+1]&1)<<2)+((feld[xpos][ypos+1]&1)<<1)+((feld[xpos-1][ypos+1]&1));
      break;
    case 4:
      i=((feld[xpos-1][ypos+1]&1)<<2)+((feld[xpos-1][ypos]&1)<<1)+((feld[xpos-1][ypos-1]&1));
      break;
    }

    if(direction==2)
      i=(i<<1)+1;
    else
      i=(i<<1);

    s=brain[i][0]+brain[i][1]+brain[i][2]+brain[i][3];
    f=random(s);
    o=0;

    while(f>brain[i][o])
    {
      f-=brain[i][o];
      o=(o+1)&3;
    }

    switch(o){
    case 0:
      break;
    case 1:
      direction=(byte)((direction-1)&3); 
      break;
    case 2:
      direction=(byte)((direction+1)&3); 
      break;
    case 3:
      if(feld[xpos+xm[direction]][ypos+ym[direction]]==0){
        xpos+=xm[direction];
        ypos+=ym[direction];
      }
      break;     
    }
  }
  void inherit(t_org ancestor){
    int x,y;
    xpos=ancestor.xpos;
    ypos=ancestor.ypos;
    LOD=new t_org();
    LOD=ancestor;
    r=ancestor.r;
    g=ancestor.g;
    b=ancestor.b;
    generation=ancestor.generation+1;
    for(x=0;x<16;x++)
      for(y=0;y<4;y++)
        if(random(1.0)>0.01)
          brain[x][y]=ancestor.brain[x][y];
        else{
          brain[x][y]=random(0.001,1.0);
          /*
          switch((int)random(0,3)){
            case 0:r=(int)random(127,255); break;
            case 1:g=(int)random(127,255); break;
            case 2:b=(int)random(127,255); break;
          }
          */
        }  
  }
}

t_org[] organism=new t_org[n];

void setup(){
  int x,y,z;
  size(xdim*2,ydim*2);
  for(x=0;x<xdim;x++)
    for(y=0;y<ydim;y++)
    {
      feld[x][y]=0;
      if((x<2)||(y<2))
        feld[x][y]=1;
      if((x>xdim-3)||(y>ydim-3))
        feld[x][y]=1;
      if((y&1)==0)
        //if((int)random(((ydim-y)>>7)+2)==0)
        if((int)random(4)==0)
          feld[x][y]=1;
    }
  for(z=0;z<n;z++)
  {
    x=(int)random(xdim);
    y=(int)random(16);
    while(feld[x][y]==1)
    {
      x=(int)random(xdim);
      y=(int)random(5);
    }
    organism[z]=new t_org();
    organism[z].init(x,y);
  }
  noStroke();
}

void draw(){
  int x,y;
  if(first){
    first=false;
    background(0);
    for(x=0;x<xdim;x++)
      for(y=0;y<ydim;y++)
        if(feld[x][y]==1)
        {
          fill(color(200,200,200));
          rect(x*2,y*2,2,2);
        }
  }
  for(x=0;x<n;x++)
  {
    set(organism[x].xpos*2,organism[x].ypos*2,color(0,0,0));
    set(organism[x].xpos*2+1,organism[x].ypos*2,color(0,0,0));
    set(organism[x].xpos*2,organism[x].ypos*2+1,color(0,0,0));
    set(organism[x].xpos*2+1,organism[x].ypos*2+1,color(0,0,0));
    organism[x].run();
    if(organism[x].ypos>ydim-5)
    {
      organism[x].ypos=2;
      organism[x].xpos=(int)random(2,xdim-2);
      y=x;
      while(y==x)
        y=(int)random(n);
      organism[y]=new t_org();
      organism[y].inherit(organism[x]);
    }
    set(organism[x].xpos*2,organism[x].ypos*2,color(organism[x].r,organism[x].g,organism[x].b));
    set(organism[x].xpos*2+1,organism[x].ypos*2,color(organism[x].r,organism[x].g,organism[x].b));
    set(organism[x].xpos*2,organism[x].ypos*2+1,color(organism[x].r,organism[x].g,organism[x].b));
    set(organism[x].xpos*2+1,organism[x].ypos*2+1,color(organism[x].r,organism[x].g,organism[x].b));
  }
}



