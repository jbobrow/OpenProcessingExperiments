

public boolean dosmooth = false;
public boolean dolines = true;
public boolean vertical = false;
public boolean bg = true;

public boolean invert = false;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
import processing.opengl.*;
public int w,h;
PImage a ,b,c,bbg,showpic;
public String rmode = "P3D";
public int intervalx = 2;
public int intervaly = 2;
void setup(){

  a = loadImage("a.png");
 b = loadImage("cabinetcover.png");
 c = loadImage("c.png");

  //size(a.width,a.height,P3D);
  if (rmode=="P3D")size(400,400,P3D);
  if (rmode=="OPENGL")size(400,400,OPENGL);
  showpic = loadImage("cabinetcover.png");
   if (showpic.width != width || showpic.height != height){
  showpic.resize(width,height); 
  
   }
  w = width;
  h = height;
  bbg= new PImage(w,h); 
  //hint(ENABLE_OPENGL_4X_SMOOTH);
  lights();
  cam = new PeasyCam(this,width);
  makebg(true,false,random(0,255));


}
public int interval = 25;
public color n,l;

void li(){

  fill(233,23,23,23); 
  for (int x=0;x<width;x+=interval){
    fill(233,23+x,23,23);
    n = color(233,23+x,23,23);
    fill(n);
    for (int y=0;y<height;y+=2){
      //fill(blendColor(bbg.get(x,y),n,ADD)); 
      //fill(255-y,23-x,23,x); 
      color l = color(255,23-x,23,x); 
      //fill(blendColor(n,l,OVERLAY));
      // stroke(255-y,y,23,x); 
      noStroke();
      beginShape(QUADS );
      vertex(x,cos(y),sin(x));
      vertex(x-interval,y,cos(y));
      vertex(x-interval,y-interval,cos(y));
      vertex(x,y-interval,cos(y)); 
      endShape();
    }

  }
}




void li2(){

  fill(233,23,23,23); 
  for (int x=0;x<width;x+=interval){
    fill(233,23+x,23,23);
    n = color(233,23+x,23,23);
    fill(n);
    for (int y=0;y<height;y+=2){

      color l = color(255,23+mouseX,23+mouseX,23); 

      fill(l);

      noStroke();
      beginShape(QUADS );
      vertex(x,cos(y),sin(x));
      vertex(x-interval,y,cos(y));
      vertex(x-interval,y-interval,cos(y));
      vertex(x,y-interval,cos(y)); 
      endShape();
    }

  }
}

void li3(){

  fill(233,23,23,23); 
  for (int x=0;x<width;x+=interval){
    fill(233,23+x,23,23);
    n = color(233,23+x,23,23);
    fill(n);
    for (int y=0;y<height;y+=2){

      //color l = color(255,23+mouseX,23+mouseX,23); 
      // color l = color(255-y,23-x,23);
      color l = color(33,23+x,23,23);
      fill(l);

      noStroke();
      beginShape(QUADS );
      vertex(x,cos(y),sin(x));
      vertex(x-interval,y,cos(y));
      vertex(x-interval,y-interval,cos(y));
      vertex(x,y-interval,cos(y)); 
      endShape();
    }

  }
}
void li4(){

  fill(233,23,23,23); 
  //for (int y=0;y<height;y+=intervaly){//2

  for (int x=0;x<width;x+=intervalx){

    fill(233,23+x,23,23);
    n = color(233,23+x,23,23);
    fill(n);
    for (int y=height;y>0;y-=intervaly){
      // for (int y=0;y<height;y+=intervaly){//2
      // for (int y=0;y<height;y+=intervaly){//2
      //color l = color(255,23+mouseX,23+mouseX,23); 
      // color l = color(255-y,23-x,23);
      //color l = color(233,23,23-x,23);
      //      fill(l);

      noStroke();
      beginShape(QUADS );
      vertex(x,cos(y),sin(x));
      vertex(x-interval,y,cos(y));
      vertex(x-interval,y-interval,cos(y));
      vertex(x,y-interval,cos(y)); 
      endShape();
    }

  }
}
int vv;
void draw(){  
  vv++;
  if (vertical) rotateZ(radians(90));
  background(showpic);
  
  if (bg)  background(bbg);
  if (dosmooth)smooth();
  if (!dosmooth)noSmooth();
  translate(-width/2-300,-height/2-150,0);
  li(); 
  stroke(1);
  if (dolines)line(mouseX,0,mouseX,height);
  translate(width,0,0);
  li2();
  translate(-width,height,0);
  li4();
  translate(width,0,0);
  li3();
  if (dolines){
    for (int x=0;x<width;x++){
      set(x,mouseY,bbg.pixels[x]); 

    }

    for (int y=0;y<height;y++){
      set(mouseX,y,bbg.pixels[y]); 

    }
  }

  if (invert)filter(INVERT);

}


int cpass=0;  
void makebg(Boolean animate, Boolean invert,float pval){  

  bbg.loadPixels();  
  color colx = 0;  
  for(int y=0;y<height;y++){  
    for(int x=0;x<width;x++){  
      int pos=y*width+x;  
      color col = bbg.pixels[pos] ;//  
      colx = color(height-y,x,y-x);   
      if (animate){  
        //colx = color(height-y,X,cpass+y);   
        colx = color(height-y,x,cpass-X);   
        //  colx = color(mouseY-y,x,cpass+y);   
      }  

      if (pval>0){ 
        colx = color(pval-x,y,pval+y); 
      } 


      float rr= red(colx);  
      float bb= blue(colx);  
      float gg= green(colx);  

      rr = colx >> 16 & 0xff;  
      gg = colx >> 8 & 0xff;  
      bb = colx  & 0xff;  
      //        for(int i=0;i<4;i++){  
      //          dis =dist(p[i].xpos,p[i].ypos,x,y)/2;  
      //          rr += cc[0]/dis-gain;  
      //          gg += cc[1]/dis-gain;  
      //          bb += cc[2]/dis-gain;  
      //        }  
      if (!invert)    {   
        bbg.pixels[pos]=color(rr,gg,bb); 
      }  
      if (invert)   {    
        bbg.pixels[pos]=-color(rr,gg,bb); 
      }  
    }  
    //  arraycopy(v3.pixels,bbg.pixels);
    bbg.updatePixels();  
    ////    if (!online){  
    //    arraycopy(bbg.pixels,water.pixels);   
    ////    }  
  }  
  if (animate){  
    cpass++;   
  }  
  if (cpass>4000){   
    cpass=0;    
  }   


}  

void keyPressed(){
  if (key=='s')dosmooth=!dosmooth; 

  if (key=='i')interval = mouseX;
  if (key =='l')dolines = !dolines;
  if (key=='I')invert= !invert;
  if (key=='b')bg= !bg;
  if (mouseX >2 && mouseY> 2){
    if (key =='x')intervalx =mouseX;
    if (key =='v') vertical = !vertical;
    if (key =='y')intervaly = mouseY;
  }
  
  if (key=='a'){
   showpic = loadImage("a.png");
     if (showpic.width != width || showpic.height != height){
  showpic.resize(width,height); 
  
   }
  }
  
    if (key=='d'){   showpic = loadImage("cabinetcover.png");
   if (showpic.width != width || showpic.height != height){
  showpic.resize(width,height); 
  
   }

    }
    
      if (key=='c'){
         showpic = loadImage("c.png");
   if (showpic.width != width || showpic.height != height){
  showpic.resize(width,height); 
  
   }

}

if (key=='n'){
  
 showpic= new PImage(width,height); 
}

}


