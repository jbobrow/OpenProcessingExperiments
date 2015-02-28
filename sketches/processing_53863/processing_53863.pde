
//Pittsburgh and Barbados Blend

float [] R = new float [2];
PImage [] both  = new PImage[7];
PImage bds;
PImage redbds;
PImage pit;
PImage redpit;
PImage pitleft;
PImage pitright;
int w;
int h;

PImage base;
void setup(){
   size(958,638,P3D);
  R[0]=.5;
  R[1]=.5;
  bds = loadImage("barbados.png");
  redbds = loadImage("redbarbados5.png");
  pit = loadImage("redpittsburgho.png");
  redpit = loadImage("redpittsburgh.png");
  pitleft=loadImage("redpittsburgho.png");
  pitright=loadImage("redpittsburgho.png");
  w= pitleft.width;
  h=pitleft.height;
  //  bds.resize(w,h);
  //  pit.resize(w,h);
  //  pitleft.resize(w,h);
  //  pitright.resize(w,h);

  for (int x =0;x<7;x++){
    both[x]= createImage(w,h,ARGB);
    if (x==1)both[x]=blendx(bds,pit);
    if (x==2)both[x]=blendx(bds,pitright);
    if (x==3)both[x]=blendx(bds,pitleft);
    if (x==5)both[x]=mix(pitright,bds,redbds);
    // if (x==4)both[x]=lessen(bds,pitleft);
  }

 
  background(255);
  image(bds,0,0);
  image(pitright,w,0);
  image(both[0],0,h);
  image(redbds,w,h);
  image(both[5],0,h);
}
void keyReleased(){
  // background(255);
  image(bds,0,0);
  image(pitright,w,0);
  image(redbds,w,h);
  if(key=='1')image(both[0],0,h);
  if(key=='2')image(both[1],0,h);
  if(key=='3')image(both[2],0,h);
  if(key=='4'){
    image(bds,0,h);
    // lessen(bds,pitright,0,h);

  }
  if(key=='5')image(both[5],0,h);
}
void draw(){

}


void lessen(PImage a,PImage b,int xloc, int yloc){
  PImage retvala = createImage(a.width,a.height,ARGB);
  PImage retvalb = createImage(a.width,a.height,ARGB);
  for (int i =0;i<a.pixels.length;i++){
    color A= a.pixels[i];
    color B= b.pixels[i];

    float a1 =128;
    float a2 = 128;
    float r1 = A>> 16 & 255;
    float r2 = B>> 16 & 255;

    float g1 = A>> 8 & 255;
    float g2 = B>> 8 & 255;

    float b1 = A& 255;
    float b2 =B & 255;


    retvala.pixels[i]=color(r1,g1,b1,a1);
    retvalb.pixels[i]=color(r2,g2,b2,a2);
  }

  // image (retvala,xloc,yloc);
  image (retvalb,xloc,yloc);

}
PImage mix(PImage a,PImage b,PImage src){
  a.resize(src.width,src.height);
  b.resize(src.width,src.height);
  PImage retval = createImage(a.width,a.height,ARGB);
  color C = src.pixels[0];
  for (int i =0;i<src.pixels.length-1;i++){
    color Cx = src.pixels[i];
    color Cr = redpit.pixels[i];
    color A = a.pixels[i];
    color B = b.pixels[i];

    if(Cx==C){
      retval.pixels[i]=A; 

      //       if (Cr==C){
      //        retval.pixels[i]=B; 
      //      }

    }
    else
    {
      if (Cr==C){
        retval.pixels[i]=B; 
      }
      else
      {  
        retval.pixels[i]=B; 
      }
    }

  }
  color base = a.pixels[0];

  return retval; 
}

PImage blendx(PImage a,PImage b){
  PImage retval = createImage(a.width,a.height,ARGB);
  for (int i =0;i<a.pixels.length;i++){
    color A= a.pixels[i];
    color B= b.pixels[i];
    float r1 = A>> 16 & 255;
    float r2 = B>> 16 & 255;

    float g1 = A>> 8 & 255;
    float g2 = B>> 8 & 255;

    float b1 = A& 255;
    float b2 =B & 255;

    retval.pixels[i]=color(((r1*R[0])+(r2*R[1])),
    ((g1*R[0])+(g2*R[1])),
    ((b1*R[0])+(b2*R[1])));
    if (A>B){
      retval.pixels[i]=A;
    }
    else
    {
      retval.pixels[i]=color(((r1*R[0])+(r2*R[1])),
      ((g1*R[0])+(g2*R[1])),
      ((b1*R[0])+(b2*R[1])));
    }

  }  
  //  retval.blend(b,0,0,w,h,0,0,w,h,DARKEST);
  //  retval.blend(a,0,0,w,h,0,0,w,h,DARKEST);
  return retval; 
}




