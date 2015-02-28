
//Flesh knot
//Original code by harukit
//Remixed by Owaun Scantlebury
//October 23rd 2010
//Click the mouse to choose a random colour
//Below are the controls
// if (key=='l')dolines = !dolines;
//  if (key=='z')doellipses = !doellipses;
//  if (key=='a')auto=!auto;
//  if (key=='q')harukitmode = 1; //- TODO
//  if (key=='w')harukitmode = 2; //- TODO
//  if(key=='2')gmode=2;
//  if(key=='3')gmode=3;
//  if(key=='4')gmode=4;
//  if(key=='5')gmode=5;
//  if (key=='v')vnorm = !vnorm;
//  if (key=='c')constant = !constant;

GL gl;
PGraphicsOpenGL pgl;
boolean click = false;
import processing.opengl.*;
import javax.media.opengl.*;
public String rmode = "P2D";

public boolean constant = false;
public boolean metal = false;
public String drive = "c:\\";
public String picsave =drive+"data\\3lr.png";
public int inc;
public boolean dolines = false;
public boolean doellipses = false;
public boolean auto = false;
public boolean loadpic = true;
public float _lx,_ly;
public int harukitmode= 1;
int pNum =16;
public color [] pop = new color[pNum];
Particle[] p = new Particle[pNum];
float rr,gg,bb,dis;
int gain = 9;
public int gmode = 3;
PImage ax;
float[] cc = new float[3];
public color [] pp;
public float _x,_y;
public int w,h;
public PImage kil;
public PImage picl;
public PImage picf;
public boolean override = false; //enable to choose specific image
public int overval = 43; //modify this to choose specific image
void setup(){
  // online = true; //uncomment for testing purpose
  w= 200;
  h =200;
  if(!online) picf = loadImage(picsave);
  if (online)picf = new PImage(w,h);

  kil = createImage(w,h,ARGB);
  if (picf!=null){
    if(online)  picf.set(0,0,1);
    if(online)  picf.set(0,0,color(w/2,h/2,255));
    picsavecount= (int)red(picf.get(0,0));
    if (override)picsavecount=overval;

  }
  else
  {
    picsavecount=0;
  }
//  size(200,200,P2D);
if (online){
   size(200,200,P2D    );
}
if (!online){
   if(rmode=="OPENGL") size(w,h,OPENGL );
   if(rmode=="P3D")    size(w,h,P3D    );
   if(rmode=="P2D")    size(w,h,P2D    );
}

   frameRate(30);
 // lights();
 strokeWeight(4);
// hint (DISABLE_DEPTH_TEST);
  hint(DISABLE_OPENGL_2X_SMOOTH);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  if (rmode == "OPENGL"){
    pgl = (PGraphicsOpenGL) g;
    gl = pgl.gl;
    gl.glHint (gl.GL_LINE_SMOOTH_HINT, gl.GL_NICEST);
    gl.glEnable (gl.GL_LINE_SMOOTH); 
  }
  if (rmode == "P3D" || rmode =="P2D"){
    smooth(); 
  }
  ax=createImage(w,h,ARGB);
  loadPixels();
smooth();
  noStroke();
  background(0);
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(w),random(h),random(0.1,0.3));
  }
  color paw = picf.get(0,1);
  for (int x=0;x<pop.length-1;x++){
if (online)paw=color(w/2,h/2,255);
    mouseX=(int)red(paw);
    mouseY=(int)green(paw);
    pop[x]=color(mouseX,mouseY,255);

  }
  if (loadpic && picf!=null){
    if (!online)  picl = loadImage(drive+"data\\knots"+str( picsavecount)+".png");
    if (online)picl = new PImage(w,h);
    if(online)picl.filter(INVERT);
    if (picl.width != w || picl.height !=h)picl.resize(w,h);
    image(picl,0,0);

  }
}
void draw(){
image(ax,0,0);
  if (auto){
    bounce (true,3,1,15);
    mouseX=px;
    mouseY=py;
  }
  else
  {
    px=mouseX;
    py=mouseY; 
  }
  loopx(); 

  // a.copy(g,0,0,w,h,0,0,w,h);
  // a.filter(BLUR,2.2);
  // a.mask(a);
}
void linex(float a,float b){
  curveVertex(a,b);
}


