


int IMGHEIGHT;
int IMGWIDTH;

int iStep=10;

  int x=20;

PImage[] images = new PImage[7];
float[] weight=new float [7];
float[] inc=new float [7];
void setup() 
{
  int i;
 
  String p;
  IMGHEIGHT=800;
  IMGWIDTH=533;

  frameRate(10);
 
    for(i=0;i<images.length;i++){
       p=str(int(random(x)+1));
      images[i] = loadImage(p+".jpg");
      weight[i]=random(100);
      inc[i]=random(iStep)-iStep/2;
    }



  size(IMGWIDTH,IMGHEIGHT);
  background(0);

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




  for(i=0;i<images.length;i++){
    weight[i]=weight[i]+inc[i];
   if (weight[i]<=0){
     weight[i]=1;
     inc[i] = inc[i] * -1;
     p=str(int(random(x)+1));
      images[i] = loadImage(p+".jpg");
      inc[i]=random(iStep)-iStep/2;
    
   } 
      if (weight[i]>=200){
     weight[i]=200;
     inc[i] = inc[i] * -1;
    
   } 
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
                  
                                   r=red(images[i].pixels[sub]);
                       g=green(images[i].pixels[sub]);
                     b=blue(images[i].pixels[sub]);
                     
        r=r*r/200;
          g=g*g/200;
          b=b*b/200;
         
          if (r>255){r=255;};
 if (g>255){g=255;};
  if (b>255){b=255;};
  
 if(i%7==0){
                                   
                    sumR=sumR+r*weight[i];
                     sumG=sumG+g*weight[i];
                      sumB=sumB+b*weight[i];
  }              
             
   if(i%7==4){
                      sumB=sumB+b*weight[i];
                        sumR=sumR+r*weight[i];
  }                  
  if(i%7==5){
                     sumB=sumB+b*weight[i];
                      sumG=sumG+g*weight[i];
                   }
     if(i%7==6){
                                   
                    sumR=sumR+r*weight[i];
                     sumG=sumG+g*weight[i];
  }              
             
   if(i%7==1){
                       sumG=sumG+g*weight[i];
  }                  
  if(i%7==2){
                     sumB=sumB+b*weight[i];
                   }
   if(i%7==3){
                     sumR=sumR+r*weight[i];
                   }                  
            
                      totalWeight=totalWeight+weight[i];
                      
                   }
                   
                   
                  pixels[sub]=color(int((sumR/totalWeight)),int((sumG/totalWeight)),int((sumB/totalWeight)) );
      
    }
     updatePixels(); 

     
 }




  
 
  
}
 void keyPressed()
{
  if ( key == 's' ) save(str(millis())+".jpg");
    if ( key == 'r' ) setup();
}

   void stop()
{

     super.stop();
}

