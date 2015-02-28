
//Point_intersect
//Owaun Scantlebury
//November 17th 2010


int w= 255;
int h = 255;
PGraphics a,b;
PImage c,d;
void setup(){
  size(255,255); 
  a = cg(w,h);
  b= cg(w,h);
  c=createImage(w,h,ARGB);
  d=createImage(w,h,ARGB);
  B= new color[b.width*b.height];
  A= new color[a.width*a.height];

  lp(a);
  lp(b);
  bd(a);
  bd(b);
  a.smooth();

  for (int x=25;x<width-25;x++)
  {
    setx(a,x,25,color(255,0,0,val),"r");
 
    setx(a,x,height-25,color(255,0,0,val),"r");
  
    setx(a,25,x,color(255,0,0,val),"r");

    setx(a,width-25,x,color(255,0,0,val),"r");


    setx(b,x+15,25-15,color(0,0,255,val),"b");
    //a.set(x,height-25,color(0,0,255,255));
    setx(b,x+15,height-25-15,color(0,0,255,val),"b");

    setx(b,25+15,x-15,color(0,0,255,val),"b");

    setx(b,width-25+15,x-15,color(0,0,255,val),"b");
  }
  up(a);
  up(b);
  ed(b);
  ed(a);
  image(a,0,0);  
  background(128);
  background(128);
  image(b,0,0);

  arraycopy(a.pixels,c.pixels);
  arraycopy(b.pixels,d.pixels);
  arraycopy(a.pixels,A);
  arraycopy(b.pixels,B);
  loadPixels();
}
public color [] A;
public color [] B;
void draw(){

  background(128);
  lp(a);
  lp(b);
  bd(a);
  bd(b);

  a.copy(c,0,0,w,h,0,0,w,h);
  b.copy(d,0,0,w,h,0,0,w,h);

  a.noFill();
  a.stroke(255,0,0,val);
  a.ellipse(mouseX,mouseY,60,60);

  a.stroke(0,255,0,val);
  a.ellipse(mouseX,mouseY,120,120);

  b.noFill();
  b.stroke(255,0,255,val);
  b.ellipse(mouseX,mouseY,30,30);
  b.stroke(0,255,0,val);
  b.ellipse(mouseX,mouseY,120,120);
  ed(b);
  ed(a); 
  up(a);
  up(b);

  image(a,0,0);

  image(b,0,0);
  checkit();
}

PGraphics cg(int w, int h){
  PGraphics  retval = createGraphics(w,h,JAVA2D);

  return retval;
}
void bd(PGraphics img){
  img.beginDraw(); 

}

void ed(PGraphics img){
  img.endDraw(); 
}

void lp(PGraphics img){
  img.loadPixels(); 
}

void up(PGraphics img){
  img.updatePixels(); 
}
int val = 256;
void setx(PGraphics  a,int x,int y,color col,String in){
  color retval = 0;
  color src = a.pixels[x+a.width*y];
  color rr1 = _fr2(col);
  color rr2 = _fr2(src);
  color gg1 = _fg2(col);
  color gg2 = _fg2(src);
  color bb1 = _fb2(col);
  color bb2 = _fb2(src);

  if (in=="r")retval = color(rr1,gg2,bb2,val);
  if (in=="g")retval = color(rr2,gg1,bb2,val);
  if (in=="b")retval = color(rr2,gg2,bb1,val);


  a.pixels[x+a.width *y]=retval;
}

color _fr2(color colx){ 
  return  colx >> 16 & 0xff;
}
color _fg2(color colx) { 
  return  colx >> 8 & 0xff;
}
color _fb2(color colx){
  return    colx  & 0xff;
}

void checkit(){
  for (int x=0;x<a.pixels.length;x++){
    int _y=(int)x/width;
    int _x= x-(_y*width);
    color c1 = a.pixels[x];
    color c2  = b.pixels[x];
    float rr=_fr2(c1);
    float bb= _fb2(c2);
    float gg1= _fg2(c1);
    float gg2= _fg2(c2);

    if ((rr+bb)>255 || (rr+gg1) > 255 || (bb+gg1)>255 || (bb+gg2)>255 || (rr+gg2)>255) {
      noFill();
      ellipse(_x,_y,6,6); 
    }
  } 
}



