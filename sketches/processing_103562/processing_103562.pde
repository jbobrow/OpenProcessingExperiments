
float [][] scale;
int n_sc;
int c_sc;
float r_sc,g_sc,b_sc;
int HotFinger;
int Nclick;
int Nmax=9;
int [] xc;
int [] yc;
float [] tc;
float T0=0.0;
float T100=100.0;
int nran=5000;
int fsize=16;
int fsize32=32;

HScrollbar hsTop, hsBottom;  // Two Hscrollbars
VScrollbar vsLeft, vsRight;  // Two Hscrollbars
PImage img;

int LBWIDTH=30;
int LBHEIGHT=30;
int ARRAY_SIZE=900;
int Nwalk=9;

int wbar=100;

//int LBWIDTH=256;
//int LBHEIGHT=256;
//int ARRAY_SIZE=65536;

float [] data;
int [] idone;
float [] T;
int crt_scale;
int Ndone;

    int x0;
    int y0;
    int x;
    int y;
    int k;
    int khit;
    int iwalk;
   float sum0;
   int isFirst;
   int isAni;
   int isCal;
   int isBCchanged;
   
   float h1TopOld,h1BottomOld;
   float v1LeftOld,v1RightOld;

void setup() {
    x0=LBWIDTH/2;
    y0=LBHEIGHT/2;
    k=0;
    khit=0;
    iwalk=0;
    sum0=0.0;
    
    x=x0;
    y=y0;
    isFirst=0;
    Ndone=0;
    isAni=1;
    isCal=1;
    isBCchanged=0;
    
   size(400, 400);
   
   int SCstart;
   SCstart=50+width-100-wbar;
   hsTop = new HScrollbar(0+50, 50-wbar/2, width-100, wbar, wbar,SCstart);
   //hsTop.spos=width-100-wbar;
   SCstart=50;
   hsBottom = new HScrollbar(0+50, height-50+wbar/2, width-100, wbar, wbar,SCstart);   
   
   SCstart=wbar;
   vsLeft = new VScrollbar(0+50-wbar/2, 50, wbar, height-100, wbar,SCstart);
   vsRight = new VScrollbar(width-50+wbar/2, 50, wbar, height-100, wbar,SCstart);      
   crt_scale=(width-100)/LBWIDTH;
   //println ("crt_scale="+crt_scale);
     
   HotFinger=1;
   Nclick=0;
   
   //frame.setResizable(true);   
   img = createImage(LBWIDTH, LBHEIGHT, RGB);
  
   int i,j;
   data = new float[ARRAY_SIZE];
   idone = new int[ARRAY_SIZE];
   T = new float[ARRAY_SIZE];
   scale=new float[6][4];
   xc = new int[Nmax];
   yc = new int[Nmax];
   tc = new float[Nmax];
   
   // create color scale
   DelPoint();
   
   AddPoint(0.0, 0, 0, 1);
   AddPoint(20.0, 0, 0.5, 1);
   AddPoint(40.0, 0, 0.5, 0.5);
   AddPoint(60.0, 0, 1, 0);
   AddPoint(80.0, 1, 0.5, 0);
   AddPoint(100.0, 1, 0, 0);
   
   background(0);
   img.loadPixels(); 
   
   /* Initialize data */
   for(i=0; i<ARRAY_SIZE; i++) {
      data[i] = 0.0;
      idone[i] = 0;
   }
   

   //top 
   j=0;
   for(i=0; i<LBWIDTH; i++) {
      data[j*LBWIDTH+i] = T100;
      idone[i] = 1;
      GetColor(data[j*LBWIDTH+i]);
      img.pixels[(i + j * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
   }
   h1TopOld=T100;

   //bottom
   j= LBHEIGHT-1;
   for(i=0; i<LBWIDTH; i++) {
      data[j*LBWIDTH+i] = T0;
      idone[j*LBWIDTH+i] = 1;
      GetColor(data[j*LBWIDTH+i]);
      img.pixels[(i + j * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
   }
   h1BottomOld=T0;
   
   //left
   i=0;
   for(j=1; j< LBHEIGHT-1; j++) {
      data[j*LBWIDTH+i] = T0;
      idone[j*LBWIDTH+i] = 1;
      GetColor(data[j*LBWIDTH+i]);
      img.pixels[(i + j * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
   }
   v1LeftOld=T0;

   //right
   i=LBWIDTH-1;
   for(j=1; j< LBHEIGHT-1; j++) {
      data[j*LBWIDTH+i] = T0;
      idone[j*LBWIDTH+i] = 1;
      GetColor(data[j*LBWIDTH+i]);
      img.pixels[(i + j * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
   }
   v1RightOld=T0;
   
   img.updatePixels();
   image(img,50,50,LBWIDTH*crt_scale,LBHEIGHT*crt_scale);
   
   int icol;
   int wscale=8;
   
   icol=1;
   color col1 = color(0, 0, 255);
   fill(col1);
   rect(icol*wscale, height-50+5, wscale, 40/2);
   
   icol=1;
   color col2 = color(0, 127, 255);
   fill(col2);
   rect(icol*wscale, height-50+5, wscale, 40/2);
   
   icol=2;
   color col3 = color(0, 127, 127);
   fill(col3);
   rect(icol*wscale, height-50+5, wscale, 40/2);
   
   icol=3;
   color col4 = color(0, 255, 0);
   fill(col4);
   rect(icol*wscale, height-50+5, wscale, 40/2);
   
   icol=4;
   color col5 = color(255, 127, 0);
   fill(col5);
   rect(icol*wscale, height-50+5, wscale, 40/2);
   
   icol=5;
   color col6 = color(255, 0, 0);
   fill(col6);
   rect(icol*wscale, height-50+5, wscale, 40/2);
   
   
   
   color cold = color(0, 0, 255);
   fill(cold);
   rect(5, 5, 40, 40, 3, 3, 3, 3);
   
   textSize(fsize32);
   fill(255, 255, 255);
   text(Nwalk-iwalk, 25-fsize32/2, 0+25+fsize32/2); 
   
   
   color hot = color(255, 0, 0);
   fill(hot);
   rect(width-50+5, 5, 40, 40, 3, 3, 3, 3);
   
   textSize(fsize);
   fill(255, 255, 255);
   text(Ndone, width-50+5, 30); 

   
   
   color cal = color(0,255, 0);
   fill(cal);
   rect(width-50+5, height-50+5, 40, 40, 3, 3, 3, 3);
   textSize(fsize32);
   fill(255, 255, 255);
   text(isCal, width-25-fsize32/2, height-25+fsize32/2); 
     
}

void draw() {
   float h1Top,h1Bottom;
   float v1Left,v1Right;
   
   //calc;
   int i,j;
   float inputN, inputS, inputE, inputW;
   
   if (isCal==0)
   { 
   
    h1Top=hsTop.getPos();
    if (h1Top!=h1TopOld) 
    {
      isBCchanged=1;
      h1TopOld=h1Top;
    } 
    
    h1Bottom=hsBottom.getPos();
    if (h1Bottom!=h1BottomOld) 
    {
      isBCchanged=1;
      h1BottomOld=h1Bottom;
    }
    
    v1Left=vsLeft.getPos();
    if (v1Left!=v1LeftOld) 
    {
      isBCchanged=1;
      v1LeftOld=v1Left;
    } 

    v1Right=vsRight.getPos();
    if (v1Right!=v1RightOld) 
    {
      isBCchanged=1;
      v1RightOld=v1Right;
    } 

    if (isBCchanged==1)
    {
       iwalk=0;
       Ndone=0;
      
       color cold = color(0, 0, 255);
       fill(cold);
       rect(5, 5, 40, 40, 3, 3, 3, 3);
   
       textSize(fsize32);
       fill(255, 255, 255);
       text(Nwalk-iwalk, 25-fsize32/2, 0+25+fsize32/2); 
   
   
       color hot = color(255, 0, 0);
       fill(hot);
       rect(width-50+5, 5, 40, 40, 3, 3, 3, 3);
   
       textSize(fsize);
       fill(255, 255, 255);
       text(Ndone, width-50+5, 30); 
      
       /* Initialize data */
       for(i=0; i<ARRAY_SIZE; i++)
       {
          data[i] = 0.0;
          idone[i] = 0;
          img.pixels[i] = color(0,0,0);
       }
       
     //top 
     j=0;
     for(i=0; i<LBWIDTH; i++) {
      //data[i] = h1Top;
      data[i] = h1Top;
      GetColor(data[j*LBWIDTH+i]);
      img.pixels[(i + j * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
     }
   
     //bottom
     j= LBHEIGHT-1;
     for(i=0; i<LBWIDTH; i++) {
      data[(j)*LBWIDTH+i] = h1Bottom;
      GetColor(data[j*LBWIDTH+i]);
      img.pixels[(i + j * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
     }
   
     //left
     for(j=1; j< LBHEIGHT-1; j++) {
      i=0;
      data[j*LBWIDTH+i] = v1Left;
      GetColor(data[j*LBWIDTH+i]);
      img.pixels[(i + j * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
     }

     //right
     for(j=1; j< LBHEIGHT-1; j++) {
      i=LBWIDTH-1;
      data[j*LBWIDTH+i] = v1Right;
      GetColor(data[j*LBWIDTH+i]);
      img.pixels[(i + j * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
     }
     
     isBCchanged=0;
    }
    
   }
   
   if (isCal==1)
   {
    for (i=1;i<=Nclick;i++) {
      //println(i);
      data[yc[i]*LBWIDTH+xc[i]]=tc[i];
      GetColor(tc[i]);
      img.pixels[(xc[i] + yc[i] * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
    }
   
    float r;
    if (k<nran)
    {
      if (x>0 && x<LBWIDTH-1 && y>0 && y<LBHEIGHT-1 && idone[x+y*LBWIDTH]==0)
      {      
            r=random(1);
            if (r>=0 && r<0.25) {x=x+1;}
            if (r>=0.25 && r<0.5) {y=y+1;}
            if (r>=0.5 && r<0.75) {x=x-1;}
            if (r>=0.75 && r<1) {y=y-1;}
            if (x>0 && x<LBWIDTH-1 && y>0 && y<LBHEIGHT-1 ) 
            {
               img.pixels[(x + y * LBWIDTH) ] = color(255,255,255);
            }
            k=k+1;   
            //println ("x="+x+"y="+y);
      } else
      {
        iwalk=iwalk+1;
        T[iwalk]=data[y*LBWIDTH+x];
        sum0=(sum0*(iwalk-1)+data[y*LBWIDTH+x])/iwalk;
        data[y0*LBWIDTH+x0]=sum0;
        
        if (isFirst==0) 
        {
            //println("iwalk="+iwalk+" x="+x+" y="+y+" T="+data[y0*LBWIDTH+x0]+" T0="+sum0);
            color cold = color(0, 0, 255);
            fill(cold);
            rect(5, 5, 40, 40, 3, 3, 3, 3);
            
            textSize(fsize32);
            fill(255, 255, 255);
            text(Nwalk-iwalk, 25-fsize32/2, 0+25+fsize32/2); 
        }
        
        if (isAni==1) 
        {
          for(j = 0+1; j < LBHEIGHT-1; j++)
          {
                for(i = 0+1; i < LBWIDTH-1; i++)
                {
                    img.pixels[(i + j * LBWIDTH) ] = color(0,0,0);
                }
          }             
        
          for(j = 0+1; j < LBHEIGHT-1; j++)
          {
                for(i = 0+1; i < LBWIDTH-1; i++)
                {
                   if (idone[i+j*LBWIDTH]==1)
                   {
                      GetColor(data[j*LBWIDTH+i]);
                      img.pixels[(i + j * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
                   }
                }
          }             
             
          GetColor(sum0);
          img.pixels[(x0 + y0 * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
        }
        
        if (iwalk<Nwalk)
        {
             k=0;
             khit=0;
             x=x0;
             y=y0;
        } else
        {
           Ndone=Ndone+1;
           
           /*
           float sum1;
           sum1=0.0;
           for (i=1;i<=Nwalk;i++)
           {
               sum1=sum1+T[i];   
           } 
           sum1=sum1/Nwalk;
           GetColor(sum1);
           img.pixels[(x0 + y0 * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
           */
           
           if (isFirst==0) {
             color hot = color(255, 0, 0);
             fill(hot);
             rect(width-50+5, 5, 40, 40, 3, 3, 3, 3);
             
             textSize(fsize);
             fill(255, 255, 255);
             text(Ndone, width-50+5, 30); 

             println(Ndone+" nwalk reached. x0="+x0+" y0="+y0+" T="+data[y0*LBWIDTH+x0]);
             //println(" ");
             //isFirst=1;
           }  
           idone[x0+y0*LBWIDTH]=1;
           
           x0=(int) random(1,LBWIDTH-1);
           y0=(int) random(1,LBHEIGHT-1);
           sum0=0.0;
           iwalk=0;
           x=x0;
           y=y0;
           
           if (isAni==1) 
           {
           
             for(j = 0+1; j < LBHEIGHT-1; j++)
             {
                for(i = 0+1; i < LBWIDTH-1; i++)
                {
                    img.pixels[(i + j * LBWIDTH) ] = color(0,0,0);
                }
             }             
             
             for(j = 0+1; j < LBHEIGHT-1; j++)
             {
                for(i = 0+1; i < LBWIDTH-1; i++)
                {
                   if (idone[i+j*LBWIDTH]==1)
                   {
                      GetColor(data[j*LBWIDTH+i]);
                      img.pixels[(i + j * LBWIDTH) ] = color(r_sc * 255,g_sc * 255,b_sc * 255);
                   }
                }
             }   
           }             
           
        }
        
      }
   } else
   {
        println("no hit after "+nran+" steps.");
        if (isAni==1) 
        {
         
             for(j = 0+1; j < LBHEIGHT-1; j++)
             {
                for(i = 0+1; i < LBWIDTH-1; i++)
                {
                    img.pixels[(i + j * LBWIDTH) ] = color(0,0,0);
                }
             }             
             k=0;
             khit=0;
             x=x0;
             y=y0;
        }     
   }
   }
   
    if (isCal==0)
    { 
      hsTop.update();
      hsBottom.update();
      hsTop.display();
      hsBottom.display();
   
      vsLeft.update();
      vsRight.update();
      vsLeft.display();
      vsRight.display();
     }
     
   if ((isAni==1 && isCal==1) || isBCchanged==1)
   {
      img.updatePixels();
      image(img,50,50,LBWIDTH*crt_scale,LBHEIGHT*crt_scale);
   }
}

void mouseReleased()
{
  
   if (mouseX >= 5 && mouseX <= 45 &&  mouseY <= 45 && mouseY >= 5)
   {

    HotFinger=0;
    if (isAni==1) 
    {
      isAni=0;
      for(int j = 0; j < LBHEIGHT; j++)
      {
           for(int i = 0; i < LBWIDTH; i++)
           {
               img.pixels[(i + j * LBWIDTH) ] = color(0,0,0);
           }
      }             
      
    } else
    {
      isAni=1;
    } 
    
   } else if (mouseX >= width-50+5 && mouseX <= width-5 &&
    mouseY <= 45 && mouseY >= 5) {

    HotFinger=1;
    exit();
    
   } else if (mouseX >= width-50+5 && mouseX <= width-5 &&
    mouseY > height-45 && mouseY < height) {

    if (isCal==1)
    {
       isCal=0;
    } else
    {
       isCal=1;
    }
    
    color black = color(0, 255, 0);
    fill(black);
    rect(width-50+5, height-50+5, 40, 40, 3, 3, 3, 3);
    textSize(fsize32);
    fill(255, 255, 255);
    text(isCal, width-25-fsize32/2, height-25+fsize32/2); 
    
   } else if (mouseX >= 50 && mouseX <= width-50 &&
    mouseY <= height-50 && mouseY >= 50) {
      
    //println(mouseX/crt_scale);
    //println(mouseY/crt_scale);
    
    Nclick=Nclick+1;
    xc[Nclick]=(mouseX-50)/crt_scale;
    yc[Nclick]=(mouseY-50)/crt_scale;    
    tc[Nclick]=T100;
    if (HotFinger==0) {tc[Nclick]=T0;} 
    if (Nclick>Nmax) {Nclick=Nmax;}
   } 
}
  

class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l,int xstart) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    
    //spos = xpos + swidth/2 - sheight/2;
    spos = xpos- sheight/2+xstart;
    
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return (spos-sposMin)/(sposMax-sposMin)*100.0;
  }
}

class VScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  VScrollbar (float xp, float yp, int sw, int sh, int l, int ystart) {
    swidth = sw;
    sheight = sh;
    int heighttowidth = sh - sw;
    ratio = (float)sh / (float)heighttowidth;
    xpos = xp-swidth/2;
    ypos = yp;
    
    //spos = ypos - swidth/2 + sheight/2;
    spos = ypos - swidth + ystart;
    
    newspos = spos;
    sposMin = ypos;
    sposMax = ypos - swidth + sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseY-swidth/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(xpos, spos, swidth, swidth);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return (spos-sposMin)/(sposMax-sposMin)*100.0;
  }
}
 
// note: points should be added in ascending order
void DelPoint()
{
    c_sc = 0;
    n_sc=6;
}

// note: points should be added in ascending order
void AddPoint(float v, float r, float g, float b)
{
    if (c_sc < n_sc)
    {
        scale[c_sc][0] = v;
        scale[c_sc][1] = r;
        scale[c_sc][2] = g;
        scale[c_sc][3] = b;
        c_sc++;
    }
}

// note: expects scale array to be sorted in ascending order
void GetColor(float v)
{
    int i = 0;
    float w;

    if (v < scale[0][0])
    {
        r_sc = scale[0][1];
        g_sc = scale[0][2];
        b_sc = scale[0][3];
    }
    else if (v > scale[c_sc-1][0])
    {
        r_sc = scale[c_sc-1][1];
        g_sc = scale[c_sc-1][2];
        b_sc = scale[c_sc-1][3];
    }
    else
    {
        for (i = 1; i < c_sc-1; i++)
            if (scale[i-1][0] <= v && v < scale[i][0])
                break;

        // linear interpolation
        w = (v - scale[i-1][0]) / (scale[i][0] - scale[i-1][0]);

        r_sc = (1-w)*scale[i-1][1] + w*scale[i][1];
        g_sc = (1-w)*scale[i-1][2] + w*scale[i][2];
        b_sc = (1-w)*scale[i-1][3] + w*scale[i][3];
    }
}




