
float [] karlR;
float [] karlG;
float [] karlB;
int inc=0;

PImage scr,bump;
void setup(){
  size(255,255);
  String ext = ".png";
  String fn  = "http://2.bp.blogspot.com/-DDyTpg921lk/TXzymRsGoAI/AAAAAAAAAQY/V0Cr3aO9gd4/s400/water_v0";
  //https://dl-web.dropbox.com/get/Photos/water_v0.png?w=e4714786";
  //http://2.bp.blogspot.com/-DDyTpg921lk/TXzymRsGoAI/AAAAAAAAAQY/V0Cr3aO9gd4/s400/water_v0.png
  //"water_v0";

  //1.jpg");
  //
  bump=createImage(255,255,ARGB);
  for (int x= 1;x<bump.width;x++){
    for (int y=1;y<bump.height;y++){
      bump.set(x,y,color(bump.width-x,x-y,bump.height-(y)));
    } 
  }
  bump  = loadImage(fn+ext);
  bump.resize(255*2,255*2);
  //bump.filter(INVERT);
  loadPixels();
  scr =createImage(width,height,ARGB);
  for (int x=0;x<width/16;x++){
    // scr.set((int)random(0,width),(int)random(0,height),color(255,0,0));
    fill(255,0,0);
    rectMode(CENTER);
    ellipseMode(CENTER);
    ellipse((int)random(0,width),(int)random(0,height),8,8);
  }
  for (int x=0;x<pixels.length;x++){
    if (pixels[x]==color(255,0,0))scr.pixels[x]=pixels[x]; 
  }
  scr=get();
  karlR= new float [width*4]; 
  karlG= new float [width*4];
  karlB= new float [width*4];


  for (int x= 0;x<width;x++){
    karlR[x]=x;
    karlG[x]=0;
  }
  for (int x=0;x<height;x++){
    karlR[width+x]=width;
    karlG[width+x]=x; 
  }
  inc=0;
  for (int x=width;x>-1;x--){
    karlR[(width*2)+inc]=x;
    karlG[(width*2)+inc]=height;
    inc++; 
  }
  inc=0;
  for (int x= height;x>0;x--){
    karlR[(width*3)+inc]=0;
    karlG[(width*3)+inc]=x;
    //  println( karlG[(width*3)+inc]);
    inc++;
  }

}

void draw(){
  bounce(true,3,1,5);
  if (!mousePressed){
    mouseX=px;

    mouseY=py;
  }
  else
  {
    px=mouseX;
    py = mouseY; 
  }



  background(255,0,0);
  imageMode(3);
  image(bump,px,py);
  for (inc = 0;inc<(width*4);inc++){
    float x = karlR[inc]; 
    float y = karlG[inc];

    float dis=dist2(mouseX,mouseY,x,y);
    // stroke (x,y,x%y,dis);
    dis=dis/100;
    //stroke (1,dis);
    //nowcolor = bump.get(int((width/2)-x),int((height/2)-y));
    // nowcolor = bump.get(int((width/2)-dis),int((height/2)-dis));
    //color(1,dis);
    //stroke (x,y%x,x%y);
    nowcolor = color(x,y,x%y);
    lined2(mouseX,mouseY,x,y);
    //lined2(x,y,mouseX,mouseY);

  }

  // image(scr,0,0);

}
public color nowcolor;

void lined(float x1,float y1,float x2,float y2){
  float dx = x2-x1;
  float dy = y2-y1;
  float hit1 = max(y1,y2);
  if(dx == 0){
    for(float i = min(y1,y2);i<hit1;i+=1){
      //  point(x1,i); 
      set((int)x1,(int)i,nowcolor);
      if (scr.get((int)x1,(int)i)==color(255,0,0))i=hit1;
    }
    return;
  }
  float k = dy/dx;
  float m = y1 -x1*k;
  float hit2 = max(x1,x2);
  for(float i = min(x1,x2);i<hit2;i+=1/max(1,abs(k))){
    // point(i,k*i+m); 
    set((int)i,int(k*i+m),nowcolor); 
    if (scr.get((int)i,int(k*i+m))==color(255,0,0))i=hit2;
  }
}
float _hit1;
void lined2(float x1,float y1,float x2,float y2){
  float angle = atan2(y2-y1,x2-x1);
  float currentX = x1;
  float currentY = y1;
  float hit1 =abs(currentX-x2); 
  float hit2 =abs(cos(angle)); 
  while( hit1>hit2){
    //if (scr.pixels[(int)currentX+scr.width*int(currentY)]==color(255,0,0)){
    //
    if (scr.get((int)currentX,int(currentY))==color(255,0,0)){
      hit1=abs(cos(angle))-1; 
    }
    if (scr.get((int)currentX,int(currentY))!=color(255,0,0)){
      hit1=abs(currentX-x2); 
    }
    hit2 =abs(cos(angle)); 

    //point(currentX,currentY);
   set((int)currentX,(int)currentY,nowcolor);
//  if(currentX> 0 && currentX <width && currentY>0 && currentY<height){
//    pixels[(int)currentX+width*(int)currentY]=nowcolor;
//  }
   // line(px,py,currentX,currentY);
    currentX += cos(angle);
    currentY += sin(angle);
  }
}

void lined3(float x1,float y1,float z1,float x2,float y2,float z2){
  float dx = x2-x1;
  float dy = y2-y1;
  float dz = z2-z1;
  float k1 = dy/dx;
  float m1 = y1 -x1*k1;
  float k2 = dz/dx;
  float m2 = z1-x1*k2;
  if(dx == 0){
    if(dz == 0){
      for(float i = min(y1,y2);i<max(y1,y2);i+=1){
        point(x1,i,z1); 
        // point(x1,i);
        return;
      } 
    }
    k1 = dy/dz;
    m1 = y1 -z1*k1;
    for(float i = min(z1,z2);i<max(z1,z2);i+=1/max(1,abs(k1))){
      point(x1,k1*i+m1,i);
      
      //point(x1,k1*i+m1);
    }
    return; 
  }
  for(float i = min(x1,x2);i<max(x1,x2);i+=1/max(1,abs((max(k1,k2))))){
    point(i,k1*i+m1,k2*i+m2); 
    //point(i,k1*i+m1);
  }

}

float dist2( float x1, float y1,  float x2, float y2 )
{
  float fdist = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1); // + (z2 - z1) * (z2 - z1);
  return fdist;
} 

////BNC

public boolean forward = true;
public boolean up = false;
public int px=0;
public int py =0;
public int ly=0;
public int lx=0;
void bounce(boolean rnd, int by, int lo, int hi){
  if (forward){
    if (rnd)px+=random(lo,hi);
    if (!rnd){
      px+=by;
    }
  }


  if (!forward){
    if(rnd)px-=random(lo,hi); 
    if (!rnd){
      px-=by;
    }
  }

  if (up){
    if (rnd)py-=random(lo,hi*2);
    if (!rnd){
      py+=by;
    }
  }

  if (!up){
    if(rnd)py+=random(lo,hi*2);
    if (!rnd){
      py-=by;
    } 

  }


  if (px>width)
  {

    forward = false;

  }


  if (px<0)    forward = true;
  if (py>height)up     = true;
  if (py<0     )up     = false;
} 






