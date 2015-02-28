
///////////////////////////////////////////
//
// splinelab.pde
//
// spline test
// colorized by:
// :runtime! syntax/2html.vim
//
///////////////////////////////////////////

int pt_locked = -1;
int[]px={0,0,0,0,0,0,0,0,0};
int[]py={0,0,0,0,0,0,0,0,0};
final int pt_radius = 7;
final int picker_radius = 2;
int nx_=9,ny_=9;
int[]g1_px=new int[nx_*ny_];
int[]g1_py=new int[nx_*ny_];
int[]g2_px=new int[nx_*ny_];
int[]g2_py=new int[nx_*ny_];
int[]g3_px=new int[nx_*ny_];
int[]g3_py=new int[nx_*ny_];

//////////////////////////////////////////////////////

void setup()
{

  size( 400, 400, P2D );
  hint(DISABLE_DEPTH_TEST);
  noStroke();

  int xx=width/2/8,yy=height/2/8,ww=width/2*6/8,hh=height/2*6/8;

// 0,1,2,3 : corners
// 4,5,6,7 : edge centers
// 8 : center

//   p0 --- p7 --- p3
//   |      |      |
//   p4 --- p8 --- p6
//   |      |      |
//   p1 --- p5 --- p2

  px[0]=xx;
  py[0]=yy;
  px[1]=px[0];
  py[1]=py[0]+hh;
  px[2]=px[0]+ww;
  py[2]=py[0]+hh;
  px[3]=px[0]+ww;
  py[3]=py[0];
  px[4]=(px[0]+px[1])/2;
  py[4]=(py[0]+py[1])/2;
  px[5]=(px[1]+px[2])/2;
  py[5]=(py[1]+py[2])/2;
  px[6]=(px[2]+px[3])/2;
  py[6]=(py[2]+py[3])/2;
  px[7]=(px[3]+px[0])/2;
  py[7]=(py[3]+py[0])/2;
  px[8]=px[7];
  py[8]=py[6];

}

void draw()
{
  background(0);

  grid_update_pt();

  noFill();
  stroke(0,255,0);

  for (int rr=0;rr<ny_;rr++) {
    for (int cc=0;cc<nx_;cc++) {
      int x1,y1,x2,y2;
      x1=g1_px[rr*nx_+cc];
      y1=g1_py[rr*nx_+cc];
      if(rr+1<ny_){
	x2=g1_px[(rr+1)*nx_+cc];
	y2=g1_py[(rr+1)*nx_+cc];
	line(x1,y1,x2,y2);
      }
      if(cc+1<nx_){
	x2=g1_px[rr*nx_+(cc+1)];
	y2=g1_py[rr*nx_+(cc+1)];
	line(x1,y1,x2,y2);
      }
    }
  }

  for (int rr=0;rr<ny_;rr++) {
    for (int cc=0;cc<nx_;cc++) {
      int x1,y1,x2,y2;
      x1=g2_px[rr*nx_+cc];
      y1=g2_py[rr*nx_+cc];
      if(rr+1<ny_){
	x2=g2_px[(rr+1)*nx_+cc];
	y2=g2_py[(rr+1)*nx_+cc];
	line(x1,y1,x2,y2);
      }
      if(cc+1<nx_){
	x2=g2_px[rr*nx_+(cc+1)];
	y2=g2_py[rr*nx_+(cc+1)];
	line(x1,y1,x2,y2);
      }
    }
  }

  for (int rr=0;rr<ny_;rr++) {
    drawCurve(
	g3_px[rr*nx_+0],
	g3_py[rr*nx_+0],
	g3_px[rr*nx_+nx_/2],
	g3_py[rr*nx_+nx_/2],
	g3_px[rr*nx_+(nx_-1)],
	g3_py[rr*nx_+(nx_-1)]);
  }
  for (int cc=0;cc<nx_;cc++) {
    drawCurve(
	g3_px[0*nx_+cc],
	g3_py[0*nx_+cc],
	g3_px[(ny_/2)*nx_+cc],
	g3_py[(ny_/2)*nx_+cc],
	g3_px[(ny_-1)*nx_+cc],
	g3_py[(ny_-1)*nx_+cc]);
  }

  noStroke();
  fill(255,255,0);
  for (int ii=0;ii<px.length;ii++){
    int xx=px[ii];
    int yy=py[ii];
    rect(xx-pt_radius,yy-pt_radius,pt_radius*2,pt_radius*2);
  }

}

void mousePressed()
{
  if (-1 != (pt_locked=mouse_over_pt(mouseX,mouseY))) {
    println("pt_locked: "+pt_locked);
    return;
  }
}


void mouseDragged()
{
  if (-1 != pt_locked) {
    int mx=mouseX,my=mouseY;
    if(mx<width/2)
      px[pt_locked]=mx;
    if(my<height/2)
      py[pt_locked]=my;
    return;
  }
}

void mouseReleased()
{
  pt_locked=-1;
}

