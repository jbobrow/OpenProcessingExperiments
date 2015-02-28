
int w = 255;
int h = 255;

PImage karl = createImage(w,h,ARGB);
int [] karl2 = new int[w*h];
color [] karl3 = new color[w*h];


void setup(){
background(0);
size(255,255);
  float wm = w/2;
  float hm= h/2;
  int inc=0;
  for (int x=0;x<w;x++){
    for (int y=0;y<h;y++){
      float dis = dist(wm,hm,x,y)*2;
     karl3[inc]=1;
      int paw =255- (int)dis;
         //   karl.pixels[inc]=1;
         stroke(paw);
         
         if (dis<255){
         point(x,y);
       karl.set(x,y,get(x,y));
       }
      inc++;

    }
  }
 // background(255,0,0);
  //arraycopy(karl3,karl.pixels);
 // image(karl,0,0);
}
