
// distance fractals
//http://iquilezles.org/www/articles/menger/menger.htm
//http://iquilezles.org/www/articles/distfunctions/distfunctions.htm
// See http:www.iquilezles.org/articles/menger/menger.htm for the // full explanation of how this was done
 
float intersect( isofunction f, PVector ro, PVector rd, float maxt, float eps_factor, int glow[], float ff, float st) {
  int s=0;
  int maxsteps=200;
  float lh=0.;
 
  PVector p=ro.get();
  for(float t=st;t<maxt;)
  {
    float eps=t*eps_factor;
    p.x=ro.x+rd.x*t;
    p.y=ro.y+rd.y*t;
    p.z=ro.z+rd.z*t;
    float h = f.map(p);
    if( h<eps)
    {
      glow[0]=s;
      if ( h<0.)
        t+=h;
      t-=lh;
      return  t;
    }
    if( t>maxt || s ==maxsteps) { 
      glow[0]=s;
      return -1.;
    }
    t += h*ff;
    lh=h*ff;
    s++;
  }
  glow[0]=s;
  return -1.;
}
float g_eps_factor;
float stFactorFov;
 
float intersectStepback( isofunction f, PVector ro, PVector rd,
float maxt, float[] glow, float ff, float eps_factor, float minT) {
  int s=0;
  int maxsteps=200;
  float eps=0.000006;
  boolean hit=false;
  PVector p=ro.get();
 
  for(float t=minT;t<maxt;)
  {
    p.x=ro.x+rd.x*t;
    p.y=ro.y+rd.y*t;
    p.z=ro.z+rd.z*t;
    float h = f.map(p);
    if( hit && h<eps )
    {
      glow[0]=(float)(s-1)/32.;    
      return  t;
    }
    if( s ==maxsteps) { 
      glow[0]=(float)s/32.;
      return -1.;
    }
    t += h*ff;
    eps=t*eps_factor;
    if ( h<eps) {
      hit=true;
    }
    s++;
  }
  glow[0]=(float)s/32.;
  return -1.;
}
float shadow( isofunction f, PVector ro, PVector rd, float mint, float maxt, float k, float startt, float ff) {
  float r = 1.0;
  PVector p=ro.get();
  for(float t=mint;t<maxt;)
  {
    float  eps_factor = (startt+t*3.) * g_eps_factor;
    p.x=ro.x+rd.x*t;
    p.y=ro.y+rd.y*t;
    p.z=ro.z+rd.z*t;
    float h = f.map(p);
    if( h<eps_factor || r<0.01) {
      return 0.f;
    }
    r=min(r,k*h/t);
    t += h*ff;
  }
  return r;
}
final float ttDx=-1./sqrt(6.);
final float ttDx2=sqrt(2)/sqrt(3.);
final float ttDy=1./sqrt(2.);
final float ttDz=1./sqrt(3);
final float coneAngle=tan(radians(30.));
 
