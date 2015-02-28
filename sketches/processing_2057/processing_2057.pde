
import controlP5.*;
ControlP5 controlP5;

    String input = "";
    int grauvalue = 200;
    int blurvalue = 4;

    boolean boolblur = true; 
    String[] fontList = { "Serif", "SansSerif", "Monospaced", "ACaslonPro-Regular", "AGaramondPro-Regular", "AkzidenzGroteskBE-Md", "AmericanTypewriter", "AvenirLT-Medium", "Baskerville", "Bauhaus93", "BetonEF-DemiBold", "ComicSansMS", "Copperplate", "Courier", "Didot", "Futura-Medium", "Garamond", "GillSans", "Helvetica", "HoeflerText-Regular", "Impact", "LunaITC-Regular", "MinionPro-Medium", "MyriadPro-Regular", "OCRAStd", "Optima-Regular", "Palatino-Roman", "Papyrus", "Rockwell", "Symbol", "Tahoma", "Times-Roman", "TradeGothicLT", "TrebuchetMS", "UniversLT", "Verdana", "ZapfDingbatsITC", "Zapfino" };
    int fontnr = 0;
    PImage c;
    
void setup ()
{
    size( 700, 170 );
    fill( 0 );                              
    smooth();
    input = "TYPE HERE";

    println(fontList);
      controlP5 = new ControlP5(this);
      controlP5.addSlider("grauvalue",10,245,150,10,22,20,100);
      controlP5.addSlider("blurvalue",0,15,3,35,22,20,100);
      controlP5.addButton("treshhold",10,35,130,20,20);
      controlP5.addButton("font",10,10,130,20,20);

}
void treshhold(){
 boolblur = !boolblur; 
}

void font(){
fontnr++;
if (fontnr == fontList.length) fontnr = 0;
}

void draw ()
{   
    frameRate(25);
    background(255);    
    textAlign(CENTER);
    PFont fnt = createFont( fontList[fontnr], 70 );
    textFont( fnt );   
    fill (0);    
    text( input, 30, 25, width-10, height-10 ); 
    tontrennung();    
}

void tontrennung(){
  c = get();
  fastblur(c,blurvalue);
  image(c, 0, 0);
    if (boolblur) {
    float c1 = 0;
    for (int i = 0; i<width; i++){
        for (int j = 0; j<height; j++){
            c1 = red( get(i, j) ); 
            if (c1 < grauvalue) {
                stroke (0);
                point (i,j);
            }
            else {
                stroke (255); 
                point (i,j);
            } 
        }
    }
}
}
void keyPressed ()              
{
    if ( key == BACKSPACE || key == DELETE )  
    {
         if (input != null && input.length() > 0 )   
         {
             input = input.substring(0,input.length()-1);  
         }
    }
    else if ( key != CODED )                  
    {
        input += key;                         
    }
}

