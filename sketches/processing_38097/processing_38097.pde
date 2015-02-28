
//3D Plane
float lx;
float ly;
int w = 255;
int h = 255;


boolean up = false;

PGraphics scene;
PImage ax;
void setup(){
  size(765,450);
  scene = createGraphics(w,h,P2D);
  ax = createImage(w,h,ARGB);
  axi = createImage(w,h,ARGB);
  loadPixels();
smooth();
  background(-1);
  allw=width;
  allh=height;
  flip= createImage(w,h,ARGB);
  frameRate(3000);
//  for (int i=0;i<ov.pixels.length;i++){
//   ov.pixels[i]=color(1,255/15);   
//    }
for (int x =0;x<ov.width;x++){
  for (int y =0;y<ov.height;y++){
    // float dis = dist(x,y,ov.width/2,ov.height/2);
   float dis = abs(x-ov.width/2)+abs(y-ov.height/2);
     if(dis<ov.width/2) ov.pixels[x+ov.width*y]=color(1,11+dis);
    // if(dis<ov.width/2) ov.pixels[x+ov.width*y]=color(random(255),random(255),random(255),111+dis);
  }   
 }
}
int x = -2 ;
float y=-2;
float xm;
float ym = h/2;
int allw;
int allh;
PImage flip;
PImage axi;
void inv(){
  int check = axi.pixels.length;
  //PImage dotx = createImage(src.width,src.height,ARGB);
  //arraycopy(src.pixels,dotx.pixels);
  for (int i = 0;i<axi.pixels.length;i++){
    check--;

    ax.pixels[i]=axi.pixels[check];
  }


}
float fx;
void draw(){
  noStroke();

  float dis = ((x-x)+(h-y))/h; //faster
  if(dis<0)dis=-dis;
  if(up==true)y-=dis;
  if(up==false)y+=dis;

  if(y>h-2)up=true;
  if(y<0)up=false;
 




  x++;
  if(x>=w){
    x=0;
    firstrun = false;
  }
  //scene.get(0,0,w,h);
  strokeWeight(1);
 
  noStroke();
  fill(1,8);
 
  ellipsei(x,y,6,6);
  ellipsei(w+x,y,6,6);
  ellipsei(w*2+x,y,6,6);
  ellipsei(w*3+x,y,6,6);

  ellipsei(w-x,(h*2)-y,6,6);
  ellipsei((w*2)-x,(h*2)-y,6,6);
  ellipsei((w*3)-x,(h*2)-y,6,6);
  ellipsei((w*4)-x,(h*2)-y,6,6);

  ellipsei(x,(h*2)+y,6,6);
  ellipsei(w+x,(h*2)+y,6,6);
  ellipsei(w*2+x,(h*2)+y,6,6);
  ellipsei(w*3+x,(h*2)+y,6,6);

  ellipsei(w-x,(h*4)-y,6,6);
  ellipsei((w*2)-x,(h*4)-y,6,6);
  ellipsei((w*3)-x,(h*4)-y,6,6);
  ellipsei((w*4)-x,(h*4)-y,6,6);
 
}
PImage ov = createImage(4,4,ARGB);
void ellipsei(int x,float y,int a,int b){
  imageMode(CENTER);
  fx+=.1;
 
  translate(x,y);
 // 
  rotate(radians(fx));
  image(ov,0,0);
    rotate(radians(-fx));
    translate(-x,-y);
   
//  image(ov,x,int(y));
}
boolean firstrun = true;

