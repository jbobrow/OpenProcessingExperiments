
int w = 255;
int h = 255;
int all = w*h;
PVector [][] v = new PVector [all][2];


PImage a;
void setup(){
  size(255,255);
  a=createImage(w,h,ARGB);

  for (int q=0;q<w;q++){
    for (int e =0;e<h;e++){
      int pos = q+w*e;
      float rr = w-q;
      float gg = e;
      float bb = h-e;
      float aa = dist(w/2,h/2,q,e);
      a.pixels[pos]=color(rr,gg,bb,aa);
      v[pos][0]=new PVector (a.pixels[pos],a.pixels[pos]*-1,color(rr/3+gg/3+bb/3));
      v[pos][1]=new PVector (rr,gg,bb);
    } 
  }

}
int mode=0;
void keyPressed(){
  if(key=='a')mode=0; 
  if(key=='r')mode=1; 
  if(key=='g')mode=2; 
  if(key=='b')mode=3; 
  if(key=='0')mode=4; 

}
void draw(){
  //if (mode==4){

  for (int q=0;q<w;q++){
    for (int e =0;e<h;e++){
      int pos = q+w*e;

      if (mode==4) set(q,e,int(v[pos][0].x));
      if (mode==0) set(q,e,int(v[pos][0].y));
      if (mode==1) set(q,e,int(v[pos][0].z));
      if (mode==2) set(q,e,color(v[pos][1].x,v[pos][1].y,v[pos][1].z  ));
    }
  }

  //}


}
                
