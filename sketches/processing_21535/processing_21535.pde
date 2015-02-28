
int hand = 25;
public float [] karlx = new float [hand];
public float []karly= new float [hand];
public float [] karlz= new float [hand];
public float [] karlax = new float [hand];
public float []karlay= new float [hand];
public float [] karlaz= new float [hand];
PImage a,b,c;
void setup(){
  size(255,255);
frameRate(3000);
  a=createImage(width,height,ARGB);
  b=createImage(width,height,ARGB);
  c=createImage(width,height,ARGB);
  c.resize(width,height);
  for (int x=0;x<hand;x++){
    karlx[x]=x*10;
    karly[x]=x*10;
    karlz[x]=x*10; 
    karlax[x]=width-x*10;
    karlay[x]=height-x*10;
    karlaz[x]=(width+height)- x*10; 
  }
  noStroke();
  // a=get();
}
int inc=0;
boolean forward = false;
int mode =1;
void draw(){
  if (mode==1)drawa();
  if(mode==2)drawb();
}
float by;
public color nowcolor;
void drawb(){
  imageMode(3);
  translate(width/2,height/2);
  rotate(radians(by));
 // if (by>0 && by<90)nowcolor=color(255,0,0);//11
  //if(by>90 && by<180)nowcolor=color(0,255,0);//11
  //if(by>180&& by<270)nowcolor= color(0,0,255);//11
  //if(by>270)nowcolor= color(255,0,255);//11
   if(by%30==0)nowcolor= color(255*random(0,1),255*random(0,1),255*random(0,1));
  for (int i=30;i<60;i+=1){
    b.set( i,21,nowcolor);//1
   b.set( i,22,nowcolor);//2
    b.set( i,23,nowcolor);//3
  }
b.filter(BLUR,1);
  image(b,0,0);
  by+=1;
  if(by>360)by=0;
}
void drawa(){
  if(forward)mouseX=(int)karlx[inc];
  if(!forward)mouseX=width-(int)karlx[inc];
 
  mouseY=(int)karly[inc];
  inc++;
  if(inc>hand-1){
    forward = !forward;
    inc=0;
    
   
      b  = createImage(255,30,ARGB);
    for (int i=30;i<60;i+=1){
      b.set( i,21,c.get(i,i));
      b.set( i,22,c.get(c.width-i,c.height-i));
      b.set( i,23,color(255,0,0));
    }
    
     background(1);
    mode=2;
  }
 
}
color ca(color colx){ 
  return  colx >>24 & 0xff;
}
color cr(color colx){ 
  return  colx >> 16 & 0xff;
}
color cg(color colx) { 
  return  colx >> 8 & 0xff;
}
color cb(color colx){
  return    colx  & 0xff;
}
                                