// mm, could do sky lighting with this
float aoTriTap( isofunction f, PVector ro, PVector nrm, float eps, float toff, float ff) {
  PVector tg = new PVector();
  PVector bi=new PVector();
  if ( abs(nrm.y)<0.99f)
  {
    // cross 
    bi.x=nrm.z;
    bi.z=-nrm.x;
    bi.y=0.;
    float bimag=1./sqrt(bi.x*bi.x+bi.z*bi.z);
    bi.x*=bimag;
    bi.z*=bimag;
 
    tg.x=nrm.y*bi.z;
    tg.y=nrm.z*bi.x-nrm.x*bi.z;
    tg.z=-nrm.y*bi.x;
  }
  else
  {
    tg = new PVector(1.f,0.f,0.f);
    bi = tg.cross(nrm);
    bi.normalize(); 
 
    tg = nrm.cross(bi);
  }
   int numsteps=3;
  PVector rdir0=new PVector();  
  PVector rdir1=new PVector(); 
  PVector rdir2=new PVector();
  float dx,dy,dz;
 //http://www.valvesoftware.com/publications/2007/SIGGRAPH2007_EfficientSelfShadowedRadiosityNormalMapping.pdf
  dx=ttDx;
  dy=ttDy;
  dz=ttDz;
  rdir0.x = tg.x*dx + nrm.x*dz + bi.x*dy;
  rdir0.y = tg.y*dx + nrm.y*dz + bi.y*dy;
  rdir0.z = tg.z*dx + nrm.z*dz + bi.z*dy;   
 
  dy=-dy;
  rdir1.x = tg.x*dx + nrm.x*dz + bi.x*dy;
  rdir1.y = tg.y*dx + nrm.y*dz + bi.y*dy;
  rdir1.z = tg.z*dx + nrm.z*dz + bi.z*dy;     
  dx=ttDx2;
  rdir2.x = tg.x*dx + nrm.x*dz;
  rdir2.y = tg.y*dx + nrm.y*dz;
  rdir2.z = tg.z*dx + nrm.z*dz;       
  float dst=150.f;
  return aoCone(f,ro,rdir0,coneAngle,eps*dst,0.75f*.5,numsteps)*.33+
    aoCone(f,ro,rdir1,coneAngle,eps*dst,0.5f*.5,numsteps)*.33+
    aoCone(f,ro,rdir2,coneAngle,eps*dst,0.25f*.5,numsteps)*.33;
}
 
float aoCone(isofunction f, PVector ro, PVector rd, float tanangle, float sampdist, float toff, int numSamples) {
  float fv=1.;
  float dv=sampdist/((float)numSamples);
  float sd=dv*(toff/((float)numSamples));//+toff;
   PVector p=ro.get();
  for(int i=0;i<numSamples;i++) {
    p.x=ro.x+rd.x*sd;
    p.y=ro.y+rd.y*sd;
    p.z=ro.z+rd.z*sd;
    float d= f.map(p);
    float r= sd*tanangle;   
    float f0=smoothblend(max(min((d+r)/(2.*r),1.),0.));
    sd+=dv;
    fv*=f0;
  }
  return fv;
}
// TODO : create cone function using half life cone angles
float ao( isofunction f, PVector ro, PVector rd, float eps, float toff, float aocf, float ff, float cangle) {
  float occ=1.;
  int nsteps= cangle==1. ? 4 : 5;
  float aos=2.;
  float so=eps*9. * aos;
  float aoc=.15/so;
  float sd=so*(2.-toff);
  PVector p=ro.get();
 
  for(int i=0;i<nsteps;i++) {
    p.x=ro.x+rd.x*sd;
    p.y=ro.y+rd.y*sd;
    p.z=ro.z+rd.z*sd;
   
    float d=f.map(p);//*ff;
    occ-=max(( sd - d*cangle)*aoc,0.);
    sd += so;
    aoc *=aocf;
  }
  return max(min(occ,1.),0.);
}
 
PVector calcNormal(isofunction f, PVector p, float epsf) {
  float eps=max(epsf*.5,1.5e-7);
  PVector nor=new PVector();
  PVector p0=new PVector(p.x+eps,p.y,p.z);
  PVector p1=new PVector(p.x-eps,p.y,p.z);
  nor.x = f.map(p0) - f.map(p1);
  p0.set(p.x,p.y+eps,p.z);
  p1.set(p.x,p.y-eps,p.z);
  nor.y = f.map(p0) - f.map(p1);
  p0.set(p.x,p.y,p.z+eps);
  p1.set(p.x,p.y,p.z-eps);
  nor.z = f.map(p0) - f.map(p1);
  nor.normalize();
  return nor;
}
class traceBatch implements WorkItem
{
  int s;
  int e;
  traceBatch( int _s,int _e) {
    s=_s;
    e=_e;
  }
  void run( int tid) {
    trace(pixels,s,e);
  }
}
final float fog(float t, float b )  // eq to exp(-b*t)
{
  double val = (double)(-b*t);
  final long tmp = (long) (1512775 * val + 1072632447);
  return (float)Double.longBitsToDouble(tmp << 32);
}
float pow_schlick(float a, float b)
{
  return (a / (b - a * b + a));
}
float gf=1.;
float skyf=1.;
float horf=1.;
 
