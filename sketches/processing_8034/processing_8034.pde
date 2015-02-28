
face [] allf=new face[6];
object [] o=new object[4];
float f=0;
int [] cols={0xffffffff,0xff0000ff};
int rots=8;
PImage back=new PImage(320,200);

void setup() {
  frameRate(30);
  size(320,200,P3D);
//  noStroke();
  int i,j,offs=0;
  for (i=0;i<200;i++) {
    for (j=0;j<320;j++) {
      float dist=32000/sqrt(sq(i-100)+sq(j-160));      
      back.pixels[offs++]=color(int(dist/100),int(dist/50),int(dist));
    }
  }
  for (i=0;i<6;i++) {
    allf[i]=new face();
  }

  allf[0].i[0]=0;  //top
  allf[0].i[1]=1;
  allf[0].i[2]=3;
  allf[0].i[3]=2;
  
  allf[1].i[0]=0+4;  //bottom
  allf[1].i[1]=1+4;
  allf[1].i[2]=3+4;
  allf[1].i[3]=2+4;

  allf[2].i[0]=3;  //front
  allf[2].i[1]=2;
  allf[2].i[2]=2+4;
  allf[2].i[3]=3+4;

  allf[3].i[0]=0;  //back
  allf[3].i[1]=1;
  allf[3].i[2]=1+4;
  allf[3].i[3]=0+4;

  allf[4].i[0]=0;  //left
  allf[4].i[1]=2;
  allf[4].i[2]=2+4;
  allf[4].i[3]=0+4;

  allf[5].i[0]=1;  //right
  allf[5].i[1]=3;
  allf[5].i[2]=3+4;
  allf[5].i[3]=1+4;
  
  rotateX(PI/6);
  for (i=0;i<4;i++) {
    o[i]=new object();
    point3d [] temp=part(PI/(2*rots),i*30,30,0.5);
    o[i].p=new point3d[temp.length];
    for (j=0;j<temp.length;j++) {
      o[i].p[j]=new point3d();
      o[i].p[j].x=modelX(temp[j].x,temp[j].y,temp[j].z);
      o[i].p[j].y=modelY(temp[j].x,temp[j].y,temp[j].z);
      o[i].p[j].z=modelZ(temp[j].x,temp[j].y,temp[j].z);
    }
    o[i].f=allf;
    o[i].col=cols[i%2];
  }
}

void draw() {
  background(back);
  //set(0,0,back);
  translate(160,100);
  rotateY(f);
  rotateX(0.2*f);
  f+=0.02;
  int i,j;
  for (j=0;j<rots;j++) {
    for (i=0;i<4;i++) {
      drawobj(o[i]);
    }
    rotateY(TWO_PI/rots);
  }
}

void drawobj(object o) {
  int i,j;
  fill(o.col);
  beginShape(QUADS);
  for (i=0;i<o.f.length;i++) {
    for (j=0;j<4;j++) {
      point3d pp=o.p[o.f[i].i[j]];
      vertex(pp.x,pp.y,pp.z);
    }
  }
  endShape();
}

point3d [] part(float ang,float hs,float h,float t) {
  point3d [] p=new point3d [8];
  int i;
  for (i=0;i<8;i++) {
    p[i]=new point3d();    
  }
  float h1x=hs*tan(ang);
  float h2x=(hs+h)*tan(ang);

  p[0].x=-h1x;
  p[0].y=hs;
  p[0].z=-t;
  
  p[1].x=h1x;
  p[1].y=hs;
  p[1].z=-t;

  p[2].x=-h1x;
  p[2].y=hs;
  p[2].z=t;
  
  p[3].x=h1x;
  p[3].y=hs;
  p[3].z=t;

  p[0+4].x=-h2x;
  p[0+4].y=hs+h;
  p[0+4].z=-t;
  
  p[1+4].x=h2x;
  p[1+4].y=hs+h;
  p[1+4].z=-t;

  p[2+4].x=-h2x;
  p[2+4].y=hs+h;
  p[2+4].z=t;
  
  p[3+4].x=h2x;
  p[3+4].y=hs+h;
  p[3+4].z=t;
  
  return p;
}

class point3d {
  float x,y,z;
}

class face {
  int [] i=new int [4];  //
}

class object {
  point3d [] p;
  face [] f;
  color col;
}

