
   // Shining Particle by harukit
// Created with Processing 68 alpha on September 11 , 2004
// http://www.harukit.com 


int pNum =4;
Particle[] p = new Particle[pNum];
float [] ppx = new float [pNum];
float [] ppy = new float [pNum];
public boolean constant = false;
float rr,gg,bb,dis;
int gain = 5;
float[] cc = new float[3];
PImage a;
void setup(){
  size(100,100);
  a=createImage(width,height,ARGB);
  noStroke();
  loadPixels();
  //background(0);
 // a=get();
  for(int i=0;i<3;i++){
   cc[i]=random(20)+random(40)+random(40)+random(40)+random(40);
   // cc[i]=color(random(400),random(400),random(400));
  }
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(width),random(height),random(0.1,0.3));
  }
   for (int x=0;x<ppx.length;x++){

  
    ppx[x]=width/2;
    ppy[x]=height/2;
   
  }
}
public int inc= 0;
public float degree=0;
float diam = 2;
float vick = .1;
void draw(){
image(a,0,0);
  degree+=.1;
  circle(width/2,height/2,degree,diam);
// ppx[inc]=mouseX;
 //ppy[inc]=mouseY;
  mouseX=(int)ppx[inc];
  mouseY=(int)ppy[inc];
  if (!constant)if (inc<ppx.length-1)inc++;
 
  if (constant) inc++;
 
  if (inc >ppx.length-1)inc=0;
   
 
  if (pmouseX==mouseX && !constant)
  {
    inc=0;
  }
  for (int x=1;x<ppx.length-1;x++){
   ppx[x]=ppx[0];
  ppy[x]=ppy[0]; 
  }
 
 if (degree>6.2)degree=0;
 loopx(); 
 diam+=vick;
 if(diam>width/2){
   diam=2;
  mouseReleased(); 
 }
 if (vick>10)vick=.1;
// a.copy(g,0,0,width,height,0,0,width,height);
}
void loopx(){
  for(int i=0;i<pNum;i++){
    p[i].update();
  }
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
        int pos=y*width+x;
        color col = a.pixels[pos];
        rr = col >> 16 & 0xff;
        gg = col >> 8 & 0xff;
        bb = col  & 0xff;
        for(int i=0;i<pNum;i++){
       // dis =dist(p[i].xpos,p[i].ypos,x,y)/2;
        //  dis = fast3Dist(p[i].xpos,p[i].ypos,0,x,y,0);
          dis = fast2Dist(p[i].xpos,p[i].ypos,x,y);
          //dis = int(dis/8);
          rr += cc[0]/dis-gain;
          gg += cc[1]/dis-gain;
          bb += cc[2]/dis-gain;
        }
        a.pixels[pos]=color(rr,gg,bb,rr);
    }
  }
  image(a,0,0);
}

void mousePressed(){
 // background(0);
  Particle[] p = new Particle[pNum];
}

void mouseReleased(){
  for(int i=0;i<3;i++){
    //cc[i]=color(random(255),random(255),random(255));
    random(20)+random(40)+random(40)+random(40)+random(40);
  }
//  background(0);
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(width),random(height),random(0.1,0.3));
  }
}

class Particle{
  float xpos,ypos,del;
  Particle(float x,float y,float d){
    xpos=x;
    ypos=y;
    del = d;
  }
  void update(){
    xpos += (mouseX-xpos)*del;
    ypos += (mouseY-ypos)*del;
  }
}

   
   
   
    float fast3Dist( float x1, float y1, float z1, float x2, float y2, float z2 )
    {
      float fdist = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1);
      return fdist;
    } 
    
      float fast2Dist( float x1, float y1, float x2, float y2)
    {
      float fdist = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1);
      return fdist;
    } 
    
    void circle(float startx,float starty, float angle,float distance){

  float endx = startx + cos(angle) * distance;
  float endy = starty + sin(angle) * distance;
  
 ppx[inc]=endx;
  ppy[inc]=endy;
  //stroke(startx,endx);
 // vertex(endx,endy,0,endx,endy);
} 
