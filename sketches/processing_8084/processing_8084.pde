
// Original particle code by Shining Particle by harukit
// Created with Processing 68 alpha on September 11 , 2004
// http://www.harukit.com 
//Lens Flare
//Modified by Owaun Scantlebury
int pNum =4;

float rr,gg,bb,dis;
int gain = 5;
float[] cc = new float[15];
PImage pop,popc,pic;

void keyPressed(){
  if (key=='1')   pic = loadImage("457.png");
  if (key=='2')   pic = loadImage("v.png");

  if (!online){
    if (key=='s')save("flare.png"); 
  }

}
void setup(){
  pic = loadImage("457.png");

  size(300,300,P3D);


  noStroke();
  pop = new PImage(width,height);
  popc = new PImage(width,height);
  loadPixels();
  pix = new color[width*height];
  background(0);
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }

}
public color[] pix;

void draw(){
  if (!online )this.frame.setTitle("Framerate : "+str(frameRate)); 

  for(int y=0;y<height;y+=1){
    for(int x=0;x<width;x+=1){
      int pos=y*width+x;
      color col = pix[pos];

      rr = col >> 16 & 0xff;
      gg = col >> 8 & 0xff;
      bb = col  & 0xff;

      dis =dist(mouseX,mouseY,x,y)/82;
      rr += cc[0]/dis-gain;
      gg += cc[1]/dis-gain;
      bb += cc[2]/dis-gain;


      pixels[pos]=color(rr,gg,bb);
      pop.set(y,x,blendColor(color(rr,gg,bb),color(height-y,x,x-y),ADD));
    }
  }


  blend(pop,0,0,width,height,0,0,width,height,OVERLAY);
  blend(pic,0,0,width,height,0,0,width,height,OVERLAY);

}

void mousePressed(){

}

void mouseReleased(){
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }

}
public float xpos,ypos,del;





