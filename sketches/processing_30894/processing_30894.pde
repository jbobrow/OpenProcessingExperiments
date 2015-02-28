
void bottomofsetup(){
  popy = new float [pNum][2];
}
void endofdraw(){
  if(!animate) firstpassvv=false;
if(animate)firstpassvv=true;
//inca++;
water.copy(g,0,0,w,w,0,0,w,w);
//if(inca>pop.length)inc=0;
}
public float [][] popy; 
public float _x_,_y_;
void topofdraw(){
   //pop[inca]=color(mouseX,mouseY,255);
   popy[inca][0]=mouseX;
   popy[inca][1]=mouseY;
    if (!constant)if (inca<pop.length-1)inca++;
 
  if (constant) inca++;
 
  if (inca >pop.length-1)inca=0;
   
 
  if (pmouseX==mouseX && !constant)
  {
    inca=0;
  }
 
  for (int x=0;x<pop.length-1;x++){
    _x_=popy[x][0];
    _y_=popy[x][1];
   // _x_ =pop[x]  >> 16 & 0xff;
   // _y_ = pop[x] >> 8 & 0xff;
   
 
   
    p[x].xpos=_x_;
    p[x].ypos=_y_;
  }
  image(water,0,0);
}

void pgsave(int [] src,String where){
PGraphics pg=createGraphics(w,w,P3D);
pg.loadPixels();
pg.beginDraw();
for (int i=0;i<pg.pixels.length;i++){
 int kk = src[i];
// if (kk<0)kk = color(int(kk/255)*-1,(kk%255)*-1,1);
//if(kk>0)kk= color(int(kk/255),kk%255,0); 
//if (kk<0)
pg.pixels[i]=put(kk);
///works
//if (kk<0)pg.pixels[i]=color(int(kk/255)*-1,(kk%255)*-1,1);
//if(kk>0)pg.pixels[i]=color(int(kk/255),kk%255,0);
//
 // pg.pixels[i]=kk;
}

pg.endDraw();
pg.updatePixels();
  if (where!=null)pg.save(where);
}
 int put(int  kki){
   int retvalx = 0;
    if(kki<0)retvalx=color(int(kki/255)*-1,(kki%255)*-1,1);
    if(kki>0)retvalx=color(int(kki/255),kki%255,0);
   return retvalx;
   
 }

void imgextract(PImage img,int [] target){
//  if (img.pixels.length==target.length){
  //img.filter(BLUR,14);
  //img.mask(register);
  //int pain = 0;
img.blend(register,0,0,w,w,0,0,w,w,OVERLAY);//method 1
  // println("Match!!");
 for (int i=0;i<img.pixels.length;i++){
  color c = img.pixels[i];
  
 // color paw = register.pixels[i];
//  float rr= cr(paw);
 // float gg = cg(paw);
 // float bb = cb(paw);
 // color cx = int(c+((rr+gg+bb)/3));
//color cx=blendColor(c,paw,SOFT_LIGHT);//method 2
  //if (paw>255/2)pain = 128;
  // if (paw<255/2)pain = -128 ;
//  target[i]=extract(c+pain); 
    target[i]=extract(c);
 }
 // }
  
}

