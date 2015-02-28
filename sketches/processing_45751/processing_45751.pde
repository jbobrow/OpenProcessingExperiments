
//super useful algorithm !!
// Super Fast Blur v1.1
// by Mario Klingemann <http://incubator.quasimondo.com>
//
void fastblur(int radius){
  if (radius<1){
    return;
  }

  int wm=width-1;
  int hm=height-1;
  int wh=width*height;
  int div=radius+radius+1;
  int r[]=new int[wh];
  int g[]=new int[wh];
  int b[]=new int[wh];
  int rsum,gsum,bsum,x,y,i,p,p1,p2,yp,yi,yw;
  int vmin[] = new int[max(width,height)];
  int vmax[] = new int[max(width,height)];
  loadPixels();
  int dv[]=new int[256*div];
  for (i=0;i<256*div;i++){
     dv[i]=(i/div); 
  }
  
  yw=yi=0;
 
  for (y=0;y<height;y++){
    rsum=gsum=bsum=0;
    for(i=-radius;i<=radius;i++){
      p=pixels[yi+min(wm,max(i,0))];
      rsum+=(p & 0xff0000)>>16;
      gsum+=(p & 0x00ff00)>>8;
      bsum+= p & 0x0000ff;
   }
    for (x=0;x<width;x++){
    
      r[yi]=dv[rsum];
      g[yi]=dv[gsum];
      b[yi]=dv[bsum];

      if(y==0){
        vmin[x]=min(x+radius+1,wm);
        vmax[x]=max(x-radius,0);
       } 
       p1=pixels[yw+vmin[x]];
       p2=pixels[yw+vmax[x]];

      rsum+=((p1 & 0xff0000)-(p2 & 0xff0000))>>16;
      gsum+=((p1 & 0x00ff00)-(p2 & 0x00ff00))>>8;
      bsum+= (p1 & 0x0000ff)-(p2 & 0x0000ff);
      yi++;
    }
    yw+=width;
  }
  
  for (x=0;x<width;x++){
    rsum=gsum=bsum=0;
    yp=-radius*width;
    for(i=-radius;i<=radius;i++){
      yi=max(0,yp)+x;
      rsum+=r[yi];
      gsum+=g[yi];
      bsum+=b[yi];
      yp+=width;
    }
    yi=x;
    for (y=0;y<height;y++){
      pixels[yi]=0xff000000 | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum];
      if(x==0){
        vmin[y]=min(y+radius+1,hm)*width;
        vmax[y]=max(y-radius,0)*width;
      } 
      p1=x+vmin[y];
      p2=x+vmax[y];

      rsum+=r[p1]-r[p2];
      gsum+=g[p1]-g[p2];
      bsum+=b[p1]-b[p2];

      yi+=width;
    }
  }
updatePixels();
}