PVector bgcol=new PVector(0.1*skyf,0.45*skyf,0.95*skyf);
PVector horcol=new PVector(0.9*horf,0.9*horf,0.9*horf);
PVector gcol=new PVector(0.4*gf,0.3*gf,0.1*gf);
 
void getDirAmbient(PVector c,float v) {
  float iv=1.-v;
  c.x=gcol.x*iv+bgcol.x*v;
  c.y=gcol.y*iv+bgcol.y*v;
  c.z=gcol.z*iv+bgcol.z*v;
}
void getSky(PVector c,float v) {
  float lv= abs(v);
  lv=sqrt(lv);
  float ilv=1.-lv;
  if (v<0.) {
    c.x=horcol.x*ilv+bgcol.x*lv;
    c.y=horcol.y*ilv+bgcol.y*lv;
    c.z=horcol.z*ilv+bgcol.z*lv;
  }
  else {
    c.x=horcol.x*ilv+gcol.x*lv;
    c.y=horcol.y*ilv+gcol.y*lv;
    c.z=horcol.z*ilv+gcol.z*lv;
  }
}
class TraceState
{
  float reflectivity=1.;
  float specularity=1.0;
  float diffuse=1.;
  float slight=1.f;
  PVector lightpos =new PVector(-1.0*16.,-0.8*16.,-0.6*16.);
  // bgcol.set(0.,0.,0.);
  PVector lcol=new PVector(1.0,0.8,0.7);
  PVector albedo=new PVector(1.,0.3,0.1);
  PVector surf=new PVector(0.,0.,0.);
  float ff;
 PVector glowcol;
  boolean interior;
 
