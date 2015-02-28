
int numberofbuttons= 90;
int factor = 3;
public float [] karlred = new float [numberofbuttons];
int nob = numberofbuttons;
PImage dotlocs;
public float [] karlgreen = new float[nob];
public float [] karlblue = new float [nob];
public boolean randombuttons = true;
PImage a,b,c,d,f;
public color [] nowbuttonlocations = new color [nob];
public color[] nbloc = new color [nob];
PVector [] nblocv = new PVector [nob];

  PImage mapp;

boolean createlocimg=false;
PImage dotloc;
void updateimg(int loc,int put){
  
  dotloc.pixels[put]=loc;
}
void saveimg(){
 PGraphics k = createGraphics(10,9,P3D);
 k.loadPixels();
 k.beginDraw();
 arraycopy(dotloc.pixels,k.pixels);
 k.updatePixels();
 k.endDraw();
 
 k.save("dotus.png");
}
 
void setup(){
  if(createlocimg){
   dotloc=createImage(10,9,ARGB);
   
  }
   if(!createlocimg)
  {
    
    dotloc=loadImage("dotus.png");
 
   
    
  }
 
  mapp=loadImage("america.png");
 
     for(int i =0;i<mapp.pixels.length;i++){
      color c = mapp.pixels[i];
     float bb = c&255;
     int k = int(bb/5)*5;
     float rr = c>>8&255;
     float gg = c>>16&255;

     mapp.pixels[i]=color(bb,bb,bb);
     
     }

  if (randombuttons  && createlocimg){
    for (int i=0;i<nob;i++){
  
      nbloc[i]=color(random(width),random(height),255);
      nblocv[i]=new PVector(0,0);
      
    }
    
  }
  if(!createlocimg){
    
   for(int i =0;i<nob;i++){
    nbloc[i]=dotloc.pixels[i];
    int y = int(i/dotloc.width);
    int x = i-(y*dotloc.width);
nblocv[i]=new PVector(x,y);
   
 
   } 
  }
  int _a=0;
  int _b=15;
  int _c=30;
  int _d = 45;
  if (!randombuttons){
    for (int i=0;i<width;i+=45){
      nbloc[_a]=color(45+(i/2),45,255);
      _a++;
      nbloc[_b]=color(45+(i/2),height-45,255);
      _b++;
      nbloc[_c]=color(45,45+(i/2),255);
      _c++;
      nbloc[_d]=color(width-45,45+(i/2),255);

      _d++;
    }
  }
  size(765,765,JAVA2D);
   mapp.resize(width,height);
  smooth();

  placebuttons();
  
}
  int closest = 0;
  PVector  [] nblocvline = new PVector [nob];
  
  int findclosest(int which){
    
   int retval = 0;
    float mindi = dist(nblocv[which].x,nblocv[which].y,nblocv[0].x,nblocv[0].y);
    for (int i =0;i<nob;i++){
    float di = dist(nblocv[which].x,nblocv[which].y,nblocv[i].x,nblocv[i].y);
    if(di<=mindi && i!=which ){
      mindi=di;
      retval =i;
    }
 
  }

   return retval;
  
  }
  
  void drawlinestoclosest(){
   
   for (int i=0;i<nob;i++){
     PVector now = nblocv[i];
     
       int kew = findclosest(i);
       nblocvline[i]=nblocv[kew];
       
   } 
   for (int i =0;i<nob;i++){
    line(int(nblocvline[i].x*factor),int(nblocvline[i].y*factor),(int)nblocv[i].x*factor,(int)nblocv[i].y*factor); 
   }
  }
  
void draw(){
  closest =0;
  background(-1);
  image(mapp,0,0);
  placebuttons();
  nowcolor = get(mouseX,mouseY);
  float mindi=dist(nblocv[0].x,nblocv[0].y,mouseX,mouseY);
 //  if(!createlocimg){
  for (int i =0;i<nob;i++){
    float di = dist(nblocv[i].x,nblocv[i].y,mouseX/factor,mouseY/factor);
    if(di<mindi ){
      mindi=di;
      closest =i;
    }

 }
  noFill();
 ellipse(nblocv[closest].x*factor,nblocv[closest].y*factor,20,20);
  


drawlinestoclosest();
 
   //}
}
  
void placebuttons(){
  for (int i=0;i<nob;i++){
    //int x=red(
    karlred[i]=red(nbloc[i]);
    karlgreen[i]=green(nbloc[i]);
    karlblue[i]=blue(nbloc[i]);
    float x= karlred[i];
    float y  = karlgreen[i];
    float z = karlblue[i];
    fill(x,y,z);
    ellipseMode(CENTER);

    nblocv[i].x=x;
     nblocv[i].y=y;
     ellipse(nblocv[i].x*factor,nblocv[i].y*factor,10,10);
    if(!createlocimg)point(x*factor,y*factor);
  }
}
boolean mr=false;
boolean mu=true;
  
void mousePressed(){
  mr=false;
  mu=false;
  domove();
}
public color nowcolor;
void domove(){
  if (!mu){
    for (int i=0;i<nob;i++){
      if (nowcolor == nbloc[i]){
        nbloc[i]=nowcolor;
      }
    }
  }
}
void mouseDragged(){
  mu=false;
  mr=false;
  for (int i=0;i<nob;i++){
    if (nowcolor == nbloc[i]){
      nowcolor = color(mouseX/factor,mouseY/factor,255);
      nbloc[i]=nowcolor;
       updateimg(nowcolor,i);
    }
  }
 
}
  
void mouseReleased(){
 
  mu=true;
  mr = true;
}

void keyPressed(){
 if(key=='s'|| key=='S')saveimg(); 
  if(key=='r')setup();

}



