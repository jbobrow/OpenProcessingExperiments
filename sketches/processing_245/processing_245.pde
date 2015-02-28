
import blobDetection.*;
import processing.video.*;


// Size of each cell in the grid
int cellSize = 40;
// Variable for capture device
Capture video;

BlobDetection theBlobDetection; 
PImage img; 



void setup() {
  size(640, 480, P3D);
  frameRate(30);

  colorMode(RGB, 255, 255, 255, 100);

  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height, 12);

   
  theBlobDetection = new BlobDetection(video.width, video.height); 
  theBlobDetection.setPosDiscrimination(true); 
  theBlobDetection.setThreshold(0.2f);

}


void draw() { 
  if (video.available()) {
    video.read();
    video.loadPixels();
     fastblur(img, 5); 



   
    background(0);    
    
    /////////////////////////
    theBlobDetection.computeBlobs(video.pixels); 

    noFill(); 
    Blob b; 
    EdgeVertex eA,eB; 
    boolean drawBlobs; 
    boolean drawEdges;




    for (int n=0 ; n<theBlobDetection.getBlobNb() ; n++) { 
      b=theBlobDetection.getBlob(n); 
      if (b!=null) { 

        if (drawEdges=true) { 
          for (int m=0;m<b.getEdgeNb();m+=5) { 
            eA = b.getEdgeVertexA(m); 
            eB = b.getEdgeVertexB(m); 






            int loc = (video.width+m+1 ) + n-video.width;
            float r = red(video.pixels[loc]*2);
            float g = green(video.pixels[loc]*2);
            float bl = blue(video.pixels[loc]*2);
            // Make a new color with an alpha component
            color c = color(r, g, bl,10);
            float sz = (brightness(c) / 255.0) * (eA.x*width/100 * eA.y*height/100);


             
            fill(c);
            //stroke(255,20);
            rectMode(CENTER);
            rect(eA.x*width, eA.y*height,sz, sz); 
            rect( eA.x*width/4, eA.y*height/4, 2,2 ); 
            strokeWeight(sz);
            stroke(c,25);  
            line( eA.x*width, eA.y*height,eB.x*height/4, eB.y*height/4);
           
            /////////////////////////////////////////////////////
          } 
        } 
      }
    }

  }
}


// ================================================== 
 // Super Fast Blur v1.1 
 // by Mario Klingemann  
 // <http://incubator.quasimondo.com> 
 // ================================================== 
 void fastblur(PImage img,int radius) 
 { 
 if (radius<25){ 
 return; 
 } 
 int w=img.width; 
 int h=img.height; 
 int wm=w-1; 
 int hm=h-1; 
 int wh=w*h; 
 int div=radius+radius+5; 
 int r[]=new int[wh]; 
 int g[]=new int[wh]; 
 int b[]=new int[wh]; 
 int rsum,gsum,bsum,x,y,i,p,p1,p2,yp,yi,yw; 
 int vmin[] = new int[max(w,h)]; 
 int vmax[] = new int[max(w,h)]; 
 int[] pix=img.pixels; 
 int dv[]=new int[256*div]; 
 for (i=0;i<256*div;i++){ 
 dv[i]=(i/div); 
 } 
 
 
 yw=yi=0; 
 
 for (y=0;y<h;y++){ 
 rsum=gsum=bsum=0; 
 for(i=-radius;i<=radius;i++){ 
 p=pix[yi+min(wm,max(i,0))]; 
 rsum+=(p & 0xff0000)>>16; 
 gsum+=(p & 0x00ff00)>>8; 
 bsum+= p & 0x0000ff; 
 } 
 for (x=0;x<w;x++){ 
 
 r[yi]=dv[rsum]; 
 g[yi]=dv[gsum]; 
 b[yi]=dv[bsum]; 
 
 if(y==0){ 
 vmin[x]=min(x+radius+1,wm); 
 vmax[x]=max(x-radius,0); 
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
 
 for (x=0;x<w;x++){ 
 rsum=gsum=bsum=0; 
 yp=-radius*w; 
 for(i=-radius;i<=radius;i++){ 
 yi=max(0,yp)+x; 
 rsum+=r[yi]; 
 gsum+=g[yi]; 
 bsum+=b[yi]; 
 yp+=w; 
 } 
 yi=x; 
 for (y=0;y<h;y++){ 
 pix[yi]=0xff000000 | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum]; 
 if(x==0){ 
 vmin[y]=min(y+radius+1,hm)*w; 
 vmax[y]=max(y-radius,0)*w; 
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

void keyPressed(){
  if (key=='s'){
    saveFrame("Squares-####.jpg");
  }
}