// Stack Blur Algorithm by Mario Klingemann <mario@quasimondo.com>
void fastblur(PImage img,int radius){

  img.loadPixels();
  
  if (radius<1){
    return;
  }
  int[] pix=img.pixels;
  int w=img.width;
  int h=img.height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=radius+radius+1;

  int r[]=new int[wh];
  int g[]=new int[wh];
  int b[]=new int[wh];
  int rsum,gsum,bsum,x,y,i,p,yp,yi,yw;
  int vmin[] = new int[max(w,h)];

  int divsum=(div+1)>>1;
  divsum*=divsum;
  int dv[]=new int[256*divsum];
  for (i=0;i<256*divsum;i++){
    dv[i]=(i/divsum);
  }

  yw=yi=0;

  int[][] stack=new int[div][3];
  int stackpointer;
  int stackstart;
  int[] sir;
  int rbs;
  int r1=radius+1;
  int routsum,goutsum,boutsum;
  int rinsum,ginsum,binsum;

  for (y=0;y<h;y++){
    rinsum=ginsum=binsum=routsum=goutsum=boutsum=rsum=gsum=bsum=0;
    for(i=-radius;i<=radius;i++){
      p=pix[yi+min(wm,max(i,0))];
      sir=stack[i+radius];
      sir[0]=(p & 0xff0000)>>16;
      sir[1]=(p & 0x00ff00)>>8;
      sir[2]=(p & 0x0000ff);
      rbs=r1-abs(i);
      rsum+=sir[0]*rbs;
      gsum+=sir[1]*rbs;
      bsum+=sir[2]*rbs;
      if (i>0){
        rinsum+=sir[0];
        ginsum+=sir[1];
        binsum+=sir[2];
      } else {
        routsum+=sir[0];
        goutsum+=sir[1];
        boutsum+=sir[2];
      }
    }
    stackpointer=radius;

    for (x=0;x<w;x++){

      r[yi]=dv[rsum];
      g[yi]=dv[gsum];
      b[yi]=dv[bsum];
      
      rsum-=routsum;
      gsum-=goutsum;
      bsum-=boutsum;

      stackstart=stackpointer-radius+div;
      sir=stack[stackstart%div];
      
      routsum-=sir[0];
      goutsum-=sir[1];
      boutsum-=sir[2];
      
      if(y==0){
        vmin[x]=min(x+radius+1,wm);
      }
      p=pix[yw+vmin[x]];
      
      sir[0]=(p & 0xff0000)>>16;
      sir[1]=(p & 0x00ff00)>>8;
      sir[2]=(p & 0x0000ff);

      rinsum+=sir[0];
      ginsum+=sir[1];
      binsum+=sir[2];

      rsum+=rinsum;
      gsum+=ginsum;
      bsum+=binsum;
      
      stackpointer=(stackpointer+1)%div;
      sir=stack[(stackpointer)%div];
     
      routsum+=sir[0];
      goutsum+=sir[1];
      boutsum+=sir[2];
     
       rinsum-=sir[0];
      ginsum-=sir[1];
      binsum-=sir[2];
     
       yi++;
    }
    yw+=w;
  }
  for (x=0;x<w;x++){
    rinsum=ginsum=binsum=routsum=goutsum=boutsum=rsum=gsum=bsum=0;
    yp=-radius*w;
    for(i=-radius;i<=radius;i++){
      yi=max(0,yp)+x;
     
       sir=stack[i+radius];
      
      sir[0]=r[yi];
      sir[1]=g[yi];
      sir[2]=b[yi];
     
      rbs=r1-abs(i);
      
      rsum+=r[yi]*rbs;
      gsum+=g[yi]*rbs;
      bsum+=b[yi]*rbs;
     
      if (i>0){
        rinsum+=sir[0];
        ginsum+=sir[1];
        binsum+=sir[2];
      } else {
        routsum+=sir[0];
        goutsum+=sir[1];
        boutsum+=sir[2];
      }
      
      if(i<hm){
        yp+=w;
      }
    }
    yi=x;
    stackpointer=radius;
    for (y=0;y<h;y++){
      pix[yi]=0xff000000 | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum];

      rsum-=routsum;
      gsum-=goutsum;
      bsum-=boutsum;

      stackstart=stackpointer-radius+div;
      sir=stack[stackstart%div];
     
      routsum-=sir[0];
      goutsum-=sir[1];
      boutsum-=sir[2];
     
       if(x==0){
        vmin[y]=min(y+r1,hm)*w;
      }
      p=x+vmin[y];
      
      sir[0]=r[p];
      sir[1]=g[p];
      sir[2]=b[p];
      
      rinsum+=sir[0];
      ginsum+=sir[1];
      binsum+=sir[2];

      rsum+=rinsum;
      gsum+=ginsum;
      bsum+=binsum;

      stackpointer=(stackpointer+1)%div;
      sir=stack[stackpointer];
     
      routsum+=sir[0];
      goutsum+=sir[1];
      boutsum+=sir[2];
      
      rinsum-=sir[0];
      ginsum-=sir[1];
      binsum-=sir[2];

      yi+=w;
    }
  }
  img.updatePixels();
}

