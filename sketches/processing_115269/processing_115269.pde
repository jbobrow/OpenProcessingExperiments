
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/10435*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// Optical Flow 2010/05/28
// Hidetoshi Shimodaira shimo@is.titech.ac.jp 2010 GPL

//tweet by Maribel Trillo 2013/02/15

// use video
import processing.video.*;
Capture video;
 
///////////////////////////////////////////////
// parameters for desktop pc (high performance)
//int wscreen=1280;
//int hscreen=960;
int wscreen=720; //I check the camera resolution and then change it this value
int hscreen=576; //I check the camera resolution and then change it this value
int sizefactor=1;//to make bigger the sreen

int gs=10; // grid step (pixels) the more steps the less capture reaction, and less objects
           // 10 is OK, 
float predsec=0.4; // prediction time (sec): larger for longer vector

//int fps=30;// capture parameters longer lines more movement capture
int fps=15;// capture parameters faster but shorter lines

// grid parameters
int as=gs*2;  // window size for averaging (-as,...,+as)
int gw=wscreen/gs;
int gh=hscreen/gs;
int gs2=gs/2;
float df=predsec*fps;

// regression vectors
float[] fx, fy, ft;
int fm=3*9; // length of the vectors
 
// regularization term for regression
float fc=pow(9,7); // larger values for noisy video, if I increase is less responsive, the lines are shorter
 
// smoothing parameters
float wflow=0.4; // smaller value for longer smoothing, delay the dissapereance, and shorter lines

// internally used variables
float ar,ag,ab; // used as return value of pixave
float[] dtr, dtg, dtb; // differentiation by t time (red,gree,blue)
float[] dxr, dxg, dxb; // differentiation by x (red,gree,blue)
float[] dyr, dyg, dyb; // differentiation by y (red,gree,blue)
float[] par, pag, pab; // averaged grid values (red,gree,blue)
float[] flowx, flowy; // computed optical flow
float[] sflowx, sflowy; // slowly changing version of the flow

color spore1, spore2, spore3, spore4; //color when no pixel change
 
void setup(){
  // screen and video
  //size(1280, 960, JAVA2D); // JAVA2D Highquality render
  //size(800, 600); // fast render
  //size(wscreen*2, hscreen*2); // fast render
  size(wscreen*sizefactor, hscreen*sizefactor); // fast render
  String[] cameras = Capture.list(); // save information from the camera

  //show camera details so I can change the resolution of the camera
  /*for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }*/
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    //video = new Capture(this, cameras[0]); //720x576,fps=30    
    video = new Capture(this, cameras[1]); //720x576,fps=15 I tried 360X288 but it didn't work
    video.start();  
  
  // draw
  rectMode(CENTER);//Modifies the location from which rectangles are drawn by changing the way in which parameters given to rect() are intepreted.
  ellipseMode(CENTER); //Modifies the location from which ellipses are drawn by changing the way in which parameters given to ellipse() are intepreted.
 
  // arrays
  par = new float[gw*gh];
  pag = new float[gw*gh];
  pab = new float[gw*gh];
  dtr = new float[gw*gh];
  dtg = new float[gw*gh];
  dtb = new float[gw*gh];
  dxr = new float[gw*gh];
  dxg = new float[gw*gh];
  dxb = new float[gw*gh];
  dyr = new float[gw*gh];
  dyg = new float[gw*gh];
  dyb = new float[gw*gh];
  flowx = new float[gw*gh];
  flowy = new float[gw*gh];
  sflowx = new float[gw*gh];
  sflowy = new float[gw*gh];
  fx = new float[fm];
  fy = new float[fm];
  ft = new float[fm];

}
  
// calculate average pixel value (r,g,b) for rectangle region
//19/02 I tried to manipulate the colour form here but it didn't work

