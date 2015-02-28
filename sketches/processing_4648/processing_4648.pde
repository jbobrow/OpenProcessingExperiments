
/**
 * Metatunnel demo effect
 * Original by FRequency
 * http://www.pouet.net/prod.php?which=52777
 * 
 * Canvas 2D version by PauloFalcao
 * http://demoscene.appjet.net/
 * 
 * Canvas 3D port by vlad
 * http://people.mozilla.com/~vladimir/misc/metatunnel-3d.html
 * 
 * Processing.org port by luis2048
 * http://luis.net/projects/processing/metatunnel/
 *
 * 720P HD Video @ 25FPS
 * http://vimeo.com/4440148
 *
 */
float time=0.0; 
float maxrX; 
float maxrY; 
PGraphics megatunnelEffect;

void setup()
{
  size(320,240);
  megatunnelEffect = createGraphics(80, 80,P2D);
  maxrX=float(megatunnelEffect.width); 
  maxrY=float(megatunnelEffect.height); 
}

float dxx,dyy,dzz;

float distance(float ax,float ay,float az,float bx,float by,float bz){
  dxx = bx-ax;
  dyy = by-ay;
  dzz = bz-az;
  return sqrt(dxx*dxx + dyy*dyy + dzz*dzz);
}

float obj(float x,float y,float z,float t){
  float f=1.0;
  f*=dist(x,y,z,costsint02,0.3,cost0505p2);
  f*=dist(x,y,z,-cost07,0.3,sint05p2);
  f*=dist(x,y,z,-sint0205,sint,2.0);
  f*=cos(y)*cos(x)-0.1-cos(z*7.0+t*7.0)*cos(x*3.0)*cos(y*4.0)*0.1; 
  return f;
}

float vy,ox,oy,oz,dx,dy,dz,tt,g,kolor,dxtt,dytt,dztt,ny,nz,d,f,px,py,objd,nx,rr,gg,bb;
float cost,cost07,cost05,cost0505p2,costm03,sint,sint07,sint05,sint05p2,sint02,sint0205,costsint02;

color eval(int xx,int yy,float t){
  px = xx / maxrX;
  ox=px*2.0-1.0;
  oz=0.0;
  dx=(ox+costm03)/64.0;

  //dz=1.0/64.0;
  dz=0.015625;
  tt=0.0;
  g=1.0;

  while((g>0.4)&&(tt<375)){
    g=obj(ox+dx*tt,oy+dy*tt,oz+dz*tt,t);     
    tt+=g*4;
  }

  kolor=0.0;

  float dxtt,dytt,dztt,cosdxtt,cosdytt,cosdztt7t,cosdxtt3,cosdytt4 ,nx,ny,nz;

  dxtt=ox+dx*tt;
  dytt=oy+dy*tt;
  dztt=oz+dz*tt;
  objd=obj(dxtt,dytt,dztt,t);
  nx=objd-obj(dxtt+0.01,dytt,dztt,t);
  ny=objd-obj(dxtt,dytt+0.01,dztt,t);
  nz=objd-obj(dxtt,dytt,dztt+0.01,t);

  d=sqrt(nx*nx+ny*ny+nz*nz);
  ny=ny/d;
  nz=nz/d;
  kolor+=max(-0.5*nz,0.0)+max(-0.5*ny+0.5*nz,0.0)*0.5;   
  float mult = tt*0.025;
  rr=max((kolor+0.1*mult)*255,0);
  gg=max((kolor+0.2*mult)*255,0);
  bb=max((kolor+0.5*mult)*255,0);
  return color(rr,gg,bb);
}

// integer based bit shift multiplication
int mul(int m, int n) {
  if (n>0) return mul(m<<1,n>>1)+((n&1)>0?m:0);
  return 0;
}

void draw(){
  float t = time;
  cost = cos(t);
  cost07 = cos(t*.7);
  cost05 = cos(t*.5);
  cost0505p2 = cost05 * 0.5 + 2;
  costm03 = cost * 0.3;
  sint = sin(t);
  sint07 = sin(t*.7);
  sint05 = sin(t*.5);
  sint05p2 = sint05 + 2;
  sint02 = sin(t*.2);
  sint0205 = sint02*0.5;
  costsint02 = cost+sint02;

  megatunnelEffect.loadPixels();
  int pixelCount = 0;
  for(int y=0;y<megatunnelEffect.height;y++){ 
    py = y / maxrY;
    vy=-py*2.0+1.0;
    oy=vy*1.25;
    dy=vy/maxrY;
    for(int x=0;x<megatunnelEffect.width;x++){ 
      megatunnelEffect.pixels[pixelCount++] = eval(x,y,time);
      //    megatunnelEffect.set(x,y,eval(x,y,time));;
    } 
  } 
  megatunnelEffect.updatePixels();
  image(megatunnelEffect,0,0,width,height); 
  time+=0.05; 
} 



