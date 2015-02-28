
import processing.video.*;
 Capture video;
 
int p = int(random(600));
int q = int(random(480));
int newx = 0;
int newy = 0;
int aa = int(random(400,600));
int bb = int(random(20,100));
float linemax = 80;
float linelen = linemax;
 int tt = 3;
boolean showvid = true;
boolean alter = false;
 
  
void setup() {
  size(600, 480, P2D);
  video = new Capture(this, 600, 480, 15);
  frameRate(5);
  smooth();
}
  
void draw() {
 copy(0, 0, bb, aa, 0, 0, aa, bb);
//  for (int y = 0; y < video.height; y++) {
 
 //   for (int x = video.width-1; x > -1; x--) {
// int p = video.width * video.height;
   //   int loc = x + y * video.width;
 //     color c = video.get(x,y);
 //     boolean cd = true;
 //    if(cd == true){
  //     set(p, q,0);
 //    }
 
     
 //   }
//}
 
 
}
 
  
 void captureEvent(Capture c) {
 
 
 
//void keyPressed(){
// if (key=='y')
 
 
 
  {
    for (int i = 0; i < width; i++)
    {
      for (int j = 0; j < height; j++)
      {
        color px = video.get(i,j);
        float r= red(px);
        float g= green(px);
        float b= blue(px);
        float T=0;
        float C= (r+b+g) % 255;
        if (r<g)
        {
          g= 75;
          r =255;
          b=74;
        }
        if (55>g) 
        {
          if (g<33){
          b=random(55);
        }
        color op= color (r,g,b,255);
        set(i,j,op);
        }
      }
    }
  }
 
 
 
c.read();
  }
 
 


