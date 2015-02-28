
//By far the best water refraction code I have seen on the net
//Remixed with the permission of brik from thee processing.org forums
//Original forum thread  
//http://processing.org/discourse/yabb2/YaBB.pl?num=1236471047/6
//Picture taken from this java ripple page
//http://hp.vector.co.jp/authors/VA012735/applet/drop3Dw2_en.htm
//Remix code by Owaun Scantlebury
//March 2010

//Controls
//Press '1' for mode 1
//Press '2' for mode 2
//Press UP to increase bubble reset interval
//Press DOWn to decrease bubble reset interval
//Left-click to draw wall
//Right-click to erase wall
//Disabled screen cap for online purpose
//ESC key has been re-routed to keycode 1 so as not freeze sketch

public int rmode =1;
public boolean pauseripple = false;
float [] temp;
int tankX = 255;
int tankY = 255;
float tankScale = 1;
//int tankSize = round(tankX*(int)tankScale)*round(tankY*(int)tankScale);
int tankSize = round(tankX*1)*round(tankY*1);
public int intervalmax = 25;
public int intervalx;
float damping = 000.75;  ////0.99-0.99/3; //0.65;////00.72;//0.79;// // 0.59;// //0.29 //0.99
int dropSize=2;//10 //160
float lightIntensity=0.2;//0.2
public color [] A,B;
PImage water,bbg,bbg2;

float[] waveBuffer1 = new float[tankSize];
float[] waveBuffer2 = new float[tankSize];
int[] wallMap = new int[tankSize];

PImage v,ld;
void setup()
{
  size(255,255,P2D); //actual size for upload to openprocessing.org - use below for local use
  //size(round(tankScale*tankX),round(tankScale*tankY),P2D); //ONLY WORKS WITH P2D AND P3D mode with pictures
  //To use with OPENGL,JAVA2D or basic renderer remove references to pictures

  v = loadImage("pain.png");
  ld = loadImage("ld.png");
  v.resize(width,height);
  noStroke();
  smooth();
  bbg= new PImage(width,height);
  bbg2= new PImage(width,height);
water = createImage(width,height,ARGB);
  loadPixels();
  for (int x = 0;x<width;x++){
    for (int y = 0;y<height;y++){
      //bbg.set(x,y,color(height-y,x,x-y)); //method 1
      //bbg2.set(x,y,color(height-y,x,x-y)); //method 1
      bbg.set(x,y,v.get(x,y));
      bbg2.set(x,y,v.get(x,y));
      if (brightness(ld.get(x,y))<255/2){
        wallMap[x+width*y]=1; 
      }


    }
  }
  bbg2.filter(GRAY);
  background(bbg);
  colorMode(HSB,1,1,1,1);

  A=pixels;
 
  arraycopy(bbg.pixels,water.pixels);
 B= water.pixels;
  PFont font1 = createFont("arial",12);
  textFont(font1, 12);
  frameRate(60);
  mouseX = width/2-20;
  mouseY= height/3-30;
  arraycopy(B,A);
}

void draw(){

  if (rmode==1){
    intervalx++;
    if (intervalx>intervalmax){
      pauseripple = !pauseripple;
      intervalx=0; 
    }
    if(!pauseripple){ 
      key =' ';
      keyPressed();
    }

  }

  if (rmode==2){
    key =' ';
    keyPressed();
  }

  processWater();

  text("fps: "+frameRate,10,20);

}

void processWater(){
  float[] dispMap = new float[tankSize];
  for(int y=1; y<tankY-1; y++)
    for(int x=1; x<tankX-1; x++){
      int i=y*tankX+x;
      float sumX=waveBuffer2[i-1]+waveBuffer2[i+1];
      float sumY=waveBuffer2[i-tankX]+waveBuffer2[i+tankX];
      waveBuffer1[i] = ((sumX+sumY)/2) - waveBuffer1[i]*1;
      waveBuffer1[i] *= damping*(1-wallMap[i]);//*

      //calc displacement map
      sumX=-waveBuffer2[i+1]+waveBuffer2[i+1];//-  method 1  
      //sumX=waveBuffer2[i-1]+waveBuffer2[i+1];//-  method 2
      sumX=waveBuffer2[i+1]-waveBuffer2[i-1];//-
      // sumY=-waveBuffer2[i-tankX]+waveBuffer2[i+tankX]; //-  method 1
      // sumY=waveBuffer2[i-tankX]+waveBuffer2[i+tankX]; //-  method 2
      sumY=waveBuffer2[i-tankX]+waveBuffer2[i+tankX]; 
      int dispX=x+round(sumX*1);
      int dispY=y-round(sumY*1);
      if(dispX>1 && dispX<tankX-1 && dispY>1 && dispY<tankY-1){
        dispMap[dispY*tankX+dispX]+=lightIntensity;
      }
    }

  //draw refractions

  for(int y=1; y<tankY-1; y++)
    for(int x=1; x<tankX-1; x++){
      A[y*tankX+x]=blendColor(bbg.pixels[y*tankX+x],color(dispMap[y*tankX+x]/2),ADD);//ADD
      //   water.pixels[y*tankX+x]=blendColor(water.pixels[y*tankX+x],color(bbg2.pixels[y*tankX+x]/2),OVERLAY);//ADD //method 2
      if(wallMap[y*tankX+x]==1)A[y*tankX+x]=blendColor(bbg.pixels[y*tankX+x],color(height-y,x,x-y),OVERLAY);//color(0.2);
    }

  //swap buffers
  temp=waveBuffer1;
  waveBuffer1=waveBuffer2;
  waveBuffer2=temp;


}

void mouseDragged(){
  //println(mouseButton);
  if(mouseX>dropSize/2 && mouseX<tankX-dropSize/2 && mouseY>dropSize/2 && mouseY<tankY-dropSize/2)
    for(int y=-dropSize/2;y<=dropSize/2;y++){
      for(int x=-dropSize/2;x<=dropSize/2;x++){
        if( mouseButton ==37)wallMap[(mouseY+y)*width+(mouseX+x)]=1;
        if( mouseButton ==39)wallMap[(mouseY+y)*width+(mouseX+x)]=0;
      }
    } 
}

void keyPressed(){
  if (key=='1')rmode=1;
  if (key=='2')rmode=2;
  if (key=='p' || key =='P')pauseripple = !pauseripple;
  if( keyCode == UP && intervalmax<height)intervalmax++;
  if( keyCode == DOWN && intervalmax>1)intervalmax--;
  if(!online && key=='s')save("gfish.png");

  if (key==ESC){ //escape rerouted to keycode 1 so as to not freeze sketch.
    key=1; 
  }

  if (key ==' '){
    if(mouseX>dropSize/2 && mouseX<tankX-dropSize/2 && mouseY>dropSize/2 && mouseY<tankY-dropSize/2)
      for(int y=-dropSize/2;y<=dropSize/2;y++)
        for(int x=-dropSize/2;x<=dropSize/2;x++)
          waveBuffer1[(mouseY+y)*width+(mouseX+x)]=100; //100
  }
}



