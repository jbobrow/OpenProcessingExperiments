
// Shining Particle by harukit
// Created with Processing 68 alpha on September 11 , 2004
// http://www.harukit.com 


int pNum =4;
Particle[] p = new Particle[pNum];
float rr,gg,bb,dis;
int gain = 5;
float[] cc = new float[3];
PImage tex;
int w;
int h;
void setup(){
  size(100,100,P2D);
  loadPixels();
  w=width;
  h=height;
  tex = createImage(width,height,ARGB);
  
  noStroke();
  loadPixels();
  background(0);
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(width),random(height),random(0.1,0.3));
  }
}
void draw(){
tex=get();
 loopx(); 
}
void loopx(){
  for(int i=0;i<pNum;i++){
    p[i].update();
  }
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
        int pos=y*width+x;
        color col = tex.pixels[pos];
        rr = col >> 16 & 0xff;
        gg = col >> 8 & 0xff;
        bb = col  & 0xff;
        for(int i=0;i<pNum;i++){
          dis =fastDist(p[i].xpos,p[i].ypos,0,(float)x,(float)y,0)/2;
          //dis= dist(p[i].xpos,p[i].ypos,(float)x,(float)y)/2;
          rr += cc[0]/dis-gain;
          gg += cc[1]/dis-gain;
          bb += cc[2]/dis-gain;
        }
        tex.pixels[pos]=color(rr,gg,bb,rr);
    }
  }
  image(tex,0,0);

// tex=get();

}

void mousePressed(){
 
  Particle[] p = new Particle[pNum];
}

void mouseReleased(){
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
 
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

    float fastDist( float x1, float y1, float z1, float x2, float y2, float z2 )
    {
      float fdist = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1);
      return fdist;
    } 

                
                                                                
