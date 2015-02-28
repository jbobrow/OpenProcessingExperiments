
//December 17th 2009
//Pixel Pull
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;

int cubsize = 8; //(8+16)/2; //4-bit
int mode =1;
//public String file = "loading2.gif";
//public String file = "a.png";
//public String file = "5s.png";
public String file = "5s.png";
//public String file = "http://www.google.com/intl/en_ALL/images/logo.gif";
//public String file = "http://openprocessing.org/visuals/applets/visual0e9019479c743f134337ec58631f6f5b/smallImage.jpg";
public String file2 = "http://openprocessing.org/images/processingLogo.jpg";
public boolean gcam = true;
PImage l,v,v2,v3,bbg;
import processing.opengl.*;
boolean sbox = false;
int w,h;

void setup(){
  w=300;
  h = 300;
  //v3= loadImage("loading.gif");

  bbg= new PImage(w,h);
  makebg(true,false,random(400));
  //size(600,600,OPENGL) ;

  l = new PImage(w,h);
  //v = loadImage(file);
  //v2= loadImage(file2);

    v = new PImage(w,h);
    v2 = new PImage(w,h);
    v3 = new PImage(w,h);

    makebg(true,false,random(0,255));
    arrayCopy(bbg.pixels,v.pixels);
   makebg(true,true,0);
    arrayCopy(bbg.pixels,v2.pixels);
makebg(true,true,mouseX);
    arrayCopy(bbg.pixels,v3.pixels);
 size(w,h,P3D);
  v.resize(width,height);
  v2.resize(width,height);
  bbg.resize(width,height);
  arrayCopy(bbg.pixels,l.pixels);
  if (gcam){
    cam = new PeasyCam (this,width);
  }
}
int x;
void draw(){

  if (!gcam){
    cam = null; 
  }

  background(255);
  fill(233,23,23,23);
  noStroke();

  if (!gcam){
    translate(cubsize/2,cubsize/2);

  }
  else
  {
    rotateX(radians(0));
    translate(-width/2,-height/2);


  }

  for (float y=0;y<height;y+=cubsize){
    translate(0,y);
    for (float x=0;x<width;x+=cubsize){

      if (!mousePressed && ( ( mouseX >x && mouseX<x+cubsize) && (mouseY>y && mouseY <y+cubsize) ) ){
        translate(x,0);// if (x
        fill(233,23,23,46+23);
        //  fill(l.get((int)x,(int)y));
        if(sbox){
          box(cubsize,cubsize,cubsize); 
        }
        else
        {
          rect(0,0,cubsize,cubsize);  
          stroke(233,23,23,46+23);
          line (0,0,0,0,0,-10);
          line (0+cubsize,0,0,0+cubsize,0,-10);
          line (0+cubsize,0+cubsize,0,0+cubsize,0+cubsize,-10);
          line (0,0+cubsize,0,0,0+cubsize,-10);
        }
        noStroke();

        translate(-x,0);
      }
      else
      {
        // fill(233,23,23,46);
        noStroke();
        if (mode ==1){
          fill(l.get((int)x,(int)y));
        }
        if (mode ==2){
          fill(v.get((int)x,(int)y));
        }
        if (mode ==3){
          fill(v2.get((int)x,(int)y));
        }

        if (mode ==4){
          fill(v3.get((int)x,(int)y));
        }
        translate(x,0,-10);
        if(sbox){
          box(cubsize,cubsize,cubsize);  
        }
        else
        {
          rect(0,0,cubsize,cubsize);  
        }
        translate(-x,0,10);

      }
    }
    translate(0,-y);
  }

}

void keyPressed(){
  if (key=='+'){
    cubsize++;  
  }

  if (key=='-'){
    cubsize--;  
  }

  if (cubsize<1){
    cubsize = 1; 
  }

  if (cubsize > width/2) {  

    cubsize =  width/2;  

  }

  if (key=='c'){
    gcam = !gcam; 
    setup();
  }


  if (key=='1'){
    mode=1; 
  }
  if (key=='2'){
    makebg(true,true,mouseX+mouseY);
    arrayCopy(bbg.pixels,v.pixels);
    mode=2;  
  }
  if (key=='3'){
    makebg(true,true,mouseY);
    arrayCopy(bbg.pixels,v2.pixels);
    mode=3;
  }
  if (key=='4'){
    makebg(true,true,mouseX);
    arrayCopy(bbg.pixels,v3.pixels);
    mode=4;
  }

  if (key =='b'){
    sbox = !sbox; 
  }

save("cubesv2.png");
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




