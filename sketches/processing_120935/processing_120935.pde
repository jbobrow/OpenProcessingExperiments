

int IMGHEIGHT;
int IMGWIDTH;

import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int y=16;
  int x=73;
Minim[] minim=new Minim[4];
AudioSnippet[] snippet=new AudioSnippet[4];

PImage[] images = new PImage[4];
float[] weight=new float [4];
float[] inc=new float [4];
void setup() 
{
  int i;
  int j;
  String p;
  IMGHEIGHT=450;
  IMGWIDTH=600;

  frameRate(10);
    for(i=0;i<images.length;i++){
      p=str(int(random(x)+1));
      images[i] = loadImage(p+".jpg");
      weight[i]=random(100);
      inc[i]=random(4)-2;
            minim[i] = new Minim(this);
                j=int(random(y)+1);
        snippet[i] = minim[i].loadSnippet(j+".mp3");
    
     
    snippet[i].loop();
    
    
      snippet[i].setPan(random(-1,1));
      snippet[i].setGain(0);
    }



  size(600,450);
  background(0);
  //noLoop();
}
void draw()
{

  String p;
   
 int k;
  int cols;
  int rows;
  boolean bStarted;
  bStarted=false;
  int sub;
  int i;
  float r;
  float g;
  float b;

  float sumR;
  float sumG;
  float sumB;
  
  float totalWeight;

int j;


  for(i=0;i<images.length;i++){
    weight[i]=weight[i]+inc[i];
   if (weight[i]<=0){
     weight[i]=1;
     inc[i] = inc[i] * -1;
     p=str(int(random(x)+1));
      images[i] = loadImage(p+".jpg");
      inc[i]=random(4)-2;
            snippet[i].close();

      minim[i].stop();
 
               j=int(random(y)+1);
        snippet[i] = minim[i].loadSnippet(j+".mp3");
    
     
    snippet[i].loop();
     snippet[i].setPan(random(-1,1));
      snippet[i].setGain(0);
    
   } 
      if (weight[i]>=200){
     weight[i]=200;
     inc[i] = inc[i] * -1;
    
   } 
   snippet[i].setGain( weight[i]/12-10);
  }
    loadPixels();
   for (rows=0;rows<IMGHEIGHT;rows++){
      for (cols=0;cols<IMGWIDTH;cols++){
             
                   
                   sub=(rows*IMGWIDTH) + cols;
                  sumR=0;
                   sumG=0;
                   sumB=0;
                   totalWeight=0;
                 for(i=0;i<images.length;i++){
                   totalWeight=totalWeight+weight[i];
                 }
                   
           
                   
                   
                   r=red(pixels[sub])*totalWeight;
                    g=green(pixels[sub])*totalWeight;
                    
                     b=blue(pixels[sub])*totalWeight;
                    
                  
                   
                  sumR=sumR+r;
                    sumG=sumG+g;
                     sumB=sumB+b;
                     
                   for(i=0;i<images.length;i++){
                  
                    r=red(images[i].pixels[sub])*weight[i];
                     g=green(images[i].pixels[sub])*weight[i];;
                     b=blue(images[i].pixels[sub])*weight[i];
                                         
                                        sumR=sumR+r;
                                        sumB=sumB+b;
                                        sumG=sumG+g;
                                        
                     
                     totalWeight=totalWeight+weight[i];
                   }

                  pixels[sub]=color(int(sumR/totalWeight),int(sumG/totalWeight),int(sumB/totalWeight) );
      
    }
     updatePixels(); 

     
 }




  
 
  
}
 void keyPressed()
{

    if ( key == 'r' ){
           for(int i=0;i<inc.length;i++){
  
      snippet[i].close();

      minim[i].stop();
 

   } setup();
    }
}

   void stop()
{
   for(int i=0;i<inc.length;i++){
  
      snippet[i].close();

      minim[i].stop();
 

   }
     super.stop();
}
          