  TraceState( isofunction scene) {   
    lcol.mult(slight);
    glowcol=scene.glowCol();
    ff=scene.fudgefactor();
    if ( flashlight) {
      // shoot out shadow ray
      PVector fld=new PVector(0.2,-0.2,-0.2);
      fld.normalize();
      int[] glow=new int[2];
      float tv = intersect(scene, g_camControl.m_camPos.get(), fld, 0.25, stFactorFov, glow,ff,0.);
      if ( tv<0.)
        tv=0.25;
      if ( tv<0.2) {
        tv=tv*0.75;
      }
      fld.mult(tv);
      lightpos=PVector.add( g_camControl.m_camPos.get(), fld);
    }
    interior=scene.isinterior();
  }
}
boolean calcAO=true;
final float refOccAngle=tan(radians(15.));
PVector traceRay( isofunction scene,PVector col, PVector ro, PVector rd, TraceState ts,
int depth, float minT, int iglow ) {
  float[] glow=new float[2];
  PVector skycol=new PVector();
  PVector surf=new PVector();
  float epsf=g_eps_factor;
  float t =-1;
  if ( minT>=0)
    t= intersectStepback(scene, ro,rd,64.,glow,ts.ff,epsf,minT);
  glow[0]+=(float)iglow/32.;
 
  if( t>0.0 )
  {
    float aof =1.;
    PVector pos = PVector.add(ro,PVector.mult( rd,t));
    PVector nor = calcNormal(scene, pos,epsf*t*.5); // allow for 4X ss
 
    // shadow
    getDirAmbient(col,-nor.y*.5+.5);
    scene.colormap(pos,ts.albedo, surf,t*epsf);
 
    if (!openglmode && !diffonly)
    {
      if (tritapao && depth==0)
        aof=aoTriTap( scene, pos, nor, stFactorFov*t,1.,ts.ff);
      else
        aof=ao( scene, pos, nor, stFactorFov*t,1., .5,ts.ff,1.);
    }
    PVector ldir=PVector.sub(ts.lightpos,pos);
    float llen=ldir.dot(ldir);
    float falloff=flashlight ? min(.5/llen,1.) : 1.01;
    llen=sqrt(llen);
    ldir.mult(1./llen);
    float dif1 = max(nor.dot(ldir),0.0)*max(falloff-0.01,0.);
 
    float spec=0.;
    float eps=epsf*t*1.5;
    pos.x+=nor.x*eps;
    pos.y+=nor.y*eps;
    pos.z+=nor.z*eps;
 
    if (approxbounce)   
    {
      PVector bcol=new PVector(1.,0.5,0.25);
      bcol.add(0.25,0.25,0.25);
      bcol.mult(aof*aof*2.);
      col.mult(new PVector(min(bcol.x,1.),min(bcol.y,1.),min(bcol.z,1.)));
    }
    else
      col.mult(aof);
 
    surf.x=ts.reflectivity;
 
 
    // change to slider
    float ismetal=0.;// should do as part of the surface
    float isplastic=1.;
    surf.x*=max(ismetal,isplastic);
 
    // if isplastic reduce diffuse by fresnel (energy conservation)
    ts.albedo.mult(ts.diffuse);
 
 
    if (diffonly||aoonly)
      surf.x=0;
 
 
    if ( dif1>0. && !diffonly && !aoonly) {
 
      float shadowf =1.;
      if (!openglmode){
        shadowf=shadow( scene, pos, ldir,0.0,llen,64.,t,ts.ff);
      //  shadowf=aoCone(scene,pos,ldir,refOccAngle,llen,0.5f,12);
    }
        
      dif1*=shadowf;
      // blkparams[1]+=shadowf;
      col =PVector.add(PVector.mult(ts.lcol,dif1),col);
      PVector rdinv=rd.get();
      rdinv.mult(-1.);
      // super sample normals?
      PVector lhalf=PVector.add(rdinv,ldir);
      lhalf.normalize();
      spec=dif1*pow_schlick( max( nor.dot(lhalf),0.),64.)*64.*ts.specularity*surf.x;
    }
 
    surf.x+=ismetal;
    PVector specalbedo=ts.albedo.get();
 
    lerp(specalbedo, new PVector(1.,1.,1.), ts.albedo,ismetal);
    if (noalbedo)
      ts.albedo.set(0.7,0.7,0.7);
 
    //   lerp(ts.albedo, new PVector(.5,.5,.5), ts.albedo,1.-ismetal);
    // lerp to zero on ismetal. ( can't do it due to lack of proper reflections)
    col.mult(ts.albedo);
 
    PVector I=rd.get();
    float facing=I.dot(nor);
    float fresnel=0.;
    float fv=lerp(0.035,0.5,ismetal);
    fresnel=min(max( (fv+ (1.-fv)*pow_schlick(1+facing,5)),0),1.);
 
    //col.set(0.,0.,0.);
    if (depth==0 && surf.x>0.00001 && doreflection && fresnel>0.1 && !ts.interior) {
      PVector rdr=new PVector();
      float rfresnel=max(fresnel-0.1,0.)*1.1;
 
 
      float f2=facing*2.;
 
 
      rdr.x=I.x-nor.x*f2;
      rdr.y=I.y-nor.y*f2;
      rdr.z=I.z-nor.z*f2;
      rdr.normalize();
      // TODO : use roughness to change refleciton occlusion factor
      float reflect=1.;
 
      PVector rfcol=new PVector();
      getSky(rfcol,rdr.y) ;
      if (!openglmode) {
        if (approxrefOcc)
          reflect=aoCone(scene,pos,rdr,refOccAngle,eps*100.,0.0f,8);
        else
          reflect=shadow( scene, pos, rdr,0.,10.,16.,t,ts.ff)*1.5;  // cheap reflections would be nice?        
        rfcol.mult(reflect);
      }
      // blkparams[0]+=reflect;
 
      col.x+=rfcol.x*rfresnel*surf.x;
      col.y+=rfcol.y*rfresnel*surf.x;
      col.z+=rfcol.z*rfresnel*surf.x;
    }
 
    if (spec>0.)
      col =PVector.add(PVector.mult(ts.lcol,spec*fresnel*surf.x),col);
 
 
    col.mult(specalbedo);
 
    //if (fresnel>0.2)
    //col.set(fresnel,fresnel,fresnel);
 
    float fgv= fog(t,0.09);
    float ifv=1.-fgv;
    getDirAmbient(skycol,-rd.y*.5+.5);
    col.x =col.x*fgv + ifv*skycol.x;
    col.y =col.y*fgv + ifv*skycol.y;
    col.z =col.z*fgv + ifv*skycol.z;
 
    if (aoonly) {
      if (approxbounce) {
        PVector bcol=new PVector(1.,0.5,0.25);
        bcol.add(0.25,0.25,0.25);
        bcol.mult(aof*aof*2.);
        col.set(new PVector(min(bcol.x,1.),min(bcol.y,1.),min(bcol.z,1.)));
      }
      else
        col.set(aof,aof,aof);
    }
    else if (diffonly)
      col.set(ts.albedo.x,ts.albedo.y,ts.albedo.z);
 
    //  shadowf=shadowf*.5+.5;
 
    if (shownormal) {
      getDirAmbient(col,-nor.y*.5+.5);
      // col.set(nor.x*.5+.5,nor.y*.5+.5,nor.z*.5+.5);
    }
    // col.set(rdr.x*.5+.5,rdr.y*.5+.5,rdr.z*.5+.5);
    // col.set(t/12.,t/12.,t/12.);
  }
  else
  {
     getSky(skycol,rd.y);
    col.set(skycol.x,skycol.y,skycol.z);
  }
  //ts.glowcol.set(1.,1.,1.);
  col.add( glow[0]*ts.glowcol.x,glow[0]*ts.glowcol.y,glow[0]*ts.glowcol.z);
  return col;
}
final int skipStep=4;
int[] sampleOrder= {
  0,0, 2,2, 0,2, 2,0,
  1,1, 3,3, 1,3, 3,1,
  0,1, 2,3, 0,3, 2,1,
  1,0, 3,2, 3,0, 1,2,
};
 
