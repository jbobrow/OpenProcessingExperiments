

int IMGHEIGHT;
int IMGWIDTH;
int BIGIMGHEIGHT;
int BIGIMGWIDTH;
int q=16;
float size1;
float size2;
float opacity1;
float opacity2;
boolean put;
boolean c;
boolean po;

PImage snippet;

String dir=new String();


int method;
PImage img = new PImage();

void setup() 
{
  put=false;
  dir="powerlines";
  method=BLEND;
  po=false;
  c=false;


  size1=.5;
  size2=1;
  opacity1=128;
  opacity2=255;


  IMGHEIGHT=180;
  IMGWIDTH=240;
  BIGIMGHEIGHT=480;
  BIGIMGWIDTH=640;
  frameRate(30);

  size(BIGIMGWIDTH,BIGIMGHEIGHT);
  
  background(color(255,255,255));
 
}
void draw()
{

   if (c){
     filter(GRAY);
   }
   

   
   if (po){
      filter(POSTERIZE,8);
   }
   
  
      
    
}
void showPic(int count){
  
     int n=count;
     float s;
     int x;
     
     int y;
     String p;
     PImage bg = createImage(BIGIMGWIDTH, BIGIMGHEIGHT, RGB);
     for(int i=0;i<n;i++){
     
      bg.loadPixels();
      loadPixels();
      bg.pixels=pixels;

      s=random(size1,size2);
     

       p=str(int(random(q)+1));  
       img = loadImage(dir+"/"+p+".jpg");
       x=mouseX+int(random(-1*BIGIMGWIDTH/4,BIGIMGWIDTH/4));
       y=mouseY+int(random(-1*BIGIMGHEIGHT/4,BIGIMGWIDTH/4));
       if(x + s*IMGWIDTH > BIGIMGWIDTH){
         x=x-int(s*IMGWIDTH);
      }
       if(y + s*IMGHEIGHT > BIGIMGHEIGHT){
         y=y-int(s*IMGHEIGHT);
       }
     
      bg.blend( img, 0,0,IMGWIDTH,IMGHEIGHT ,x,y, int(s*IMGWIDTH),int(s*IMGHEIGHT),method);
      bg.updatePixels();
      tint(255,255,255,int(random(opacity1,opacity2)));
      image(bg, 0, 0);
      if (c){
          filter(GRAY);
      }
      if (po){
          filter(POSTERIZE,8);
      }
       
   }
      
 }
void mousePressed(){
  if (put){
    set(mouseX,mouseY, snippet);
  }
  else{
    snippet=get(mouseX,mouseY, int(random(100,300)),int(random(100,300)));
  }
    put=!put;
}

 void keyPressed()
{
 
    if ( key == 'q' ){
     opacity1=opacity1*.9;
     opacity2=opacity2*.9; 
    }
    if ( key == 'w' ){
     opacity1=opacity1*1.1;
     opacity2=opacity2*1.1; 
    }
    if ( key == 'e' ){
     size1=size1*.9;
     size2=size2*.9; 
    }
    if ( key == 'r' ){
     size1=size1*1.1;
     size2=size2*1.1; 
    }

    if ( key == 'c' ) c=!c;
    if ( key == 'b' ) filter(BLUR,1);
    if ( key == 'x' ) po=!po;
    if ( key == 'm' ) filter(ERODE);
    if ( key == 'n' ) filter(DILATE);
    if ( key == 'v' ){filter(INVERT);}
    
    if ( key == '0' ) setup();
    
    if (int(key)>=49 && int(key)<=57){
      showPic(int(key)-48);
    }
    
    if ( key == 'a' ) method=BLEND;
    if ( key == 's' ) method=SOFT_LIGHT;
    if ( key == 'd' ) method=HARD_LIGHT;
    if ( key == 'f' ) method=DODGE;
    if ( key == 'g' ) method=BURN;
    if ( key == 'h' ) method=DARKEST;
    if ( key == 'j' ) method=LIGHTEST;
    if ( key == 'k' ) method=DIFFERENCE;
    if ( key == 'l' ) method=OVERLAY;
    
    if ( key == 't' ) dir="dandelions";
    if ( key == 'y' ) dir="childhood";
    if ( key == 'u' ) dir="kalilily";
    if ( key == 'i' ) dir="powerlines";
    
    //if ( key == ' ' ) save(str(millis())+".jpg");
}