void grid_update_pt()
{
  for (int row=0;row<ny_;row++) {
    float rr=float(row)/(ny_-1);
    int xx1=linterp(px[0],px[4],px[1],rr);
    int yy1=linterp(py[0],py[4],py[1],rr);
    int xx2=linterp(px[3],px[6],px[2],rr);
    int yy2=linterp(py[3],py[6],py[2],rr);
    int xxc=linterp(px[7],px[8],px[5],rr);
    int yyc=linterp(py[7],py[8],py[5],rr);
    for (int col=0;col<nx_;col++) {
      float cc=float(col)/(nx_-1);
      int xx=linterp(xx1,xxc,xx2,cc);
      int yy=linterp(yy1,yyc,yy2,cc);
      g1_px[row*nx_+col]=xx;
      g1_py[row*nx_+col]=yy;
    }
  }
  for (int row=0;row<ny_;row++) {
    float rr=float(row)/(ny_-1);
    float ww1=dist(px[0],py[0],px[3],py[3]);
    float ww2=dist(px[1],py[1],px[2],py[2]);
    int xx1=pinterp(px[0],px[4],px[1],rr,ww1/ww2);
    int yy1=pinterp(py[0],py[4],py[1],rr,ww1/ww2);
    int xx2=pinterp(px[3],px[6],px[2],rr,ww1/ww2);
    int yy2=pinterp(py[3],py[6],py[2],rr,ww1/ww2);
    int xxc=pinterp(px[7],px[8],px[5],rr,ww1/ww2);
    int yyc=pinterp(py[7],py[8],py[5],rr,ww1/ww2);
    for (int col=0;col<nx_;col++) {
      float cc=float(col)/(nx_-1);
      float hh1=dist(px[0],py[0],px[1],py[1]);
      float hh2=dist(px[3],py[3],px[2],py[2]);
      int xx=pinterp(xx1,xxc,xx2,cc,hh1/hh2);
      int yy=pinterp(yy1,yyc,yy2,cc,hh1/hh2);
      g2_px[row*nx_+col]=xx+width/2;
      g2_py[row*nx_+col]=yy;
    }
  }
  for (int row=0;row<ny_;row++) {
    float rr=float(row)/(ny_-1);
    int xx1=cinterp(px[0],px[4],px[1],rr);
    int yy1=cinterp(py[0],py[4],py[1],rr);
    int xx2=cinterp(px[3],px[6],px[2],rr);
    int yy2=cinterp(py[3],py[6],py[2],rr);
    int xxc=cinterp(px[7],px[8],px[5],rr);
    int yyc=cinterp(py[7],py[8],py[5],rr);
    for (int col=0;col<nx_;col++) {
      float cc=float(col)/(nx_-1);
      int xx=cinterp(xx1,xxc,xx2,cc);
      int yy=cinterp(yy1,yyc,yy2,cc);
      g3_px[row*nx_+col]=xx;
      g3_py[row*nx_+col]=yy+height/2;
    }
  }
}

int linterp(int u1,int uc,int u2,float t)
{
    return int(lerp(u1,u2,t));
}

// equation for perspective correct interpolation:
// http://en.wikipedia.org/wiki/Texture_mapping
// u_a=((1-a)*u1/z1+a*u2/z2)/((1-a)/z1+a/z2), while zr=z0/z1
int pinterp(int u1,int uc,int u2,float a,float zr)
{
  int u_a=int(((1-a)*u1+a*u2*zr)/(1-a+a*zr));
  return u_a;
}

float[] controlPoints(int u1,int uc,int u2)
{
  float b1=2*float(uc-u1)/3;
  float bc=float(u2-u1);
  float b2=2*float(u2-uc)/3;
  float r2=1;
  float rc=1;
  float r1=4*rc-r2;
  rc=-rc;
  float c1=(r1*b1+rc*bc+r2*b2)/(r1+rc);
  float cc=b1-c1;
  float c2=bc-4*cc-c1;
  float[]cp={c1,cc,c2};
  return cp;
}

int cinterp(int u1,int uc,int u2,float t)
{
  float[]cp=controlPoints(u1,uc,u2);
  if(t<0.5){
    return iBezierPoint(u1,u1+cp[0],uc-cp[1],uc,t*2);
  }else{
    return iBezierPoint(uc,uc+cp[1],u2-cp[2],u2,(t-0.5)*2);
  }
}

int iBezierPoint(float x0,float x1,float x2,float x3,float t)
{
  //return int(bezierPoint(x0,x1,x2,x3,t);
  float nt=(1-t);
  float a=nt*nt*nt;
  float b=3*nt*nt*t;
  float c=3*nt*t*t;
  float d=t*t*t;
  return int(a*x0+b*x1+c*x2+d*x3);
}

void drawCurve(int x1,int y1,int xc,int yc,int x2,int y2)
{
  float[]cx=controlPoints(x1,xc,x2);
  float[]cy=controlPoints(y1,yc,y2);
  bezier(x1,y1,x1+cx[0],y1+cy[0],xc-cx[1],yc-cy[1],xc,yc);
  bezier(xc,yc,xc+cx[1],yc+cy[1],x2-cx[2],y2-cy[2],x2,y2);
}

int mouse_over_pt(int xx,int yy)
{
  for (int i=0;i<px.length;i++) {
      if ((abs(xx-px[i])<pt_radius)&&(abs(yy-py[i])<pt_radius)) {
	return i;
      }
  }
  return -1;
}


