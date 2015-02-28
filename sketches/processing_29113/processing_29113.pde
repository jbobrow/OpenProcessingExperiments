
int w= 256;
int h= 256;
int wd=w;
int ht = h;
void setup(){
 o  =loadImage("http://3.bp.blogspot.com/-KxzdflD1X2M/TdQDKNUYgpI/AAAAAAAAASI/CUeiJqRAY_g/s400/rest.png");
  size(w,h,P2D);
  background(-1);
 smooth();
  
}
//float ink;
void draw(){
 
  
  w=mouseX;
  h=mouseY;
  if (w<64)w=64;
  if(h<64)h=64;
// background(-1);
fill(-1);
rect(0,0,wd,ht);
 //stroke(1,91);
//for (int x = 0;x<w;x+=4){
// line(0,x,w,x);
// line(0,x,x,0);
// line(x,0,x,h);
//}
 
stroke(1,11);

 //line(w,h-x,0,x);
 
for (int x = 0;x<w;x+=1){
   line(0,h-x,x,0); //normal
   line(0,x,x,h);
  line(w,h-x,w-x,0) ; //reverse of normal
  line(x,h,w,h-x);
  
  line(0,x,x,w-x); //flipside
  line(x,x,0,w-x);//reverse
  
  line(x,h-x,w,x); //cool
 line(w-x,h-x,w,x); //opposite
 
 
  //line(x-ink,h-x-ink,w-ink,x-ink);
  
}
}


PImage o;

int maxx= 233;
int ink=1;



void  readmotion(){
  
 
  color c = o.pixels[ink];
  int r = cr(c);
  int gg = cg(c);
  fill(255,0,0);
  mouseX=r;
  mouseY=gg;

  ink++;
 if (ink>233)ink=1; 
 
}

int ca(color col){
return col >> 24 & 0xff;
 }

int cr(color col){
return col >> 16 & 0xff;
 }
 int cg(color col){
  return col >> 8 & 0xff;
 }      
 int cb(color col){
  return col  & 0xff;
 }
        
