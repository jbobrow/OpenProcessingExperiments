
// Shining Particle by harukit
// Created with Processing 68 alpha on September 11 , 2004
// http://www.harukit.com 
int mode =1;
int pNum =3;
PVector [] p = new PVector[pNum];
float rr,gg,bb,dis;
int gain = 5;
PVector[] cc = new PVector[pNum];
int w= 200;
int h= 200;
void setup(){
  size(200,200)  ;
  loadPixels();
  noStroke();
  background(0);
//  for(int i=0;i<pNum;i++){
//    
//  }
  for(int i=0;i<pNum;i++){
   cc[i]= new PVector(r(),r(),r());
    p[i] = newParticle(random(width),random(height),random(0.1,0.3));
  }
  a=createImage(w,h,ARGB);
}
PImage a;
int pass;
float [] star = {.9,.1};
int midx=int(w/2);
int midy = int(h/2);

void draw(){
 if (mode==1){
   mouseX=midx;
    mouseY=midy;
  }
  pass++;
  for(int i=0;i<pNum;i++){
  //  for(int i=0;i<pNum;i++){
   
  if(pass%10==0){
     cc[i]=new PVector(r(),r(),r());
    p[i]=newParticle(random(width),random(height),random(0.1,0.3));
    
  }
   
    update(p[i]);
  }
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
        int pos=y*width+x;
        color col = a.pixels[pos];
        rr = col >> 16 & 0xff;
        gg = col >> 8 & 0xff;
        bb = col  & 0xff;
        for(int i=0;i<pNum;i++){
          dis =dist2(p[i].x,p[i].y,x,y)*4;
          float dis2  = dist(p[i].x,p[i].y,x,y)*2;
          dis = ((dis*star[0])+(dis2*star[1]));
          rr += cc[i].x/dis-gain;
          gg += cc[i].y/dis-gain;
          bb += cc[i].z/dis-gain;
        }
        a.pixels[pos]=color(rr,gg,bb,rr);
    }
  }
 // a.resize(w,h);
 a.updatePixels();
 a.resize(midx,midy);
 a.resize(w,h);
  image(a,0,0);
//a=a.get(0,0,w,h);
}
void mousePressed(){
  
//  for (int i =0;i< pNum;i++){
//  //p[i] = newParticle[i];
//   p[i]=newParticle(random(width),random(height),random(0.1,0.3));
//  }
}
void mouseReleased(){
  for(int i=0;i<pNum;i++){
    cc[i]=new PVector(r(),r(),r());
     p[i]=newParticle(random(width),random(height),random(0.1,0.3));
  }

}

float r(){
 float retval = random(40)+random(40)+random(40)+random(40)+random(40);
 return retval; 
}


PVector  newParticle(float x,float y,float d){
  PVector retval = new PVector(x,y,d);
  return retval;
  }
  void update(PVector i){
    i.x += (mouseX-i.x)*i.z;
    i.y += (mouseY-i.y)*i.z;
}

float dist2(float x1,float y1,float x2,float y2){
  

  float A= abs(x2-x1);
  float B = abs(y2-y1);
  float Ax = (A+B)/A;
  float Bx = (A+B)/B;
//  float retval = (A+B)*Ax;
// float  retval = sq(Ax+Bx); //X band gain-dis
 float  retval = sq(Ax-Bx); //X band
  return retval;
}

float dist3(float x1,float y1,float x2,float y2){
  

  float A= abs(x2-x1);
  float B = abs(y2-y1);
  float Ax = A*A;
  float Bx = B*B;
  float retval = sqrt(Ax+Bx);
  return retval;
}


void keyPressed(){
 if (key=='1')mode=1;
  if (key=='2')mode =2;
}               
