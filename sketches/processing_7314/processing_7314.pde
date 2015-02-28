

int IMGHEIGHT;
int IMGWIDTH;



  int x=3;

PImage[] images = new PImage[12];
float[] weight=new float [12];
float[] inc=new float [12];
int[] disp=new int[12];
void setup() 
{
  int i;

  String p;
  IMGHEIGHT=540;
  IMGWIDTH=900;

  frameRate(10);
 
    for(i=0;i<images.length;i++){
       p=str(int(random(x)+1));
       p=str(int(i%3+1));
      images[i] = loadImage(p+".jpg");
      weight[i]=random(100);
      inc[i]=random(50)-25;
      if(i%3==1){
        disp[i]=int(int(random(100,IMGHEIGHT-300))*IMGWIDTH)+int(random(IMGWIDTH-650));
     
      }
      else{
      disp[i]=int(int(random(0,150))*IMGWIDTH)+int(random(IMGWIDTH-650));
              if(random(100)<50){
          disp[i]=disp[i]+230*IMGWIDTH;
        }
      }
  }



  size(IMGWIDTH,IMGHEIGHT);
  background(255,255,255);
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
    int sub2=0;
  int i;
  float r;
  float g;
  float b;

  float sumR;
  float sumG;
  float sumB;
  
  float totalWeight;




  for(i=0;i<images.length;i++){
    weight[i]=weight[i]+inc[i];
   if (weight[i]<=0){
     weight[i]=1;
     inc[i] = inc[i] * -1;
     p=str(int(random(x)+1));
      p=str(int(i%3+1));
      images[i] = loadImage(p+".jpg");
      inc[i]=random(50)-25;
           if(i%3==1){
        disp[i]=int(int(random(100,IMGHEIGHT-300))*IMGWIDTH)+int(random(IMGWIDTH-650));
     
      }
      else{
      disp[i]=int(int(random(0,150))*IMGWIDTH)+int(random(IMGWIDTH-650));
        if(random(100)<50){
          disp[i]=disp[i]+230*IMGWIDTH;
        }
      }
   } 
      if (weight[i]>=200){
     weight[i]=200;
     inc[i] = inc[i] * -1;
    
   } 
  }
    loadPixels();
   for (rows=0;rows<IMGHEIGHT;rows++){
      for (cols=0;cols<IMGWIDTH;cols++){
             
                   
                   sub=int(rows*IMGWIDTH) + cols;
                  sumR=0;
                   sumG=0;
                   sumB=0;
                   totalWeight=0;
                   
                 for(i=0;i<images.length;i++){
                   totalWeight=totalWeight+weight[i];
                 }
                            r=0;
                   g=0;
                   b=0;
          
                   r=red(pixels[sub])*totalWeight;
                 
                    g=green(pixels[sub])*totalWeight;
              
                     b=blue(pixels[sub])*totalWeight;
                 
               
                  
                   
                sumR=sumR+r;
                  sumG=sumG+g;
                   sumB=sumB+b;
                
                   
                   for(i=0;i<images.length;i++){
   
                  sub2=sub-disp[i];
                  //sub2=sub;
                  if (sub2<0){
                    sub2=sub2+IMGHEIGHT*IMGWIDTH;
                  }
                   r=0;
                   g=0;
                   b=0;
                   
                     
                     
                     r=red(images[i].pixels[sub2]);
                   
                     g=green(images[i].pixels[sub2]);
                     
                     b=blue(images[i].pixels[sub2]);
                   
                     sumR=sumR+r*weight[i]*r/255;
                  
             
                     sumG=sumG+g*weight[i]*g/255;
         
                   
                     sumB=sumB+b*weight[i]*b/255;
      
                   
                     totalWeight=totalWeight+weight[i];
                    
                  }  
                   
                  pixels[sub]=color(int((sumR/totalWeight)),int((sumG/totalWeight)),int((sumB/totalWeight)) );
               
    }
     updatePixels(); 

     
 }




  
 
  
}
 void keyPressed()
{
   // if ( key == 's' ) save(str(millis())+".jpg");
    if ( key == 'r' ) setup();
}

