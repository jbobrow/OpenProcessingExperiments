
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/80310*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img;
 
int size;
int hwidth,hheight;
int riprad;
 
int ripplemap[];
int ripple[];
int texture[];
 
int oldind,newind, mapind;
 
int i,a,b;
 
void setup() {
  
  size(400,400);
  smooth();
  
  img = loadImage("6.png");
  frameRate(40);
   
  hwidth = width>>1;
  hheight = height>>1;
  riprad=5; //test with 3
   
  size = width * (height+2) * 2;
   
  ripplemap = new int[size];
  ripple = new int[width*height];
  texture = new int[width*height];
   
  oldind = width;
  newind = width * (height+3);
   
  image(img, 0, 0);
  loadPixels();
   
  smooth();
  
  ellipseMode(CENTER);
}

void draw() {
  image(img, 0, 0, 400, 400);
  noStroke();
  fill(170, 85, 30, 200);
  ellipse(200, 200, 210, 160);
  ellipse(200, 220, 180, 120); 
  ellipse(200, 230, 150, 90); 
  loadPixels();
  texture = pixels;
   
  newframe();
     
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = ripple[i];
  }
    
  updatePixels();
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
  //Toggle maps each frame
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
 
      //where data=0 then still, where data>0 then wave
      data = (short)(1024-data);
 
      //offsets
      a=((x-hwidth)*data/1024)+hwidth;
      b=((y-hheight)*data/1024)+hheight;
 
      //bounds check
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
 

 
void mousePressed(){
  if (mouseX > 120 && mouseX < 280 && mouseY > 150 && mouseY < 250){
  disturb(mouseX, mouseY);
  }
}
 




