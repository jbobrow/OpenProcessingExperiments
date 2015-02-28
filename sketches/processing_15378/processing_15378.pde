


import processing.video.*;
public int pn=0;

public String savename ="k-teary_eye-";
MovieMaker mm;
public boolean firstpass = true;
public int frate = 15; 
public boolean inc = true;
public boolean addmovframe = true;
public boolean dovid =false;
public boolean looponce = false;
public boolean snap = true;

void saveget(){
  setupvid();
  if (dovid){
    if (inc){
      pn++;
    }


    save(savename+str(pn)+".png");
  }

  if (addmovframe){
    mm.addFrame();
  }

  if (looponce){
    noLoop();
    exit();
  }

  if (keyPressed ==true && ( key=='`' || key =='~' || key == ESC)){
    mm.finish();
    exit();
  }

}

void setupvid(){
  if (firstpass)
  {
    mm = new MovieMaker(this, width, height, savename+".mov", frate,
    MovieMaker.ANIMATION, MovieMaker.LOSSLESS);

    if (snap){
      save("snap"+savename+str(pn)+".png");
    }
    firstpass = false;


  }
}


void loop(){

  saveget();  //uncomment to save video

}



int t,x,X,Y,c,w=300,m;
PImage a,cx,flesh;
public color col;
public String file="eye3.jpg";
public boolean baseblue = false;
void keyPressed(){
  if (key=='b')baseblue = !baseblue; 
  if (!online){
    if (key=='s')save("teary_eye"); 
  }
}

public color [] A,B;
public int preferredsize;
void setup(){
  preferredsize=355;
  a=loadImage(file);
  if(a.width !=preferredsize || a.height !=preferredsize)a.resize(preferredsize,preferredsize);
  w=a.width;
  size(355,355,P3D);
  loadPixels();
  cx=createImage(width,height,ARGB);
  flesh=createImage(width,height,ARGB);
  A=new color[width*height];
  B=new color[width*height];
 
}
void draw()
{
  if (!baseblue)A=new  color [width*height];
  if (baseblue)A=pixels;
  t++;
 
  image(a,0,0);
  for(x=0;++x<w*w;){
    X=x%w+n();
    Y=x/w+n();
    if (X<1 || Y<1 || X> width-1|| Y > height-1)
    {
      c = a.get(X,Y);
      col = color(c,c,c*2);

     
      cx.set(X,Y,col);
      
    }
    else
    {
     
      c=a.pixels[X+width*Y];
      if (!baseblue)col = color(_fr2(c),_fg2(c),_fb2(c));
      
      if(baseblue)col = c;
      A[x]=col;
      if (!baseblue)  flesh.pixels[x]= color(_fr2(c),_fg2(c),_fb2(c),133);
      if(baseblue) flesh.pixels[x]=color(c,133);
    }

  
  }
  arraycopy(A,cx.pixels);

  image(flesh,0,0);
  // loop(); //uncomment to save video
}




int n(){
  return int(noise(x%w/99f,x/w/99f,t/99f+m++%2)*w-w/2);
}

color _fr2(color colx) {return  colx >> 16 & 0xff;}
color _fg2(color colx) {return  colx >> 8 & 0xff;}
color _fb2(color colx) {return  colx  & 0xff;}