void loopx(){
  

  pop[inc]=color(mouseX,mouseY,255);
 
  if (!constant)if (inc<pop.length-1)inc++;

  if (constant) inc++;

  if (inc >pop.length-1)inc=0;
  

  if (pmouseX==mouseX && !constant)
  {
    inc=0; 
  }

  for (int x=0;x<pop.length-1;x++){
   
    _x =pop[x]  >> 16 & 0xff;
    _y = pop[x] >> 8 & 0xff;
  

    fill(_x,_y,255,_x);
   if (doellipses) ellipse(_x,_y,30,30); 
     stroke(_x,_y,255);
      if(x>1 && dolines){
      line(_x,_y,_lx,_ly); 
      }
     _lx=_x;
      _ly=_y;
    p[x].xpos=_x;
    p[x].ypos=_y;
  }
  ax.copy(g,0,0,w,h,0,0,w,h);
  for(int y=0;y<h;y+=1){
    for(int x=0;x<w;x+=1){
      int pos=y*w+x;
      color col = ax.pixels[pos];
 //col = blendColor(col,color(mouseX,mouseY,255),OVERLAY);
        //gg = blendColor(color(rr,gg,bb),color(p[i].xpos,p[i].ypos,255),OVERLAY);
        //bb = blendColor(color(rr,gg,bb),color(p[i].xpos,p[i].ypos,255),OVERLAY);
        
      if(gmode==3){
        rr = _fr(col);
      
        gg = _fg(col);
     
        bb = _fb(col); //fg

      }
      if (gmode==2){

        rr = _fr2(col);
       
        gg = _fg2(col);
        
        bb = _fg2(col); 


      }

      if(gmode==4){
        rr = _fr3(col);
      
        gg = _fg3(col);
       
        bb = _fg3(col);

      }

      if(gmode==5){
        rr = _fr4(col);
      
        gg = _fg4(col);
    
        bb = _fb4(col);

      }

        
      for(int i=pNum-1;i>0;i--){
        
        
        if(gmode==3 || gmode>=4) dis =dist(p[i].xpos,p[i].ypos,x,y)/8;
        if(gmode==2) dis =dist(p[i].xpos,p[i].ypos,x,p[i].ypos)/2;//2 to dark
        if(vnorm)dis =dist(p[i].xpos,p[i].ypos,x,y)/4;//2 to dark

        rr += cc[0]/dis-gain;
        gg += cc[1]/dis-gain;
        bb += cc[2]/dis-gain;
      }
      ax.pixels[pos]=color(rr,gg,bb,rr); //bb dark
    }
  }
  //  if (vnorm){
  // ax.mask(ax); //kicker
  //  }

  image(ax,0,0); 

 
  ax.mask(get());
  if (metal)
  {
    //  kil= createImage(ax.width,ax.height,ARGB);
    arraycopy(ax.pixels,kil.pixels);
    //kil.copy(g,0,0,w,h,0,0,w,h);
    kil.filter(GRAY);
    // ax.mask(kil);
    //flick(get(),ax);
    flick(kil,ax);
  }
  image(ax,0,0);

  if(metal) blend(kil,0,0,w,h,0,0,w,h,SUBTRACT); //OVERLAY, DIFFERENCE , ADD
  
}



void mouseReleased(){
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
 

}

class Particle{
  float xpos,ypos,del;
  Particle(float x,float y,float d){
    xpos=x;
    ypos=y;
    del = d;
  }
  void update(){
    xpos += (mouseX-xpos)*del;
    ypos += (mouseY-ypos)*del;
  }
}

public int cv = 256;
color _fr(color col){
  color retval = col%cv;
  return retval; 
}
color _fg(color col){
  color retval = int(col/256)%cv;
  return retval; 
}

color _fb(color col){
  color retval = int(col/65536)%cv;
  return retval; 
}


color _fr3(color col){
  color retval = col%cv;
  return retval; 
}
color _fg3(color col){
  color retval = col/256%cv;
  return retval; 
}

color _fb3(color col){
  color retval = col/65536%cv;
  return retval; 
}


color _fr4(color col){
  color retval = (col*2)%cv;
  return retval; 
}
color _fg4(color col){
  color retval = col/(256*128)%cv;
  return retval; 
}

color _fb4(color col){
  color retval = col/(65536)%cv;
  return retval; 
}



color _fr2(color col){
  color retval = col >> 16 & 0xff;
  return retval; 
}
color _fg2(color col){
  color retval =col >> 8 & 0xff;
  return retval; 
}

color _fb2(color col){
  color retval = col  & 0xff;
  return retval; 
}

public int picsavecount;
void keyPressed(){
  if (key=='s' && !online){
    picsavecount++;
    save(drive+"data\\knots"+str(picsavecount)+".png");
  }
  if (key==ESC){
    key='1'; 
  }
  if (key=='E'){
    exit(); 
  }
  if (key=='m')metal = !metal;
  if (key=='e' && !online){
    picsavecount++;
    save(drive+"data\\knots"+str(picsavecount)+".png");
    background(-1);
    set(0,0,color(picsavecount,255,255));
    set(0,1,color(mouseX,mouseY,255));
    save(picsave);
    exit();
 
  }
  if (key=='l')dolines = !dolines;
  if (key=='z')doellipses = !doellipses;
  if (key=='a')auto=!auto;
  if (key=='q')harukitmode = 1;
  if (key=='w')harukitmode = 2;
  if(key=='2')gmode=2;
  if(key=='3')gmode=3;
  if(key=='4')gmode=4;
  if(key=='5')gmode=5;
  if (key=='v')vnorm = !vnorm;
  if (key=='c')constant = !constant;

}
public boolean vnorm = false;


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

    forward=false;
    mouseReleased();

  }


  if (px<0)   { 
    forward = true;
    mouseReleased();
  }
  if (py>height){

    up     = true;
    mouseReleased();

  }
  if (py<0     ){

    up     = false;
    mouseReleased();
  }
} 


void flick(PImage a,PImage b){
  for (int x=0;x<a.pixels.length;x++){
    color c = a.pixels[x];
    b.pixels[x]=color(_fr4(c),_fg4(c),_fb4(c),_fr4(c));
  } 

}




