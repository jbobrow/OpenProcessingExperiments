
/*
* Written by Min-Woo, Choo
* Based on "Java Water Simulation", by: Neil Wallis
* For more information visit the original article here: 
* http://neilwallis.com/projects/java/water/index.php
*
* How does it work? "2D Water"
* http://freespace.virgin.net/hugo.elias/graphics/x_water.htm
*
*/

rainDrop rain1;
int x2,y2,z2;
color rain_color;
int cnt=0;
boolean sw1=false;
boolean sw2=false;


PImage img;

int size;
int hwidth,hheight;
int riprad;

int ripplemap[];
int ripple[];
int texture[];

int oldind,newind, mapind;

int i,a,b;

float endY;

class rainDrop {
       
  int xpos;
  int ypos;
  int yspeed;
  float dropSize;
       
  rainDrop() {
    rain_color = color(40, 40, 225);
    xpos = mouseX;
    ypos = 0;
    yspeed = 5;
    dropSize = random(.1,.3);
  } 
      
  public void display() {
    noStroke();
    fill(rain_color);
    ellipse(xpos, ypos, dropSize*107, dropSize*105);
    triangle(xpos-dropSize*50, ypos-dropSize*20, xpos+dropSize*50, ypos-dropSize*20, xpos, ypos-dropSize*100);     
  }
      
  void fall() {
    ypos = ypos + yspeed;
    if (ypos > height+40){
      ypos = mouseY;
      xpos = mouseX; 
      
    }
  }
}

void setup(){
  img = loadImage("day morning.jpg");
  size(1000, 610);
  frameRate(40);
  
  rain1=new rainDrop();
  
  hwidth = width>>1;
  hheight = height>>1;
  riprad=5;
  
  size = width * (height+2) * 2;
  
  ripplemap = new int[size];
  ripple = new int[width*height];
  texture = new int[width*height];
  
  oldind = width;
  newind = width * (height+3);
  
  endY=random(400, 580);
  
  image(img, 0, 0); 
  loadPixels();
  
  smooth();
}

void draw() {
  endY=random(350, 700);
  image(img, 0, 0);
  
  loadPixels();
  texture = pixels;
  
  newframe();
  
  endY=random(350, 700);
      
  rain1.fall();
  rain1.display();
  
      if (cnt>=7){
        rain_color=color(255, 255, 255, 0);

        if(!sw1){
          y2=y2+1;
          z2=z2+1;
         }
        if(y2==255 || z2==255) {
          sw1=true;
        }
        if(sw1==true){
          y2=y2-1;
          z2=z2-1;
        }
        if(sw1==true && y2==0 ||z2==0){
          cnt=0;
          sw1=false;
          rain_color = color(40, 40, 225);
        }
      }
      
      endY=random(350, 700);
      
      if(rain1.ypos>endY){
        if(rain1.ypos<590){
          disturb(rain1.xpos,rain1.ypos);
          rain1.dropSize=random(.1,.3);
          rain1.ypos=1000;
        }
      }
  
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = ripple[i];
  }
   
  updatePixels();
  rain1.display();
}

public void disturb(int dx, int dy) {
  for (int j=dy-riprad;j<dy+riprad;j++) {
    for (int k=dx-riprad;k<dx+riprad;k++) {
      if (j>=0 && j<height && k>=0 && k<width) {
        ripplemap[oldind+(j*width)+k] += 128;   //test with 512         
      } 
    }
  }
}

void newframe() {
  i=oldind;
  oldind=newind;
  newind=i;

  i=0;
  mapind=oldind;
  for (int y=0;y<height;y++) {
    for (int x=0;x<width;x++) {
      short data = (short)((ripplemap[mapind-width]+ripplemap[mapind+width]+ripplemap[mapind-1]+ripplemap[mapind+1])>>1);
      data -= ripplemap[newind+i];
      data -= data >> 5;
      ripplemap[newind+i]=data;

      data = (short)(1024-data);

      a=((x-hwidth)*data/1024)+hwidth;
          b=((y-hheight)*data/1024)+hheight;

      if (a>=width) a=width-1;
      if (a<0) a=0;
      if (b>=height) b=height-1;
      if (b<0) b=0;

      ripple[i]=texture[a+(b*width)];
      mapind++;
      i++;
    }
  }
}

void mousePressed()
{
  disturb(mouseX, mouseY);
}