void pixave(int x1, int y1, int x2, int y2) {
  float sumr,sumg,sumb;
  color pix;
  int r,g,b;
  int n;
 
  if(x1<0) x1=0;
  if(x2>=wscreen) x2=wscreen-1;
  if(y1<0) y1=0;
  if(y2>=hscreen) y2=hscreen-1;
 
  sumr=sumg=sumb=0.0;
  
  for(int y=y1; y<=y2; y++) {
    for(int i=wscreen*y+x1; i<=wscreen*y+x2; i++) {
      
      pix=video.pixels[i];
      
      b=pix & 0xFF; // blue (& = bitwise opperator AND)
      
      pix = pix >> 8; //(>> = bitwise opperator right shift ) A right shift can extract red, green, blue, and alpha values from a color, thi sis the faster way to do it
      
      g=pix & 0xFF; // green
      
      pix = pix >> 8;
      
      r=pix & 0xFF; // red 
      
      // averaging the values
      sumr += r;
      sumg += g;
      sumb += b;

    }
  }
  n = (x2-x1+1)*(y2-y1+1); // number of pixels
  
  // the results are stored in static variables
  ar = sumr/n;
  ag = sumg/n;
  ab = sumb/n;

}
 
// extract values from 9 neighbour grids
void getnext9(float x[], float y[], int i, int j) {
  y[j+0] = x[i+0];
  y[j+1] = x[i-1];
  y[j+2] = x[i+1];
  y[j+3] = x[i-gw];
  y[j+4] = x[i+gw];
  y[j+5] = x[i-gw-1];
  y[j+6] = x[i-gw+1];
  y[j+7] = x[i+gw-1];
  y[j+8] = x[i+gw+1];
}
 
// solve optical flow by least squares (regression analysis)
void solveflow(int ig) {
  float xx, xy, yy, xt, yt;
  float a,u,v,w;
 
  // prepare covariances
  xx=xy=yy=xt=yt=0.0;
  for(int i=0;i<fm;i++) {
    xx += fx[i]*fx[i];
    xy += fx[i]*fy[i];
    yy += fy[i]*fy[i];
    xt += fx[i]*ft[i];
    yt += fy[i]*ft[i];
  }
 
  // least squares computation
  a = xx*yy - xy*xy + fc; // fc is for stable computation
  u = yy*xt - xy*yt; // x direction
  v = xx*yt - xy*xt; // y direction
 
  // write back
  flowx[ig] = -2*gs*u/a; // optical flow x (pixel per frame)
  flowy[ig] = -2*gs*v/a; // optical flow y (pixel per frame)
}
 
