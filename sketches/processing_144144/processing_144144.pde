
/*import gifAnimation.*;
GifMaker gifExport;
*/
int x = 200;
int x2 = 0;
int y = 0;
int r = 30;
int s = 5;
int a = 5;
int n = 0;
int y2 = 0;

void setup(){
  size(600,600);
  background(0);
  //gifExport = new GifMaker(this, "pattern.gif");
  //gifExport.setRepeat(0);
}

void draw(){
  ellipse(x,y,r,r);
  x+=a;
  y=y+s;
  ellipse(x2,y2,r,r);
  x2+=a;
  y2+=s;
  if (frameCount<1900){
  if (x>width || x< 200){
    a=a*-1;
  }
  if (y>height || y<0){
    s=s*-1;
  }
  }
  //println(frameCount);
  /*if (frameCount/10 == n){ 
  gifExport.setDelay(1);
  gifExport.addFrame();
  n = n+1;
  }*/
}

void mousePressed(){
  save("pattern3.jpg");
  println("saved");
}

/*void mousePressed(){
  gifExport.finish();
  println("gif saved");
}*/
