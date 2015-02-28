
ArrayList photons;

color B = color(0, 51, 254);
color G = color(146, 255, 1);
color R = color(254, 0, 0);


void setup() {
  size(320, 240, P2D); 
  frameRate(60);
  background(0);

  photons = new ArrayList();
  for (int i = 1 ; i <= 10000;i++) {
    photons.add(new Photon(i));
  }
}



void draw() {
  //  background(0);
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);
  float al = 55;



  for (int i = 0 ; i < photons.size();i++) {
    Photon p = (Photon)photons.get(i);
    p.draw();
  }

  fastblur(g, 3);



  for (int i = 0 ; i < photons.size();i++) {
    Photon p = (Photon)photons.get(i);
    p.draw();
  }
}


class Photon {
  float xb, yb, xg, yg, xr, yr;
  color c;
  float al;
  int id;

  Photon(int _id) {
    id = _id; 
    xb=xr=xg=width/2;
    yb=yr=yg=height/2;
  }

  void draw() {
    al =  (sin((frameCount)/30.0+id/(45.0+55.0+65.0)/3.0)+1.0)*20.0;

    float db = dist(xb, yb, mouseX, mouseY);
    float dg = dist(xg, yg, mouseX, mouseY);
    float dr = dist(xr, yr, mouseX, mouseY);


    //450
    xb += (sin(frameCount/(PI*100.0/(id+0.0)))*(width/2-20)+width/2-xb)/(db/3.0+0.45);
    yb += (height/2+sin(frameCount/(4.5*id/db))*(height/2-20.0)-yb)/(db/3.0*0.45);

    xg += (sin(frameCount/(PI*100.0/(id+0.0)))*(width/2-20)+width/2-xg)/(dg/3.0+0.55);
    yg += (height/2+sin(frameCount/(5.5*id/dg))*(height/2-20.0)-yg)/(dg/3.0*0.55);

    xr += (sin(frameCount/(PI*100.0/(id+0.0)))*(width/2-20)+width/2-xr)/(dr/3.0+0.65);
    yr += (height/2+sin(frameCount/(6.5*id/dr))*(height/2-20.0)-yr)/(dr/3.0*0.65);


    stroke(B, al);

    point(xb, yb);


    stroke(G, al);
    //550

    point(xg, yg);


    stroke(R, al);
    //650

    point(xr, yr);
  }
}

void fastblur(PGraphics img, int radius) {

  if (radius<1) {
    return;
  }
  int w=img.width;
  int h=img.height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=radius+radius+1;
  int r[]=new int[wh];
  int g[]=new int[wh];
  int b[]=new int[wh];
  int rsum, gsum, bsum, x, y, i, p, p1, p2, yp, yi, yw;
  int vmin[] = new int[max(w, h)];
  int vmax[] = new int[max(w, h)];
  int[] pix=img.pixels;
  int dv[]=new int[256*div];
  for (i=0;i<256*div;i++) {
    dv[i]=(i/div);
  }

  yw=yi=0;

  for (y=0;y<h;y++) {
    rsum=gsum=bsum=0;
    for (i=-radius;i<=radius;i++) {
      p=pix[yi+min(wm, max(i, 0))];
      rsum+=(p & 0xff0000)>>16;
      gsum+=(p & 0x00ff00)>>8;
      bsum+= p & 0x0000ff;
    }
    for (x=0;x<w;x++) {

      r[yi]=dv[rsum];
      g[yi]=dv[gsum];
      b[yi]=dv[bsum];

      if (y==0) {
        vmin[x]=min(x+radius+1, wm);
        vmax[x]=max(x-radius, 0);
      } 
      p1=pix[yw+vmin[x]];
      p2=pix[yw+vmax[x]];

      rsum+=((p1 & 0xff0000)-(p2 & 0xff0000))>>16;
      gsum+=((p1 & 0x00ff00)-(p2 & 0x00ff00))>>8;
      bsum+= (p1 & 0x0000ff)-(p2 & 0x0000ff);
      yi++;
    }
    yw+=w;
  }

  for (x=0;x<w;x++) {
    rsum=gsum=bsum=0;
    yp=-radius*w;
    for (i=-radius;i<=radius;i++) {
      yi=max(0, yp)+x;
      rsum+=r[yi];
      gsum+=g[yi];
      bsum+=b[yi];
      yp+=w;
    }
    yi=x;
    for (y=0;y<h;y++) {
      pix[yi]=0xff000000 | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum];
      if (x==0) {
        vmin[y]=min(y+radius+1, hm)*w;
        vmax[y]=max(y-radius, 0)*w;
      } 
      p1=x+vmin[y];
      p2=x+vmax[y];

      rsum+=r[p1]-r[p2];
      gsum+=g[p1]-g[p2];
      bsum+=b[p1]-b[p2];

      yi+=w;
    }
  }
}