void draw() {
  int m = minute();
  //int m = second();
  int cback;
  color spore2, spore3, spore4; //color when no pixel change
  
  if(video.available()){
    // video capture
    video.read();
    
    //change background color over time
    if (((m>=15) && (m<30))||((m>=45) && (m<=59))) {
    background(5,0,41,5); //dark
    spore4 = color(5,0,41,0); //dark background
    spore2 = color(5,0,41,10);
    spore3 = color(222,2,145, 30);    
    } else { background(214,211,201,5); //light background
      spore4 = color(214, 211, 201, 0); //light background
      spore2 = color(232, 199, 91, 40);
      spore3 = color(118, 92, 4, 30);    
    }
    
    //cback=(int) (sqrt((m-30)*(m-30))*8);
    //background(m*4,cback,cback);
        
    //image(video, 0, 0);
    //set(0,0,video);
          
    // 1st sweep : differentiation by time
    for(int ix=0;ix<gw;ix++) {
      int x0=ix*gs+gs2;
      
      for(int iy=0;iy<gh;iy++) {
        int y0=iy*gs+gs2;
        int ig=iy*gw+ix;
        
        // compute average pixel at (x0,y0)
        pixave(x0-as,y0-as,x0+as,y0+as);
        
        // compute time difference
        dtr[ig] = ar-par[ig]; // red
        dtg[ig] = ag-pag[ig]; // green
        dtb[ig] = ab-pab[ig]; // blue
        
        // save the pixel
        par[ig]=ar;
        pag[ig]=ag;
        pab[ig]=ab;
      }
    }
 
    // 2nd sweep : differentiations by x and y
    for(int ix=1;ix<gw-1;ix++) {
      for(int iy=1;iy<gh-1;iy++) {
        int ig=iy*gw+ix;
        
        // compute x difference
        dxr[ig] = par[ig+1]-par[ig-1]; // red
        dxg[ig] = pag[ig+1]-pag[ig-1]; // green
        dxb[ig] = pab[ig+1]-pab[ig-1]; // blue
        
        // compute y difference
        dyr[ig] = par[ig+gw]-par[ig-gw]; // red
        dyg[ig] = pag[ig+gw]-pag[ig-gw]; // green
        dyb[ig] = pab[ig+gw]-pab[ig-gw]; // blue
      }
    }
 
    // 3rd sweep : solving optical flow
    for(int ix=1;ix<gw-1;ix++) {
      int x0=ix*gs+gs2;
      
      for(int iy=1;iy<gh-1;iy++) {
        int y0=iy*gs+gs2;
        int ig=iy*gw+ix;
 
        // prepare vectors fx, fy, ft
        getnext9(dxr,fx,ig,0); // dx red
        getnext9(dxg,fx,ig,9); // dx green
        getnext9(dxb,fx,ig,18);// dx blue
        getnext9(dyr,fy,ig,0); // dy red
        getnext9(dyg,fy,ig,9); // dy green
        getnext9(dyb,fy,ig,18);// dy blue
        getnext9(dtr,ft,ig,0); // dt red
        getnext9(dtg,ft,ig,9); // dt green
        getnext9(dtb,ft,ig,18);// dt blue
 
        // solve for (flowx, flowy) such that
        solveflow(ig);
 
        // smoothing
        sflowx[ig]+=(flowx[ig]-sflowx[ig])*wflow;
        sflowy[ig]+=(flowy[ig]-sflowy[ig])*wflow;
      }
    }
 
 
    // 4th sweep : draw the flow
    for(int ix=0;ix<gw;ix++) {
      //int x0=(ix*gs+gs2)+300; //+300 is for move the matriz to the center
      int x0=(ix*gs+gs2)*sizefactor;
      
      for(int iy=0;iy<gh;iy++) {
        //int y0=(iy*gs+gs2)+200; //+200 is for move the matriz to the center
        int y0=(iy*gs+gs2)*sizefactor;
        int ig=iy*gw+ix;
 
        float u=df*sflowx[ig];
        float v=df*sflowy[ig];
 
        // draw the line segments for optical flow
        float a=sqrt(u*u+v*v);
        
        if(a>=2.0) { // draw only if the length >=2.0
          float r=0.5*(1.0+u/(a+0.1));
          float g=0.5*(1.0+v/(a+0.1));
          float b=0.5*(2.0-(r+g));
          
          //if to select if display square or triangle
          if (((m>=10) && (m<20))||((m>=30) && (m<40))||((m>=50) && (m<=59))) {
            strokeWeight(15);
            strokeCap(SQUARE);
            stroke(255*r,255*g,255*b,50);
            line(x0,y0,(x0+u),(y0+v));
            
            //change filter color over time
            if (((m>=15) && (m<30))||((m>=45) && (m<=59))) {
            strokeWeight(15);
            stroke(93,3,3,40);
            } else stroke(0,0,0,95); //light
            
            line(x0,y0,x0+u,y0+v); 
          } else { 
            
          noStroke();
          
          if (((m>=15) && (m<30))||((m>=45) && (m<=59))) {
          fill(255*r,255*g,255*b,90); //filter for Dark background
          } else { fill(255*r,255*g,255*b,50); }  
          
          triangle (x0,y0,x0+10,y0+10,x0+u,y0+v); 
          
          if (((m>=15) && (m<30))||((m>=45) && (m<=59))) {
          fill(0,0,0,70); //filter for Dark background
          } else {fill(0,0,0,95);}
          
          triangle (x0,y0,x0+5,y0+5,x0+u,y0+v); 
          }
        
        } else {
            int colspore = spore4;
            float r = random(0,10);
            float ry = random(0,1);
            float rx = random(1,2);
            if ((r > 3.9) && (r < 4)) colspore = spore3;
            else if ((r > 9.9) && (r < 10)) colspore = spore2;
            
            fill(colspore);
            noStroke();
            ellipse(x0,y0,rx*8,ry*8); //draw shape. Also I add *2 to change the location of the shape
        }    
      }
    }
  // Saves each frame as line-000000.png, line-000001.png, etc.
  //saveFrame("frames/######.jpg");
  } 
}