float[] g_mint=null;
int[] g_glow=null;
void setupMinTBuffers() {
  int blksize=(skipStep/2)*(skipStep/2);
  g_mint=new float[width*height/blksize];//2];
  g_glow=new int[width*height/blksize];
}
void trace(color[] pix, int sy, int ey)
{
  // light
  //PVector light = normalize(new PVector(1.0,-0.8,-0.6));
 
  float ctime = time;
  // camera
  PVector ro = g_camControl.m_camPos.get();
 
  // ro.mult(1.1);
  PVector ww = normalize(g_camControl.m_camDir);
  PVector uu = normalize((new PVector(0,1.,0.)).cross( ww ));
  PVector vv = normalize(ww.cross(uu));
  ww.mult(1.5);
  // ww.normalize();
  PVector view=ww.get();
  view.mult(-1.);
  view.normalize();
  int step=skipStep;
  int offx=g_frameStep%(skipStep*skipStep);
  int offy=sampleOrder[offx*2+1];
  offx=sampleOrder[offx*2+0];  // Try halton type order
 
  float sampleOffsetx=0.f;
  float sampleOffsety=0.f;
  float wieghtold=1.f;
  float wieghtnew=0.f;
  if ( g_frameStep>=step*step && highquality) {
    int sampleset=g_frameStep/(step*step);
    wieghtold=1./(sampleset+1);
    wieghtnew=1.-wieghtold;
    sampleOffsetx=((sampleset)%2)*.5;
    sampleOffsety=((sampleset)/2)*.5;
    // end on 4*(step*step);
  }
  if (!highquality) {
    offx=offy=0;
  }
 
  if ( g_frameStep>= 4*(step*step))// could do guassian blur now
    return;
 
  float aspectRatio=(float)width/(float)height;  
  int[] gv=new int[1]; 
  isofunction scene=Scenes[scIndex];
  TraceState  ts=new TraceState(scene);
  assert( highquality  ||  g_frameStep==0);
  int blkstep=step/2;
  if (earlystep && g_genBlkInfo || !highquality)
  {
    if (!highquality)
      blkstep *=4;
    int blkwidth=(width/blkstep);
    float eps=g_eps_factor*(float)blkstep*0.5f*1.7320508f;
    for (int py=sy;py<ey;py+=blkstep*2)
    {
      float y = -1.0 + 2.0 *( (float)py+((float)blkstep))/(float)height;
      PVector bray=PVector.add(PVector.mult(vv,y),ww );   
     
      for (int px=0;px<width;px+=blkstep*2)
      {    
        float x = -1.0 + 2.0 *( (float)px+((float)blkstep)) /(float)width;
        PVector rd = normalize( PVector.add(PVector.mult(uu,x*aspectRatio), bray));
 
        float st=intersect( scene, ro, rd, 64.,eps*2.,gv,ts.ff,0.);
        int igv=gv[0];
        float ystep=((float)blkstep/2.f);
        int idx=(py/blkstep)*blkwidth + px/blkstep;   
        for (int i=0;i<2;i++) {
          x = -1.0 + 2.0 *( (float)px+((float)blkstep)/2.f) /(float)width;         
          y = -1.0 + 2.0 *( (float)py+ystep)/(float)height;
          bray=PVector.add(PVector.mult(vv,y),ww ); 
          rd = normalize( PVector.add(PVector.mult(uu,x*aspectRatio), bray));
         
          g_mint[idx]=intersect( scene, ro, rd,64.,g_eps_factor*(float)blkstep*0.5f*1.7320508f,gv,ts.ff,st);
          g_glow[idx++]=gv[0]+igv;
         
          x = -1.0 + 2.0 *( (float)px+((float)blkstep)*3./2.) /(float)width;
          rd = normalize( PVector.add(PVector.mult(uu,x*aspectRatio), bray));
         
          g_mint[idx]=intersect( scene, ro, rd,64.,g_eps_factor*(float)blkstep*0.5f*1.7320508f,gv,ts.ff,st);
          g_glow[idx++]=gv[0]+igv;
          idx+=blkwidth-2;
          ystep+=(float)blkstep;
         
        }
      }
    }
  }
  PVector surf=new PVector(0.,0.,0.);
  for (int py=sy+offy;py<ey;py+=step)
  {
    float y = -1.0 + 2.0 * ((float)py+sampleOffsety) /(float)height;
    PVector col=new PVector(0.,0.,0.);
    PVector bray=PVector.add(PVector.mult(vv,y),ww );
    int midx=(py/blkstep)*(width/blkstep);   
    for (int px=offx;px<width-step;px+=step)
    {
      float x = -1.0 + 2.0 * ((float)px+sampleOffsetx) /(float)width;
      x *= aspectRatio;
      PVector rd = normalize( PVector.add(PVector.mult(uu,x), bray));
      col.set(0.,0.,0.);
      float mint=0.;
      int glowv=0;
      if (  earlystep ) {
        int xidx=px/blkstep;
        mint=g_mint[midx+xidx];
        glowv=g_glow[midx+xidx];
      }
      col=traceRay( scene,col,ro, rd,ts,0,mint,glowv);
 
      if (wieghtold !=1.) {  /// do progressive AA
        int cin=pix[py*width+px];
        float cr=(float)((cin>>16)&0xFF)*1./255.f;
        float cg=(float)((cin>>8)&0xFF)*1./255.f;
        float cb=(float)((cin)&0xFF)*1./255.f;
        col.x=min(col.x,1.)*wieghtold+cr*cr*wieghtnew;
        col.y=min(col.y,1.)*wieghtold+cg*cg*wieghtnew;
        col.z=min(col.z,1.)*wieghtold+cb*cb*wieghtnew;
      }
      int r=(int)(min(sqrt(col.x),1.)*255.);
      int g=(int)(min(sqrt(col.y),1.)*255.);
      int b=(int)(min(sqrt(col.z),1.)*255.);
      int c= r<<16|g<<8|b|0xFF<<24;
      pix[py*width+px] =c;
      if ( g_frameStep<4) {
        int idx=py*width+px;
        pix[idx+1] =c;
        pix[idx+width] =c;
       pix[idx+width+1] =c;
      }
      if ( !highquality) {  // TODO : could do in chunks
        // c=0xFF<<24;
        int idx=py*width+px;
        for(int j=0;j<skipStep;j++) {
          pix[idx+0] =c;
          pix[idx+1] =c;
          pix[idx+2] =c;
          pix[idx+3] =c;
          pix[idx+4] =c;
          idx+=width;
        }
      }
    }
  }
}
WorkQueue g_rqueue;
boolean highquality=false;
boolean tritapao=true;
boolean diffonly=false;
boolean aoonly=false;
boolean aa=false;
boolean earlystep=true;
boolean approxrefOcc=false;
boolean approxbounce=true;
boolean shownormal=false;
boolean noalbedo=false;
boolean flashlight=false;
boolean openglmode=false;
float[] fbuffer;
boolean doreflection=true;
int scIndex=0;
void keyPressed() {
  if (key=='f')
    flashlight=!flashlight;
  if (key=='p') {
    tritapao=!tritapao;
    println(" tri tap ao "+tritapao);
  }
  if (key=='t')
    diffonly=!diffonly;
  if (key=='i')
    aoonly=!aoonly;
  if (key=='e')
    earlystep=!earlystep;
  if (key=='r')
    doreflection=!doreflection;
  if (key=='b')
    approxbounce=!approxbounce;
  if (key=='w')
    g_camControl.forward(1.);
  if (key=='s')
    g_camControl.forward(-1);
  if (key=='a')
    g_camControl.side(1.);
  if (key=='d')
    g_camControl.side(-1);
  if (key=='n')
    scIndex=(scIndex+1)%Scenes.length;
  if(key=='k')
    shownormal=!shownormal;
  if(key=='l')
    noalbedo=!noalbedo;
  if (key==' ')
    g_menu.select(false);
  if (key=='c')
    calcAO=!calcAO;
  if (key=='m')
  {
    Shot s=new Shot();
    s.save();
    println(s.write());
  }
  if (key=='o')
    openglmode=!openglmode;
  g_frameStep=0;
  g_genBlkInfo=true;
}
void setup() {
  int numProc=Runtime.getRuntime().availableProcessors();
  g_rqueue=new WorkQueue(numProc);
  size(960,600,P3D);
  stFactorFov=2.0*.743294*1.0*.6/((float)height);
  // stFactorFov*=.8f;// allow for 4X SS
  setupCameraShots();
  setupMinTBuffers();
  background(~0);
  int startScene=(int)random(0,g_cameraShots.length);
  g_cameraShots[startScene].select();
}
 
