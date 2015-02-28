
public boolean firststart = false;
public boolean mirror = true;
public boolean pause = false;
public int beforemode=0;
public int rmode = 4;
public int w = 150;
public int h = 150;
public color []ar;
public color [] br;
public color [] cr;
PImage a;
PImage b;
PImage c;
PImage d;
PImage src;
PImage src2;
 PImage _A;
public int rr;
public color n;
void setup(){
  size(150,150,P2D);
 // _A= createImage(w,h,ARGB);

 // n = _A.pixels[0];
  ar = new color[w*h];
  br = new color[w*h];
  cr = new color[w*h];
 
  //only required for when  rmode = '4'
  a=  createImage(w,h,ARGB);
  b =  createImage(w,h,ARGB);
  c =  createImage(w,h,ARGB);
  d =  createImage(w,h,ARGB);
  src =  createImage(w,h,ARGB);
  //loadPixels();
  //src.loadPixels();
 
 
}
void draw(){
 // image (_A,0,0);
  
 
  if (rmode==4){
    if (firststart){
      arraycopyx(src.pixels,a.pixels);
 
      firststart = false;
    }
    else
    {
 
      arraycopyx(src.pixels,a.pixels);
 
      arraycopyx(a.pixels,b.pixels);
 
      b.filter(INVERT);
 
      imagex(b,mouseX,mouseY);  

    }
 //_A=get();
 for (int x=0;x<w;x++){
   for (int y=0;y<h;y++){
  //   _A.set(x,y,get(x,y));
     src.set(x,y,get(x,y));
   }
 }
   // arraycopyx(_A.pixels,src.pixels);
  }

 //image (_A,0,0);
  if (mirror) flowermirror();
}
 
public color ff;
void brget(int x,int y){
  if ((y+width*x) < br.length){
    ff = br[y+width*x];
  }
}
 
 
void flowermirror(){
 
  for (int x=0;x<=width;x++){
    for (int y=0;y<height;y++){
 
      set(x,y,get(x,y));
      set(width-x,y,get(x,y));
      set(y,width-x,get(x,y));
      set(y,x,get(x,y));
 
    }
  }
}
 
void keyPressed(){
  if (key=='S' || key =='s' && !online){
    rr++;
    save("sift-"+str(rr)+".png");
 
  }
 
  if (key=='m' ||key =='M'){
    mirror = !mirror;
  } 
  if (key=='c'){
    background(n);
  }
 
  if (key=='0' || key =='p'){
 
    pause=!pause;
    if (pause)
    { 
      beforemode = rmode;
      rmode =0;
    }
    if (!pause) rmode= beforemode;
  }
  if (key=='1'){
    background(n);
    rmode =1;
    beforemode = rmode;
  }
  if (key=='2')
  {
    background(n);
    rmode =2;
    beforemode = rmode;
  }
 
  if (key=='3')
  {
    //frameRate(10);
    background(n);
    rmode =3;
    beforemode = rmode;
  }
 
  if (key=='4')
  {
    //frameRate(10);
    background(n);
    rmode =4;
    beforemode = rmode;
  }
 
}

void arraycopyx(int []a , int [] b ){
 for (int x=0;x<a.length;x++){
  b[x]=a[x];
 } 
}

void arraycopyx2(PImage a, int [] b ){
 for (int x=0;x<a.width*a.height;x++){
  b[x]=a.pixels[x];
 } 
}

void arraycopyx3(PImage a, PImage b ){
 for (int x=0;x<a.width*a.height;x++){
  b.pixels[x]=a.pixels[x];
 } 
}

void arraycopyx4(color [] a, PImage b ){
 for (int x=0;x<b.width*b.height;x++){
  b.pixels[x]=a[x];
 } 
}

void imagex(PImage img,int xloc, int yloc){
   for (int x=xloc;x<width-xloc;x++){
  for (int y=yloc;y<height-yloc;y++){
  set(x,y,img.get(x,y));
 }
  }
  
}
