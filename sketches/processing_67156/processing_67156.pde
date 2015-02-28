
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

float [] ripple;
int index;
int lastIndex;
boolean showRipples = false;
PImage img;
Minim minim;
AudioPlayer player;
int inter=50;
float sig=0;
int i=0;
int j=0;
float []r=new float [50];
float []a=new float [50];
float []b=new float [50];
float []l=new float [50];

void setup(){
  size(500,355);
  ripple = new float[width*height*2];
  background(0);
  img = loadImage("5.jpg");
  image(img,0,0);
  index = 0;
  lastIndex = width*height;
  for(int i = 0; i < width*height*2; i++)
  ripple[i] = 0;
    
  smooth();
  noFill();
  minim=new Minim(this);
  minim.debugOn();
  player=minim.loadFile("1.mp3",1024);
  for (int i=0;i<50;i++){
    a[i]=int(random(width));
    b[i]=int(random(height));
    r[i]=0;
    l[i]=0;
  }
}

void draw(){
  int z = index;
  index = lastIndex;
  lastIndex = z;
   
  if(showRipples) drawRipples();
  else drawImage();
  //get the sound frequency
  for(int i=0;i<1024;i+=64){
    float proxy;
    proxy=abs(player.left.get(i))*35;
    if (sig<proxy){
      sig=proxy;
    }else sig-=sig*sig/5000;   
    proxy=sig;
  }
  //below ripple code
  int num=int(sig*1.4);
    inter=50-num;
      for(int j=0;j<50;j++){
      stroke(255,150-(120*r[j]/l[j]));
      //ellipse(a[j],b[j],r[j],r[j]);
      if(r[j]==l[j]/18&&r[j]>0){
        createRipple(int(a[j]),int(b[j]),int(num/3*b[j]/200));
      }
    }
      updateRipples(lastIndex, index,num);
      
    for(int j=0;j<50;j++){
      r[j]+=l[j]/18;
      if(r[j]>=l[j]){
        r[j]=0;
        a[j]=random(width);
        b[j]=random(height);
        l[j]=num*8;
      }      
    }
    for (int j=num;j<50;j++){
    r[j]=0;
    a[j]=random(width);
    b[j]=random(height);
    l[j]=num*8;
  }   
}






void drawRipples()
{
  loadPixels();
  for(int i = 0; i < width*height; i++)
    pixels[i] = color(ripple[i+index]);
  updatePixels();
}
 
void drawImage()
{
  loadPixels();
  for(int x = 1; x < width-1; x++) {
    for(int y = 1; y < height-1; y++) {
      int i = y*width + x;
      int s = i + index;
      float dx = (ripple[s-1] - ripple[s+1]);
      float dy = (ripple[s-width] - ripple[s+width]);
      float px = constrain(x + dx, 0, width - 1);
      float py = constrain(y + dy, 0, height - 1);
      pixels[i] =img.pixels[int(py)*width+ int(px)];
    }
  }
  updatePixels();
}

void createRipple(int mx, int my,float mul)
{
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      if(x > mx-3 && x < mx+3 && y > my-3 && y < my+3)
        ripple[y*width + x + index] = 64;//int(50*mul);
    }
  }
}
 
void updateRipples(int src, int dest,int mul)
{
  for(int x = 1; x < width-1; x++) {
    for(int y = 1; y < height-1; y++) {
      int i = y*width + x;
      int s = i + src;
      int d = i + dest;
      ripple[d] = (int(ripple[s-2] + ripple[s+2] + ripple[s-width] + ripple[s+width]) >> 1) - int(ripple[d]);
      ripple[d] = ripple[d]-ripple[d]/72;//int(ripple[d])>> 5;
    }
  }
}

void mouseReleased()
{
  createRipple(mouseX, mouseY,64);
}
 
void mouseDragged()
{
  createRipple(mouseX, mouseY,32);
}

void keyPressed()
{
  if(key == ' ')
    player.play();
}



