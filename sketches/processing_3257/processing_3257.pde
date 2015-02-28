
// Conway's Scope of Life
// John Ingraham, 2009
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
PGraphics buffer;
PGraphics lifeBuffer;

Minim minim;
AudioPlayer player;
float waveValue1 = 1;
float waveValue2 = 1;
float x1=0;
float x2=0;
float waveScale=70;
float maxSize=60;
float level = 0;
boolean mouseDown=false;

void setup(){
  size(400,200, P2D);
  background (0);
  colorMode(RGB, 255, 255, 255, 100);
  buffer = createGraphics(400, 200, P2D);
  lifeBuffer = createGraphics(buffer.width, buffer.height, P2D);
  noSmooth();
  buffer.noSmooth();
  lifeBuffer.noSmooth();
  buffer.colorMode(RGB, 255, 255, 255, 100);
  background(0);
  frameRate(30);
  minim = new Minim(this);
  player = minim.loadFile("thermals.mp3");
  player.loop();
  background(0);
  waveScale=buffer.height/2;
}

void mouseMoved(){
  lifeBuffer.set(mouseX, mouseY,255);  
}

void draw(){
  buffer.beginDraw();
  buffer.background(0);
  level=player.mix.level()*255*5;
  for(int x=1; x<buffer.width; x++){
    for (int y=1; y<buffer.height; y++){
      int count = test(x,y);
      if (count == 2 && brightness(lifeBuffer.get(x,y))>0){
        buffer.set (x,y, color((brightness(lifeBuffer.get(x,y))-10+level)/2));
      } 
      else if(count ==3 && brightness(lifeBuffer.get(x,y))>0){
        buffer.set (x,y, color((brightness(lifeBuffer.get(x,y))-10+level)/2));
      } 
      else if(count==3 && brightness(lifeBuffer.get(x,y))<=0)
      {
        buffer.set (x,y, color(level));
      } 
      else{
        buffer.set (x,y, color(0));
      }
      if (brightness(get(x,y))<0){
        buffer.set(x,y, color(0));
      }
    }
  }
  x1=0;
  buffer.fill(255);
  waveValue1=waveScale*player.mix.get(0);
  for(int t=1; t<player.bufferSize(); t++){
    x2= ((float)t)/player.bufferSize()*buffer.width;
    waveValue2=waveScale*player.mix.get(t);
    buffer.line(x1,waveValue1+buffer.height/2,x2,waveValue2+buffer.height/2);
    buffer.set((int)x1,(int)(waveValue1+buffer.height/2),color(255));
    x1=x2;
    waveValue1=waveValue2;
  }
  buffer.endDraw();
  image (buffer,0,0,width,height);
  lifeBuffer.beginDraw();
  lifeBuffer.image(buffer, 0, 0);
  lifeBuffer.endDraw();
}

int test(int x, int y){
  int count = 0;
  for(int u=x-1; u<=x+1; u++){
    for (int v=y-1; v<=y+1; v++){
      if (!(v==y&&u==x)){
        if(brightness(lifeBuffer.get(u,v))>0){
          count++;
        }
      }
    }
  }
  return count;
}