int g_frameStep=0;
boolean  g_genBlkInfo=true;
int g_demoMode=0;
int[] oldPix=null;
void draw() {
  g_eps_factor = stFactorFov;
  int t=millis();
  time=millis()/1000.f;
 
  Scenes[scIndex].update();
 
  if (!highquality) {
    g_frameStep=0;
    g_genBlkInfo=false;
  }
  loadPixels();
  if (oldPix!=null) {
    arraycopy(oldPix,0,pixels,0,oldPix.length);
    oldPix=null;
  }
  int step=skipStep*8;  
  for (int i=0;i<height;i+=step)
    g_rqueue.execute( new traceBatch(i,min(i+step,height-skipStep)));
  g_rqueue.Wait();
 
  updatePixels();
  g_frameStep++;

  if (false){ 
    fill(0);
    rect(width-60,0,50,20);
    fill(~0);
    text((millis()-t),width-60+10,20);
  }
  if ( g_menu.active) {
    oldPix=new color[pixels.length];
    arraycopy(pixels,0,oldPix,0,oldPix.length);
  }
  g_menu.draw();
  if (!highquality) {
    highquality=true;
    g_genBlkInfo=true;
  }
  else {
    g_genBlkInfo=false;
  }
 
  if (g_demoMode>0 && g_frameStep>8*skipStep*skipStep) {
    g_cameraShots[(g_demoMode-1)%g_cameraShots.length].select();
    g_demoMode++;
  }
}

